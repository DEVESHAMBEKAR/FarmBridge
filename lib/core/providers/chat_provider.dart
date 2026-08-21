import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/chat_model.dart';
import '../constants/firestore_collections.dart';
import 'firebase_providers.dart';
import 'user_provider.dart';

// --- Chat Stream ---

/// Streams all chat conversations for the authenticated user.
final userChatsProvider = StreamProvider<List<ChatModel>>((ref) {
  final authUser = ref.watch(currentUserProvider);
  if (authUser == null) return Stream.value([]);

  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo
      .queryCollectionStream(
        collection: FirestoreCollections.chats,
        field: FirestoreFields.participants,
        value: authUser.uid,
      )
      .map((snapshot) {
    final docs = snapshot.docs.map((doc) => ChatModel.fromJson(doc.data())).toList();
    docs.sort((a, b) => (b.lastMessageAt ?? DateTime(0)).compareTo(a.lastMessageAt ?? DateTime(0)));
    return docs;
  });
});

/// Streams the messages for a specific chat ID.
final chatMessagesProvider = StreamProvider.family<List<MessageModel>, String>((ref, chatId) {
  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo
      .getSubCollectionStream(
        parentCollection: FirestoreCollections.chats,
        parentDocId: chatId,
        subCollection: FirestoreCollections.chatMessages,
      )
      .map((snapshot) {
    final docs = snapshot.docs.map((doc) => MessageModel.fromJson(doc.data())).toList();
    docs.sort((a, b) {
      final aTime = a.sentAt ?? DateTime(0);
      final bTime = b.sentAt ?? DateTime(0);
      return aTime.compareTo(bTime);
    });
    return docs;
  });
});
