import 'package:flutter/material.dart';
import '../../../../core/models/verification_document_model.dart';
import '../../../../app/theme/app_colors.dart';
import 'package:intl/intl.dart';

class DocumentViewerDialog extends StatelessWidget {
  final VerificationDocumentModel document;

  const DocumentViewerDialog({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(16),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 800, maxHeight: 800),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(document.documentName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      const SizedBox(height: 4),
                      Text('Uploaded: ${document.uploadedAt != null ? DateFormat.yMMMd().format(document.uploadedAt!) : 'Unknown'}', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: InteractiveViewer(
                minScale: 0.5,
                maxScale: 4.0,
                child: Center(
                  child: Image.network(
                    document.downloadUrl,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stack) => const Center(child: Text('Failed to load document image.')),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
