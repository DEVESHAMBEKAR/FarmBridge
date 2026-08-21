import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/models/negotiation_model.dart';
import '../../../../core/constants/firestore_collections.dart';
import '../../../../core/repositories/firestore_repository.dart';
import '../../../../app/theme/app_colors.dart';

class NegotiationChatScreen extends ConsumerStatefulWidget {
  final String negotiationId;
  const NegotiationChatScreen({super.key, required this.negotiationId});

  @override
  ConsumerState<NegotiationChatScreen> createState() => _NegotiationChatScreenState();
}

class _NegotiationChatScreenState extends ConsumerState<NegotiationChatScreen> {
  final _messageController = TextEditingController();
  final _priceController = TextEditingController();

  Future<void> _sendCounterOffer(NegotiationModel negotiation, String currentUserId) async {
    final price = double.tryParse(_priceController.text.trim());
    if (price == null || price <= 0) return;

    final newMessage = NegotiationMessage(
      senderId: currentUserId,
      message: _messageController.text.trim().isEmpty ? 'Counter offer of ₹$price' : _messageController.text.trim(),
      proposedPrice: price,
      timestamp: DateTime.now(),
    );

    final updatedMessages = List<NegotiationMessage>.from(negotiation.messages)..add(newMessage);

    await ref.read(firestoreRepositoryProvider).updateDocument(
      collection: FirestoreCollections.negotiations,
      documentId: negotiation.negotiationId,
      data: {
        'current_offer_price': price,
        'current_offer_by': currentUserId,
        'messages': updatedMessages.map((m) => m.toJson()).toList(),
        'updated_at': FieldValue.serverTimestamp(),
      },
    );

    _messageController.clear();
    _priceController.clear();
  }

  Future<void> _acceptOffer(NegotiationModel negotiation, String currentUserId) async {
    // Transition to AGREED and create a DEAL
    final firestore = ref.read(firestoreRepositoryProvider);
    final dealId = firestore.generateDocId(FirestoreCollections.deals);
    
    final batch = <BatchOperation>[];
    
    batch.add(BatchOperation.update(
      collection: FirestoreCollections.negotiations,
      documentId: negotiation.negotiationId,
      data: {
        'status': DealStatus.agreed,
        'deal_id': dealId,
        'updated_at': FieldValue.serverTimestamp(),
      }
    ));

    batch.add(BatchOperation.set(
      collection: FirestoreCollections.deals,
      documentId: dealId,
      data: {
        'deal_id': dealId,
        'negotiation_id': negotiation.negotiationId,
        'farmer_id': negotiation.farmerId,
        'buyer_id': negotiation.buyerId,
        'product_id': negotiation.productId,
        'agreed_price': negotiation.currentOfferPrice,
        'status': DealStatus.agreed,
        'payment_status': 'PENDING',
        'logistics_status': 'PENDING',
        'created_at': FieldValue.serverTimestamp(),
        'updated_at': FieldValue.serverTimestamp(),
      }
    ));

    await firestore.batchWrite(batch);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Offer Accepted! Deal Created.')));
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(currentUserProvider);
    if (user == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));

    // We'll listen to the specific negotiation document stream
    final negotiationStream = ref.watch(firestoreRepositoryProvider).getDocumentStream(
      collection: FirestoreCollections.negotiations,
      documentId: widget.negotiationId,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Negotiation Room')),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: negotiationStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          if (!snapshot.data!.exists) return const Center(child: Text('Negotiation not found.'));

          final negotiation = NegotiationModel.fromJson(snapshot.data!.data()!);
          final isMyTurn = negotiation.currentOfferBy != user.uid && negotiation.status == DealStatus.negotiating;

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: negotiation.messages.length,
                  itemBuilder: (context, index) {
                    final msg = negotiation.messages[index];
                    final isMe = msg.senderId == user.uid;
                    return Align(
                      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isMe ? AppColors.primaryContainer : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(msg.message, style: TextStyle(color: isMe ? AppColors.onPrimaryContainer : Colors.black87)),
                            const SizedBox(height: 4),
                            Text('Proposed: ₹', style: const TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (negotiation.status == DealStatus.agreed)
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.green.shade100,
                  width: double.infinity,
                  child: const Center(child: Text('DEAL AGREED!', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 18))),
                )
              else if (isMyTurn)
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => _acceptOffer(negotiation, user.uid),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                              child: const Text('Accept Offer'),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {}, // Add reject logic later
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
                              child: const Text('Reject'),
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 32),
                      const Text('Or propose a Counter Offer:'),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: _priceController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(hintText: 'Price', prefixText: '₹'),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 2,
                            child: TextField(
                              controller: _messageController,
                              decoration: const InputDecoration(hintText: 'Message (optional)'),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.send, color: AppColors.primary),
                            onPressed: () => _sendCounterOffer(negotiation, user.uid),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              else if (negotiation.status == DealStatus.negotiating)
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.grey.shade100,
                  width: double.infinity,
                  child: const Center(child: Text('Waiting for other party to respond...')),
                ),
            ],
          );
        },
      ),
    );
  }
}
