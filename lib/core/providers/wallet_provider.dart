import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/wallet_model.dart';
import '../constants/firestore_collections.dart';
import 'firebase_providers.dart';
import 'user_provider.dart';

// ─── Wallet Stream ────────────────────────────────────────────

/// A provider that streams the current user's wallet balance.
final walletProvider = StreamProvider<WalletModel?>((ref) {
  final authUser = ref.watch(currentUserProvider);
  if (authUser == null) {
    return Stream.value(null);
  }

  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo
      .getDocumentStream(
        collection: FirestoreCollections.wallets,
        documentId: authUser.uid,
      )
      .map((snapshot) {
    if (snapshot.exists && snapshot.data() != null) {
      return WalletModel.fromJson(snapshot.data()!);
    }
    return null;
  });
});

/// A provider that streams the transactions within the current user's wallet.
final walletTransactionsProvider = StreamProvider<List<WalletTransactionModel>>((ref) {
  final authUser = ref.watch(currentUserProvider);
  if (authUser == null) {
    return Stream.value([]);
  }

  final firestoreRepo = ref.watch(firestoreRepositoryProvider);
  return firestoreRepo
      .getSubCollectionStream(
        parentCollection: FirestoreCollections.wallets,
        parentDocId: authUser.uid,
        subCollection: FirestoreCollections.walletTransactions,
        orderByField: 'created_at',
        descending: true,
      )
      .map((snapshot) {
    return snapshot.docs.map((doc) => WalletTransactionModel.fromJson(doc.data())).toList();
  });
});
