import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Text('Messages', style: AppTypography.titleLarge.copyWith(color: AppColors.primary)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _buildChatItem(
            context,
            'Global Fresh Distributors',
            'Can you deliver 50 tons by next week?',
            '10:30 AM',
            'G',
            3,
          ),
          const SizedBox(height: 16),
          _buildChatItem(
            context,
            'FarmBridge Support',
            'Your issue has been resolved. Thank you.',
            'Yesterday',
            'F',
            0,
          ),
        ],
      ),
    );
  }

  Widget _buildChatItem(BuildContext context, String name, String lastMessage, String time, String initial, int unreadCount) {
    return InkWell(
      onTap: () {
        // Simple navigation to a conversation placeholder
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: unreadCount > 0 ? AppColors.primaryContainer.withOpacity(0.1) : AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.surfaceContainerHigh,
              child: Text(initial, style: AppTypography.titleLarge.copyWith(color: AppColors.primary)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text(name, style: AppTypography.titleMedium.copyWith(color: AppColors.onSurface, fontWeight: unreadCount > 0 ? FontWeight.bold : FontWeight.normal), maxLines: 1, overflow: TextOverflow.ellipsis)),
                      Text(time, style: AppTypography.labelSmall.copyWith(color: unreadCount > 0 ? AppColors.primary : AppColors.onSurfaceVariant)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text(lastMessage, style: AppTypography.bodySmall.copyWith(color: unreadCount > 0 ? AppColors.onSurface : AppColors.onSurfaceVariant), maxLines: 1, overflow: TextOverflow.ellipsis)),
                      if (unreadCount > 0)
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                          child: Text('$unreadCount', style: AppTypography.labelSmall.copyWith(color: AppColors.onPrimary)),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
