import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/providers/providers.dart';
import '../../../app/theme/app_colors.dart';
import '../providers/verification_providers.dart';

class VerificationStatusScreen extends ConsumerWidget {
  const VerificationStatusScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusAsync = ref.watch(userVerificationStatusProvider);
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification Status'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: statusAsync.when(
        data: (status) {
          IconData icon;
          Color color;
          String title;
          String subtitle;

          switch (status) {
            case 'PENDING':
              icon = Icons.pending_actions;
              color = Colors.orange;
              title = 'Verification Pending';
              subtitle = 'Please upload your required documents to submit your application.';
              break;
            case 'UNDER_REVIEW':
              icon = Icons.hourglass_top;
              color = Colors.blue;
              title = 'Under Review';
              subtitle = 'Your documents have been submitted and are currently being reviewed by our admin team.';
              break;
            case 'REQUIRES_CORRECTION':
            case 'REJECTED':
              icon = Icons.error_outline;
              color = Colors.red;
              title = 'Action Required';
              subtitle = 'One or more documents require correction. Please review and resubmit.';
              break;
            case 'APPROVED':
              icon = Icons.check_circle_outline;
              color = Colors.green;
              title = 'Account Approved';
              subtitle = 'Congratulations! Your FarmBridge account has been verified and approved.';
              break;
            case 'SUSPENDED':
              icon = Icons.block;
              color = Colors.red;
              title = 'Account Suspended';
              subtitle = 'Your account has been temporarily suspended by the admin.';
              break;
            default:
              icon = Icons.info_outline;
              color = Colors.grey;
              title = 'Status Unknown';
              subtitle = 'Please contact support.';
          }

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 100, color: color),
                  const SizedBox(height: 24),
                  Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
                  const SizedBox(height: 16),
                  Text(subtitle, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 32),
                  if (status == 'PENDING' || status == 'REQUIRES_CORRECTION' || status == 'REJECTED')
                    ElevatedButton(
                      onPressed: () {
                        context.push('/verification/documents', extra: user?.role ?? 'farmer');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      ),
                      child: const Text('Manage Documents', style: TextStyle(fontSize: 16)),
                    ),
                  if (status == 'APPROVED')
                    ElevatedButton(
                      onPressed: () {
                        context.go('/');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      ),
                      child: const Text('Go to Dashboard', style: TextStyle(fontSize: 16)),
                    ),
                ],
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
