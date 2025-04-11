import 'package:flutter/material.dart';

class ConfidentialitePage extends StatefulWidget {
  const ConfidentialitePage({Key? key}) : super(key: key);

  @override
  State<ConfidentialitePage> createState() => _ConfidentialitePageState();
}

class _ConfidentialitePageState extends State<ConfidentialitePage> {
  bool _acceptRequests = false;
  bool _shareLocation = false;
  bool _shareFavorites = false;

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
          'Confidentialité',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 24),
            const Text(
              'Gestion des abonné.e.s',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Fais savoir à tes ami.e.s ce qui t’intéresse. Partage tes '
              'événements sauvegardés et ceux que tu as réservé.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            _buildSwitchItem(
              title: 'Toujours accepter les demandes d’abonnement',
              value: _acceptRequests,
              onChanged: (bool value) {
                setState(() {
                  _acceptRequests = value;
                });
              },
            ),
            const Divider(),
            const SizedBox(height: 16),
            const Text(
              'Ce que tu partages',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildSwitchItem(
              title: 'Localisation partagée',
              subtitle: 'Partage ta position avec tes ami.e.s afin de pouvoir '
                  'vous rejoindre dans votre lieu préféré.',
              value: _shareLocation,
              onChanged: (bool value) {
                setState(() {
                  _shareLocation = value;
                });
              },
            ),
            const Divider(),
            _buildSwitchItem(
              title: 'Mes lieux favoris',
              subtitle:
                  'Tes ami.e.s seront susceptibles de voir les événements '
                  'qui t’intéressent, en fonction de tes lieux favoris.',
              value: _shareFavorites,
              onChanged: (bool value) {
                setState(() {
                  _shareFavorites = value;
                });
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchItem({
    required String title,
    String? subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          subtitle: subtitle != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                )
              : null,
          trailing: Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.green,
          ),
        ),
      ],
    );
  }
}
