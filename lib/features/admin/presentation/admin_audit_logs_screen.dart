import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_typography.dart';
import 'providers/admin_providers.dart';

class AdminAuditLogsScreen extends ConsumerWidget {
  const AdminAuditLogsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logsAsync = ref.watch(adminAuditLogsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('System Audit Logs', style: AppTypography.headlineMedium.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Immutable ledger of all administrative actions', style: AppTypography.bodyLarge.copyWith(color: AppColors.onSurfaceVariant)),
            const SizedBox(height: 24),
            
            Expanded(
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: AppColors.outlineVariant.withOpacity(0.5)),
                ),
                child: logsAsync.when(
                  data: (logs) {
                    if (logs.isEmpty) {
                      return const Center(child: Text('No audit logs recorded yet.'));
                    }
                    
                    // Sort descending by timestamp
                    final sortedLogs = List<Map<String, dynamic>>.from(logs)
                      ..sort((a, b) {
                        final tA = a['timestamp'] as Timestamp?;
                        final tB = b['timestamp'] as Timestamp?;
                        if (tA == null && tB == null) return 0;
                        if (tA == null) return 1;
                        if (tB == null) return -1;
                        return tB.compareTo(tA);
                      });
                    
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        child: DataTable(
                          headingTextStyle: AppTypography.titleSmall.copyWith(fontWeight: FontWeight.bold),
                          dataRowMinHeight: 50,
                          dataRowMaxHeight: 60,
                          columns: const [
                            DataColumn(label: Text('Timestamp')),
                            DataColumn(label: Text('Admin ID')),
                            DataColumn(label: Text('Action')),
                            DataColumn(label: Text('Entity')),
                            DataColumn(label: Text('Target ID')),
                            DataColumn(label: Text('Details')),
                          ],
                          rows: sortedLogs.map((log) {
                            final ts = log['timestamp'] as Timestamp?;
                            return DataRow(
                              cells: [
                                DataCell(Text(ts != null ? DateFormat('MMM dd, yyyy HH:mm:ss').format(ts.toDate()) : 'Pending...')),
                                DataCell(Text((log['admin_id'] as String?)?.substring(0, 8) ?? 'Unknown')),
                                DataCell(
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      (log['action'] as String? ?? 'UNKNOWN').toUpperCase(), 
                                      style: const TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.bold)
                                    ),
                                  )
                                ),
                                DataCell(Text((log['entity'] as String?)?.toUpperCase() ?? 'N/A')),
                                DataCell(Text((log['entity_id'] as String?)?.substring(0, 8) ?? 'N/A')),
                                DataCell(Text(log['details']?.toString() ?? 'None', style: const TextStyle(color: Colors.grey, fontSize: 12))),
                              ]
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (err, _) => Center(child: Text('Error loading logs: $err')),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}