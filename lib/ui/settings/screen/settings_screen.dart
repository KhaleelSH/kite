import 'package:flutter/material.dart';
import 'package:kite/ui/settings/screen/categories_settings_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SettingsScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text('Categories'),
              onTap: () => Navigator.of(context).push(CategoriesSettingsScreen.route()),
              leading: Icon(Icons.category),
              trailing: Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }
}
