import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/providers/firebase_providers.dart';

// ─── Auth State ───────────────────────────────────────────────────

class AuthState {
  final bool isLoading;
  final String? verificationId;
  final int? resendToken;
  final String? error;
  final User? user;

  const AuthState({
    this.isLoading = false,
    this.verificationId,
    this.resendToken,
    this.error,
    this.user,
  });

  AuthState copyWith({
    bool? isLoading,
    String? verificationId,
    int? resendToken,
    String? error,
    User? user,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      verificationId: verificationId ?? this.verificationId,
      resendToken: resendToken ?? this.resendToken,
      error: error,
      user: user ?? this.user,
    );
  }
}

// ─── Auth Notifier ────────────────────────────────────────────────

class AuthNotifier extends StateNotifier<AuthState> {
  final Ref ref;

  AuthNotifier(this.ref) : super(const AuthState());

  // ─── Phone OTP Flow ─────────────────────────────────────────

  Future<void> sendOtp(
    String phoneNumber, {
    required Function() onCodeSent,
    required Function() onAutoVerified,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final authRepo = ref.read(authRepositoryProvider);
      await authRepo.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        forceResendingToken: state.resendToken,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-resolution on Android (auto-read SMS)
          try {
            await authRepo.signInWithCredential(credential);
            final user = authRepo.currentUser;
            state = state.copyWith(isLoading: false, user: user);
            onAutoVerified();
          } catch (e) {
            state = state.copyWith(isLoading: false, error: e.toString());
          }
        },
        verificationFailed: (FirebaseAuthException e) {
          state = state.copyWith(isLoading: false, error: e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          state = state.copyWith(
            isLoading: false,
            verificationId: verificationId,
            resendToken: resendToken,
          );
          onCodeSent();
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          state = state.copyWith(verificationId: verificationId);
        },
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> verifyOtp(
    String smsCode, {
    required Function() onSuccess,
  }) async {
    if (state.verificationId == null) {
      state = state.copyWith(
          error: 'Verification session expired. Please request a new OTP.');
      return;
    }
    state = state.copyWith(isLoading: true, error: null);
    try {
      final authRepo = ref.read(authRepositoryProvider);
      
      if (kIsWeb) {
        if (authRepo.webConfirmationResult == null) {
          throw Exception('Web confirmation session not found. Please try again.');
        }
        await authRepo.webConfirmationResult!.confirm(smsCode);
      } else {
        final credential = PhoneAuthProvider.credential(
          verificationId: state.verificationId!,
          smsCode: smsCode,
        );
        await authRepo.signInWithCredential(credential);
      }
      
      final user = authRepo.currentUser;
      state = state.copyWith(isLoading: false, user: user);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'invalid-verification-code':
          message = 'Invalid OTP. Please check and try again.';
          break;
        case 'session-expired':
          message = 'OTP has expired. Please request a new one.';
          break;
        default:
          message = e.message ?? 'Verification failed. Please try again.';
      }
      state = state.copyWith(isLoading: false, error: message);
    } catch (e) {
      state = state.copyWith(
          isLoading: false, error: 'Verification failed. Please try again.');
    }
  }

  // ─── Google Sign-In ─────────────────────────────────────────

  Future<void> signInWithGoogle({required Function() onSuccess}) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final authRepo = ref.read(authRepositoryProvider);
      final result = await authRepo.signInWithGoogle();
      if (result != null) {
        final user = authRepo.currentUser;
        state = state.copyWith(isLoading: false, user: user);
        onSuccess();
      } else {
        // User cancelled
        state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(
          isLoading: false, error: 'Google sign-in failed. Please try again.');
    }
  }

  // ─── Sign Out ───────────────────────────────────────────────

  Future<void> signOut() async {
    final authRepo = ref.read(authRepositoryProvider);
    await authRepo.signOut();
    state = const AuthState();
  }
}

// ─── Providers ────────────────────────────────────────────────────

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref);
});

/// Stream provider for real-time auth state (used by auth guard).
final authStateProvider = StreamProvider<User?>((ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  return authRepo.authStateChanges;
});
