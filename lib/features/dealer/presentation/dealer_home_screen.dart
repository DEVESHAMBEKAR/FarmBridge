import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/providers.dart';
import '../providers/dealer_negotiations_provider.dart';
import '../../../../core/widgets/async_value_widget.dart';
import '../../../../app/theme/app_colors.dart';

class DealerHomeScreen extends ConsumerWidget {
  const DealerHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    if (user == null) return const Scaffold(body: Center(child: CircularProgressIndicator()));

    final negotiationsAsync = ref.watch(dealerNegotiationsProvider(user.uid));

    return Scaffold(
      appBar: AppBar(title: const Text('Dealer Dashboard')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Active Negotiations', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            AsyncValueWidget(
              value: negotiationsAsync,
              data: (negotiations) {
                if (negotiations.isEmpty) {
                  return const Card(
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Center(child: Text('No active negotiations. Go to Search to make an offer!')),
                    ),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: negotiations.length,
                  itemBuilder: (context, index) {
                    final neg = negotiations[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: AppColors.primaryContainer,
                          child: Icon(Icons.handshake, color: AppColors.onPrimaryContainer),
                        ),
                        title: Text('Offer: ₹${neg.currentOfferPrice}/unit'),
                        subtitle: Text('Status: ${neg.status}\nLast updated: ${neg.updatedAt?.toLocal().toString().split('.')[0] ?? "Recently"}'),
                        trailing: const Icon(Icons.chevron_right),
                        isThreeLine: true,
                        onTap: () {
                          // TODO: Open Negotiation Chat
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

