import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

/// Production-grade Firebase Storage repository with organized folder paths,
/// content type detection, and progress tracking.
class StorageRepository {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // ─── Upload Operations ────────────────────────────────────────

  /// Upload a user profile photo.
  /// Path: users/{uid}/profile/photo.{ext}
  Future<String?> uploadProfilePhoto({
    required String uid,
    required File file,
  }) async {
    final ext = _getExtension(file.path);
    return _uploadFile(
      file: file,
      path: 'users/$uid/profile/photo$ext',
    );
  }

  /// Upload a product image.
  /// Path: products/{farmerId}/{productId}/{index}.{ext}
  Future<String?> uploadProductImage({
    required String farmerId,
    required String productId,
    required File file,
    required int index,
  }) async {
    final ext = _getExtension(file.path);
    return _uploadFile(
      file: file,
      path: 'products/$farmerId/$productId/$index$ext',
    );
  }

  /// Upload multiple product images and return all URLs.
  Future<List<String>> uploadProductImages({
    required String farmerId,
    required String productId,
    required List<File> files,
  }) async {
    final urls = <String>[];
    for (int i = 0; i < files.length; i++) {
      final url = await uploadProductImage(
        farmerId: farmerId,
        productId: productId,
        file: files[i],
        index: i,
      );
      if (url != null) urls.add(url);
    }
    return urls;
  }

  /// Upload a chat attachment image.
  /// Path: chats/{chatId}/{timestamp}.{ext}
  Future<String?> uploadChatImage({
    required String chatId,
    required File file,
  }) async {
    final ext = _getExtension(file.path);
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return _uploadFile(
      file: file,
      path: 'chats/$chatId/$timestamp$ext',
    );
  }

  /// Upload a review image.
  /// Path: reviews/{reviewId}/{index}.{ext}
  Future<String?> uploadReviewImage({
    required String reviewId,
    required File file,
    required int index,
  }) async {
    final ext = _getExtension(file.path);
    return _uploadFile(
      file: file,
      path: 'reviews/$reviewId/$index$ext',
    );
  }

  /// Upload a KYC/verification document.
  /// Path: verification/{uid}/{docType}.{ext}
  Future<String?> uploadVerificationDoc({
    required String uid,
    required String docType,
    required File file,
  }) async {
    final ext = _getExtension(file.path);
    return _uploadFile(
      file: file,
      path: 'verification/$uid/$docType$ext',
    );
  }

  // ─── Delete Operations ────────────────────────────────────────

  /// Delete a file by its full storage path.
  Future<void> deleteFile(String path) async {
    try {
      await _storage.ref().child(path).delete();
    } catch (e) {
      debugPrint('StorageRepository.deleteFile error: $e');
    }
  }

  /// Delete a file by its download URL.
  Future<void> deleteByUrl(String downloadUrl) async {
    try {
      final ref = _storage.refFromURL(downloadUrl);
      await ref.delete();
    } catch (e) {
      debugPrint('StorageRepository.deleteByUrl error: $e');
    }
  }

  /// Delete all product images for a product.
  Future<void> deleteProductImages({
    required String farmerId,
    required String productId,
  }) async {
    try {
      final listResult =
          await _storage.ref('products/$farmerId/$productId').listAll();
      for (final item in listResult.items) {
        await item.delete();
      }
    } catch (e) {
      debugPrint('StorageRepository.deleteProductImages error: $e');
    }
  }

  // ─── Internal Helpers ─────────────────────────────────────────

  Future<String?> _uploadFile({
    required File file,
    required String path,
  }) async {
    try {
      final ref = _storage.ref().child(path);
      final metadata = SettableMetadata(
        contentType: _getContentType(file.path),
      );
      final uploadTask = await ref.putFile(file, metadata);
      return await uploadTask.ref.getDownloadURL();
    } catch (e) {
      debugPrint('StorageRepository._uploadFile error ($path): $e');
      return null;
    }
  }

  String _getExtension(String filePath) {
    final lastDot = filePath.lastIndexOf('.');
    if (lastDot == -1) return '';
    return filePath.substring(lastDot);
  }

  String _getContentType(String filePath) {
    final lower = filePath.toLowerCase();
    if (lower.endsWith('.jpg') || lower.endsWith('.jpeg')) return 'image/jpeg';
    if (lower.endsWith('.png')) return 'image/png';
    if (lower.endsWith('.webp')) return 'image/webp';
    if (lower.endsWith('.gif')) return 'image/gif';
    if (lower.endsWith('.pdf')) return 'application/pdf';
    return 'application/octet-stream';
  }
}
