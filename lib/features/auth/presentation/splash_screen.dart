import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../../../core/providers/providers.dart';
import '../../../../core/models/user_model.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleInAnimation;
  late Animation<double> _fadeInAnimation;
  late Animation<double> _pulseAnimation;
  late Animation<double> _sweepAnimation;
  late Animation<double> _fadeOutAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    );

    // Scene 1: 0ms - 500ms (0.0 to 0.178)
    _scaleInAnimation = Tween<double>(begin: 0.75, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.178, curve: Curves.easeOut),
      ),
    );

    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.178, curve: Curves.easeOut),
      ),
    );

    // Scene 2: 500ms - 1500ms (0.178 to 0.535)
    // Pulse down to 98% and back to 100%
    _pulseAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.98).chain(CurveTween(curve: Curves.easeInOut)), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 0.98, end: 1.0).chain(CurveTween(curve: Curves.easeInOut)), weight: 50),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.178, 0.535),
      ),
    );

    // Light Sweep: 500ms - 1500ms (0.178 to 0.535)
    // Values represent the center alignment of the gradient sweep (-1.5 to 1.5 is a good range to pass completely over)
    _sweepAnimation = Tween<double>(begin: -1.5, end: 1.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.178, 0.535, curve: Curves.easeInOut),
      ),
    );

    // Scene 4: 2300ms - 2800ms (0.821 to 1.0)
    _fadeOutAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.821, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller.forward().then((_) async {
      if (!mounted) return;
      
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        try {
          final firestoreRepo = ref.read(firestoreRepositoryProvider);
          final snapshot = await firestoreRepo.getDocument(
            collection: 'users', 
            documentId: user.uid,
          );

          if (!mounted) return;

          if (snapshot.exists && snapshot.data() != null) {
            final userModel = UserModel.fromJson(snapshot.data()!);
            final role = userModel.role.toLowerCase();

            // Auto-promotion for Super Admin accounts
            if (((user.phoneNumber != null && user.phoneNumber!.contains('7972327984')) || (user.email != null && user.email == 'ambekardevesh2@gmail.com')) && role != 'system_admin') {
              await firestoreRepo.updateDocument(
                collection: 'users',
                documentId: user.uid,
                data: {'role': 'system_admin'},
              );
              if (mounted) context.go('/splash'); // Reload to apply new role
              return;
            }
            
            if (!userModel.isProfileComplete) {
              if (role == 'farmer') {
                context.go('/farmer/profile-setup');
              } else if (role == 'logistics') {
                context.go('/delivery/profile-setup');
              } else if (['dealer', 'wholesaler', 'retailer'].contains(role)) {
                context.go('/dealer/profile-setup');
              } else {
                context.go('/buyer/profile-setup');
              }
            } else {
              if ((role == 'farmer' || role == 'logistics' || ['dealer', 'wholesaler', 'retailer'].contains(role)) && !userModel.isVerified) {
                context.go('/verification-pending');
              } else if (role == 'farmer') {
                context.go('/farmer/dashboard');
              } else if (['dealer', 'wholesaler', 'retailer'].contains(role)) {
                context.go('/dealer/home');
              } else if (role == 'buyer') {
                context.go('/buyer/home');
              } else if (role == 'logistics') {
                context.go('/delivery/dashboard');
              } else if (role == 'admin' || role == 'system_admin') {
                context.go('/admin/dashboard');
              } else {
                context.go('/buyer/home');
              }
            }
          } else {
            // Profile not created yet
            context.go('/role-selection');
          }
        } catch (e) {
          if (mounted) context.go('/role-selection');
        }
      } else {
        context.go('/auth');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Force white background for splash screen to seamlessly match the logo
    const Color bgColor = Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            // Combine scale-in and pulse scale.
            // Scale-in goes 0.75 -> 1.0 during 0->500ms
            // Pulse goes 1.0 -> 0.98 -> 1.0 during 500ms->1500ms
            // After 500ms, scaleIn is 1.0. Before 500ms, pulse is 1.0.
            // So multiplying them works perfectly.
            final double currentScale = _scaleInAnimation.value * _pulseAnimation.value;

            // Combine fadeIn and fadeOut
            final double currentOpacity = _fadeInAnimation.value * _fadeOutAnimation.value;

            return FadeTransition(
              opacity: AlwaysStoppedAnimation(currentOpacity),
              child: Transform.scale(
                scale: currentScale,
                child: ShaderMask(
                  blendMode: BlendMode.srcATop,
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: const [0.0, 0.45, 0.5, 0.55, 1.0],
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.white.withOpacity(0.3), // Soft light sweep
                        Colors.transparent,
                        Colors.transparent,
                      ],
                      // Shift the gradient across the bounds using the sweep animation
                      transform: _SweepGradientTransform(_sweepAnimation.value),
                    ).createShader(bounds);
                  },
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 250, // Keep it focal and reasonably sized
                    height: 250,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback just in case the image isn't loaded correctly by the system
                      return const Icon(Icons.broken_image, size: 100, color: Colors.grey);
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// A custom transform to slide the linear gradient across the widget
class _SweepGradientTransform extends GradientTransform {
  final double value;
  const _SweepGradientTransform(this.value);

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    // Translate the gradient along the X and Y axes
    return Matrix4.translationValues(
      bounds.width * value,
      bounds.height * value,
      0.0,
    );
  }
}
