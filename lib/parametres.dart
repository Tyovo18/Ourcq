import 'package:flutter/material.dart';
import 'coordonnees.dart';
import 'confidentialite.dart';
import 'notifications.dart';

class ParametresPage extends StatelessWidget {
  const ParametresPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 24),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Paramètres',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 8),
          _buildSettingsItem(
            icon: Icons.person_outline,
            title: 'Mes coordonnées',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CoordonneesPage()),
              );
            },
          ),
          _buildSettingsItem(
            icon: Icons.security_outlined,
            title: 'Confidentialité',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ConfidentialitePage()),
              );
            },
          ),
          _buildSettingsItem(
            icon: Icons.notifications_outlined,
            title: 'Notifications',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationsPage()),
              );
            },
          ),
          _buildSettingsItem(
            icon: Icons.email_outlined,
            title: 'Adresse',
            onTap: () {},
          ),
          _buildSettingsItem(
            icon: Icons.share_outlined,
            title: 'Partage l’appli',
            onTap: () {},
          ),
          _buildSettingsItem(
            icon: Icons.star_border,
            title: 'Noter l’appli',
            onTap: () {},
          ),
          _buildSettingsItem(
            icon: Icons.feedback_outlined,
            title: 'Fais-nous savoir ce que tu penses',
            onTap: () {},
          ),
          _buildSettingsItem(
            icon: Icons.description_outlined,
            title: 'Conditions Générales d’Utilisation',
            onTap: () {},
          ),
          _buildSettingsItem(
            icon: Icons.delete_outline,
            title: 'Vider le cache',
            onTap: () {},
          ),
          _buildSettingsItem(
            icon: Icons.help_outline,
            title: 'Service d’Aide',
            onTap: () {},
          ),
          _buildSettingsItem(
            icon: Icons.logout,
            title: 'Se déconnecter',
            onTap: () {},
          ),
          _buildSettingsItem(
            icon: Icons.close,
            title: 'Supprimer mon compte',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: Colors.black,
            size: 24,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          onTap: onTap,
        ),
        const Divider(
          height: 1,
          thickness: 1,
          color: Color(0xFFE0E0E0),
        ),
      ],
    );
  }
}
