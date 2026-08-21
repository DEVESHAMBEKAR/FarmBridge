import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';

class AdminControlCenterScreen extends StatefulWidget {
  const AdminControlCenterScreen({super.key});

  @override
  State<AdminControlCenterScreen> createState() => _AdminControlCenterScreenState();
}

class _AdminControlCenterScreenState extends State<AdminControlCenterScreen> {
  bool _maintenanceMode = false;
  bool _registrationOpen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Control Center'), backgroundColor: AppColors.surface),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            title: const Text('Maintenance Mode'),
            subtitle: const Text('Temporarily disable app access for all non-admins'),
            value: _maintenanceMode,
            activeColor: AppColors.error,
            onChanged: (val) => setState(() => _maintenanceMode = val),
          ),
          SwitchListTile(
            title: const Text('Open Registrations'),
            subtitle: const Text('Allow new users to sign up'),
            value: _registrationOpen,
            activeColor: AppColors.primary,
            onChanged: (val) => setState(() => _registrationOpen = val),
          ),
          const Divider(),
          ListTile(
            title: const Text('Global Commission Rate'),
            subtitle: const Text('Currently set to 5%'),
            trailing: TextButton(onPressed: (){}, child: const Text('Edit')),
          ),
        ],
      ),
    );
  }
}
