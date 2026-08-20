import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/providers/providers.dart';
import '../../../../core/models/negotiation_model.dart';
import '../../../../core/constants/firestore_collections.dart';
import '../../../../app/theme/app_colors.dart';

class NegotiationScreen extends ConsumerStatefulWidget {
  final String productId;
  final String farmerId;
  
  const NegotiationScreen({
    super.key,
    required this.productId,
    required this.farmerId,
  });

  @override
  ConsumerState<NegotiationScreen> createState() => _NegotiationScreenState();
}

class _NegotiationScreenState extends ConsumerState<NegotiationScreen> {
  final _offerController = TextEditingController();
  bool _isLoading = false;

  Future<void> _submitOffer() async {
    final offerAmount = double.tryParse(_offerController.text.trim());
    if (offerAmount == null || offerAmount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Enter a valid offer amount')));
      return;
    }

    final user = ref.read(currentUserProvider);
    if (user == null) return;

    setState(() => _isLoading = true);

    try {
      final firestoreRepo = ref.read(firestoreRepositoryProvider);
      final negotiationId = firestoreRepo.generateDocId(FirestoreCollections.negotiations);

      final initialMessage = NegotiationMessage(
        senderId: user.uid,
        message: 'Initial offer of ₹$offerAmount per unit.',
        proposedPrice: offerAmount,
        timestamp: DateTime.now(),
      );

      final negotiation = NegotiationModel(
        negotiationId: negotiationId,
        farmerId: widget.farmerId,
        buyerId: user.uid,
        productId: widget.productId,
        currentOfferPrice: offerAmount,
        currentOfferBy: user.uid,
        status: DealStatus.negotiating,
        messages: [initialMessage],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await firestoreRepo.setDocument(
        collection: FirestoreCollections.negotiations,
        documentId: negotiationId,
        data: negotiation.toJson(),
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Offer sent successfully!')));
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Make an Offer')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Propose your price for this bulk order:', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 24),
            TextField(
              controller: _offerController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Your Offer Price / Unit (₹)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.currency_rupee),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _submitOffer,
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: Colors.white),
                child: _isLoading 
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Send Offer', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
