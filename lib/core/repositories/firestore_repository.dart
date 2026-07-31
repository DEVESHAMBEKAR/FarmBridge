import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

/// Production-grade Firestore repository with pagination, batch writes,
/// typed queries, and offline persistence.
class FirestoreRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  FirestoreRepository() {
    _firestore.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
  }

  FirebaseFirestore get firestore => _firestore;

  // ─── Single Document Operations ───────────────────────────────

  /// Create or merge a document.
  Future<void> setDocument({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
    bool merge = true,
  }) async {
    try {
      await _firestore
          .collection(collection)
          .doc(documentId)
          .set(data, SetOptions(merge: merge));
    } catch (e) {
      debugPrint('FirestoreRepository.setDocument error: $e');
      rethrow;
    }
  }

  /// Get a single document.
  Future<DocumentSnapshot<Map<String, dynamic>>> getDocument({
    required String collection,
    required String documentId,
  }) async {
    try {
      return await _firestore.collection(collection).doc(documentId).get();
    } catch (e) {
      debugPrint('FirestoreRepository.getDocument error: $e');
      rethrow;
    }
  }

  /// Update specific fields on a document.
  Future<void> updateDocument({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.collection(collection).doc(documentId).update(data);
    } catch (e) {
      debugPrint('FirestoreRepository.updateDocument error: $e');
      rethrow;
    }
  }

  /// Delete a document.
  Future<void> deleteDocument({
    required String collection,
    required String documentId,
  }) async {
    try {
      await _firestore.collection(collection).doc(documentId).delete();
    } catch (e) {
      debugPrint('FirestoreRepository.deleteDocument error: $e');
      rethrow;
    }
  }

  /// Check if a document exists.
  Future<bool> documentExists({
    required String collection,
    required String documentId,
  }) async {
    final doc = await _firestore.collection(collection).doc(documentId).get();
    return doc.exists;
  }

  // ─── Collection Queries ───────────────────────────────────────

  /// Real-time stream of a collection with optional ordering.
  Stream<QuerySnapshot<Map<String, dynamic>>> getCollectionStream({
    required String collection,
    String? orderByField,
    bool descending = false,
    int? limit,
  }) {
    Query<Map<String, dynamic>> query = _firestore.collection(collection);
    if (orderByField != null) {
      query = query.orderBy(orderByField, descending: descending);
    }
    if (limit != null) {
      query = query.limit(limit);
    }
    return query.snapshots();
  }

  /// Query documents where a field equals a value.
  Future<QuerySnapshot<Map<String, dynamic>>> queryCollection({
    required String collection,
    required String field,
    required dynamic value,
    String? orderByField,
    bool descending = false,
    int? limit,
  }) async {
    try {
      Query<Map<String, dynamic>> query =
          _firestore.collection(collection).where(field, isEqualTo: value);
      if (orderByField != null) {
        query = query.orderBy(orderByField, descending: descending);
      }
      if (limit != null) {
        query = query.limit(limit);
      }
      return await query.get();
    } catch (e) {
      debugPrint('FirestoreRepository.queryCollection error: $e');
      rethrow;
    }
  }

  /// Real-time stream with a where clause.
  Stream<QuerySnapshot<Map<String, dynamic>>> queryCollectionStream({
    required String collection,
    required String field,
    required dynamic value,
    String? orderByField,
    bool descending = false,
    int? limit,
  }) {
    Query<Map<String, dynamic>> query =
        _firestore.collection(collection).where(field, isEqualTo: value);
    if (orderByField != null) {
      query = query.orderBy(orderByField, descending: descending);
    }
    if (limit != null) {
      query = query.limit(limit);
    }
    return query.snapshots();
  }

  // ─── Paginated Queries ────────────────────────────────────────

  /// Fetch a page of documents with cursor-based pagination.
  Future<QuerySnapshot<Map<String, dynamic>>> getPaginatedCollection({
    required String collection,
    required String orderByField,
    bool descending = false,
    required int pageSize,
    DocumentSnapshot? startAfterDocument,
    String? whereField,
    dynamic whereValue,
  }) async {
    try {
      Query<Map<String, dynamic>> query = _firestore.collection(collection);

      if (whereField != null && whereValue != null) {
        query = query.where(whereField, isEqualTo: whereValue);
      }

      query = query.orderBy(orderByField, descending: descending);

      if (startAfterDocument != null) {
        query = query.startAfterDocument(startAfterDocument);
      }

      query = query.limit(pageSize);
      return await query.get();
    } catch (e) {
      debugPrint('FirestoreRepository.getPaginatedCollection error: $e');
      rethrow;
    }
  }

  // ─── Subcollection Operations ─────────────────────────────────

  /// Set a document in a subcollection.
  Future<void> setSubDocument({
    required String parentCollection,
    required String parentDocId,
    required String subCollection,
    required String documentId,
    required Map<String, dynamic> data,
    bool merge = true,
  }) async {
    try {
      await _firestore
          .collection(parentCollection)
          .doc(parentDocId)
          .collection(subCollection)
          .doc(documentId)
          .set(data, SetOptions(merge: merge));
    } catch (e) {
      debugPrint('FirestoreRepository.setSubDocument error: $e');
      rethrow;
    }
  }

  /// Get a subcollection stream.
  Stream<QuerySnapshot<Map<String, dynamic>>> getSubCollectionStream({
    required String parentCollection,
    required String parentDocId,
    required String subCollection,
    String? orderByField,
    bool descending = false,
    int? limit,
  }) {
    Query<Map<String, dynamic>> query = _firestore
        .collection(parentCollection)
        .doc(parentDocId)
        .collection(subCollection);
    if (orderByField != null) {
      query = query.orderBy(orderByField, descending: descending);
    }
    if (limit != null) {
      query = query.limit(limit);
    }
    return query.snapshots();
  }

  /// Delete a document from a subcollection.
  Future<void> deleteSubDocument({
    required String parentCollection,
    required String parentDocId,
    required String subCollection,
    required String documentId,
  }) async {
    try {
      await _firestore
          .collection(parentCollection)
          .doc(parentDocId)
          .collection(subCollection)
          .doc(documentId)
          .delete();
    } catch (e) {
      debugPrint('FirestoreRepository.deleteSubDocument error: $e');
      rethrow;
    }
  }

  // ─── Batch Operations ─────────────────────────────────────────

  /// Execute multiple writes atomically.
  Future<void> batchWrite(
      List<BatchOperation> operations,
  ) async {
    try {
      final batch = _firestore.batch();
      for (final op in operations) {
        final ref = _firestore.collection(op.collection).doc(op.documentId);
        switch (op.type) {
          case BatchType.set:
            batch.set(ref, op.data!, SetOptions(merge: op.merge));
            break;
          case BatchType.update:
            batch.update(ref, op.data!);
            break;
          case BatchType.delete:
            batch.delete(ref);
            break;
        }
      }
      await batch.commit();
    } catch (e) {
      debugPrint('FirestoreRepository.batchWrite error: $e');
      rethrow;
    }
  }

  // ─── Document Stream ──────────────────────────────────────────

  /// Real-time stream of a single document.
  Stream<DocumentSnapshot<Map<String, dynamic>>> getDocumentStream({
    required String collection,
    required String documentId,
  }) {
    return _firestore.collection(collection).doc(documentId).snapshots();
  }

  // ─── Utility ──────────────────────────────────────────────────

  /// Generate a new document ID without creating the document.
  String generateDocId(String collection) {
    return _firestore.collection(collection).doc().id;
  }

  /// Server timestamp for consistent ordering.
  static FieldValue get serverTimestamp => FieldValue.serverTimestamp();
}

// ─── Batch Operation Model ────────────────────────────────────────

enum BatchType { set, update, delete }

class BatchOperation {
  final String collection;
  final String documentId;
  final BatchType type;
  final Map<String, dynamic>? data;
  final bool merge;

  const BatchOperation({
    required this.collection,
    required this.documentId,
    required this.type,
    this.data,
    this.merge = true,
  });

  factory BatchOperation.set({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
    bool merge = true,
  }) =>
      BatchOperation(
        collection: collection,
        documentId: documentId,
        type: BatchType.set,
        data: data,
        merge: merge,
      );

  factory BatchOperation.update({
    required String collection,
    required String documentId,
    required Map<String, dynamic> data,
  }) =>
      BatchOperation(
        collection: collection,
        documentId: documentId,
        type: BatchType.update,
        data: data,
      );

  factory BatchOperation.delete({
    required String collection,
    required String documentId,
  }) =>
      BatchOperation(
        collection: collection,
        documentId: documentId,
        type: BatchType.delete,
      );
}
