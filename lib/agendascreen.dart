import 'package:flutter/material.dart';
import 'event3_page.dart';
import 'event4_page.dart';
import 'event5_page.dart';

class AgendaScreen extends StatelessWidget {
  const AgendaScreen({Key? key}) : super(key: key);

  static const Color customBlue = Color(0xFF25346D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: [
            _buildSearchBar(),
            const SizedBox(height: 16),
            _buildFilters(context),
            const SizedBox(height: 24),
            const Text("Ven. 11 avr. 2025",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            _eventCard(
              context,
              image: 'assets/yoga.png',
              location: 'Cité Fertile',
              title: 'Hatha Yoga avec Nour Yoga',
              dateTime: 'Tous les vendredis - 19:00',
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Event3Page())),
            ),
            _eventCard(
              context,
              image: 'assets/trompette.png',
              location: 'Philharmonie de Paris',
              title: 'Rising Stars / Matilda Lloyd - Simon Lepper',
              dateTime: 'Ven. 11 avr. 2025 - 20:00',
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Event4Page())),
            ),
            _eventCard(
              context,
              image: 'assets/photo.png',
              location: 'Dock B',
              title: 'Jael: Motion sickness release party',
              dateTime: 'Ven. 11 avr. 2025 - 23:45',
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Event5Page())),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(30),
      ),
      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Recherche',
          icon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _buildFilters(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const DateFilterPage()),
            );
          },
          child: _filterButton(Icons.date_range, 'Date'),
        ),
        _filterButton(Icons.category, 'Catégorie'),
        _filterButton(Icons.sort, 'Trier'),
      ],
    );
  }

  Widget _filterButton(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: customBlue.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: customBlue),
          const SizedBox(width: 6),
          Text(label, style: TextStyle(color: customBlue)),
        ],
      ),
    );
  }

  Widget _eventCard(
    BuildContext context, {
    required String image,
    required String location,
    required String title,
    required String dateTime,
    required VoidCallback onPressed,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0.5,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child:
                  Image.asset(image, width: 90, height: 90, fit: BoxFit.cover),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined,
                          size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(location,
                          style: const TextStyle(
                              fontSize: 13, color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 15)),
                  const SizedBox(height: 4),
                  Text(dateTime,
                      style: const TextStyle(fontSize: 13, color: Colors.grey)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: onPressed,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: customBlue,
                          backgroundColor: Colors.white,
                          side: BorderSide(color: customBlue),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                        ),
                        child: const Text('En savoir plus',
                            style: TextStyle(fontSize: 13)),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: customBlue,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.confirmation_number_outlined,
                            size: 14, color: Colors.white),
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

class DateFilterPage extends StatelessWidget {
  const DateFilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Filtres', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Date",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Icon(Icons.expand_less, color: Colors.black),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: [
                _pillButton('Aujourd’hui'),
                _pillButton('Demain'),
                _pillButton('Ce week-end'),
              ],
            ),
            const SizedBox(height: 12),
            CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(2020),
              lastDate: DateTime(2030),
              onDateChanged: (date) {},
            ),
            const SizedBox(height: 24),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Catégorie",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Icon(Icons.expand_more, color: Colors.black),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget _pillButton(String text) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        foregroundColor: AgendaScreen.customBlue,
        side: BorderSide(color: AgendaScreen.customBlue),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(text),
    );
  }
}
