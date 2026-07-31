import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/chat_model.dart';
import '../constants/firestore_collections.dart';
import 'firebase_providers.dart';
import 'user_provider.dart';

// ─── Chat Stream ──────────────────────────────────────────────

/// A provider that streams all chat conversations for the currently authenticated user.
final userChatsProvider = StreamProvider<List<ChatModel>>((ref) {
  final authUser = ref.watch(currentUserProvider);
  if (authUser == null) {
    return Stream.value([]);
  }

  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo
      .queryCollectionStream(
        collection: FirestoreCollections.chats,
        field: FirestoreFields.participants,
        value: authUser.uid, // Array-contains query
        orderByField: FirestoreFields.lastMessageAt,
        descending: true,
      )
      .map((snapshot) {
    return snapshot.docs.map((doc) => ChatModel.fromJson(doc.data())).toList();
  });
});

/// A provider that streams the messages for a specific chat ID.
final chatMessagesProvider = StreamProvider.family<List<MessageModel>, String>((ref, chatId) {
  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo
      .getSubCollectionStream(
        parentCollection: FirestoreCollections.chats,
        parentDocId: chatId,
        subCollection: FirestoreCollections.chatMessages,
        orderByField: 'sent_at',
        descending: true,
      )
      .map((snapshot) {
    return snapshot.docs.map((doc) => MessageModel.fromJson(doc.data())).toList();
  });
});
