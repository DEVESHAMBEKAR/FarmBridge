import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';

/// Production-grade authentication repository.
/// Handles Phone OTP (+91 only), Google Sign-In, session persistence, and sign-out.
class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // ─── Auth State ───────────────────────────────────────────────

  /// Stream of auth state changes (login/logout).
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Currently signed-in user, or null.
  User? get currentUser => _auth.currentUser;

  /// Whether a user is currently signed in.
  bool get isSignedIn => _auth.currentUser != null;

  /// The UID of the current user, or null.
  String? get uid => _auth.currentUser?.uid;

  // ─── Phone OTP Authentication (+91 Only) ──────────────────────

  ConfirmationResult? webConfirmationResult;
  RecaptchaVerifier? _recaptchaVerifier;

  /// Creates a fresh RecaptchaVerifier, clearing any stale one.
  RecaptchaVerifier _getRecaptchaVerifier() {
    try {
      _recaptchaVerifier?.clear();
    } catch (_) {}
    _recaptchaVerifier = RecaptchaVerifier(
      auth: FirebaseAuthPlatform.instance,
    );
    return _recaptchaVerifier!;
  }

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    required Function(String) codeAutoRetrievalTimeout,
    int? forceResendingToken,
  }) async {
    // Enforce +91 country code
    String formattedNumber = phoneNumber.trim();
    if (!formattedNumber.startsWith('+91')) {
      if (formattedNumber.startsWith('+')) {
        throw Exception('Only Indian phone numbers (+91) are permitted.');
      }
      formattedNumber = '+91$formattedNumber';
    }

    // Validate 10-digit Indian mobile number
    final digits = formattedNumber.replaceAll('+91', '');
    if (digits.length != 10 || !RegExp(r'^[6-9]\d{9}$').hasMatch(digits)) {
      throw Exception('Please enter a valid 10-digit Indian mobile number.');
    }

    if (kIsWeb) {
      try {
        final verifier = _getRecaptchaVerifier();
        webConfirmationResult = await _auth.signInWithPhoneNumber(formattedNumber, verifier);
        codeSent('web_verification_id', null);
      } on FirebaseAuthException catch (e) {
        verificationFailed(e);
      } catch (e) {
        verificationFailed(FirebaseAuthException(code: 'web-error', message: e.toString()));
      }
      return;
    }

    // Android/iOS — native phone auth (no reCAPTCHA needed)
    await _auth.verifyPhoneNumber(
      phoneNumber: formattedNumber,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      forceResendingToken: forceResendingToken,
    );
  }

  Future<UserCredential> signInWithCredential(AuthCredential credential) async {
    return await _auth.signInWithCredential(credential);
  }

  // ─── Google Sign-In ───────────────────────────────────────────

  Future<UserCredential?> signInWithGoogle() async {
    if (kIsWeb) {
      final provider = GoogleAuthProvider();
      return await _auth.signInWithPopup(provider);
    } else {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _auth.signInWithCredential(credential);
    }
  }

  // ─── Sign Out ─────────────────────────────────────────────────

  Future<void> signOut() async {
    try { _recaptchaVerifier?.clear(); } catch (_) {}
    _recaptchaVerifier = null;
    await _auth.signOut();
    try {
      await GoogleSignIn().signOut();
    } catch (_) {}
  }
}
