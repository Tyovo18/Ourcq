import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool isEventModificationEnabled = false;
  bool isRecommendationsPushEnabled = false;
  bool isRecommendationsEmailEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(color: Colors.black54, thickness: 1),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "On te tient au courant",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Découvre les derniers événements, ce que vont voir tes amis, les coupons et les codes de réductions, etc.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF065AF4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Activer les notifications",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.black54, thickness: 1),
            const SizedBox(height: 32),
            NotificationSection(
              title: "Modifications de tes événements",
              description:
                  "Programmation, horaire ou lieu, on te tient au courant s'il y a du changement.",
              switches: [
                NotificationSwitch(
                  title: "Push",
                  value: isEventModificationEnabled,
                  onChanged: (newValue) {
                    setState(() {
                      isEventModificationEnabled = newValue;
                    });
                  },
                ),
              ],
            ),
            const Divider(color: Colors.black54, thickness: 1),
            const SizedBox(height: 32),
            NotificationSection(
              title: "Recommandations et news",
              description:
                  "Les événements qui devraient te plaire, notre newsletter, nos offres et des sondages pour que tu puisses t'exprimer.",
              switches: [
                NotificationSwitch(
                  title: "Push",
                  value: isRecommendationsPushEnabled,
                  onChanged: (newValue) {
                    setState(() {
                      isRecommendationsPushEnabled = newValue;
                    });
                  },
                ),
                NotificationSwitch(
                  title: "E-mail",
                  value: isRecommendationsEmailEnabled,
                  onChanged: (newValue) {
                    setState(() {
                      isRecommendationsEmailEnabled = newValue;
                    });
                  },
                ),
              ],
            ),
            const Divider(color: Colors.black54, thickness: 1),
          ],
        ),
      ),
    );
  }
}

class NotificationSection extends StatelessWidget {
  final String title;
  final String description;
  final List<NotificationSwitch> switches;

  const NotificationSection({
    Key? key,
    required this.title,
    required this.description,
    required this.switches,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 16),
        ...switches,
      ],
    );
  }
}

class NotificationSwitch extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const NotificationSwitch({
    Key? key,
    required this.title,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.green,
        ),
      ],
    );
  }
}
