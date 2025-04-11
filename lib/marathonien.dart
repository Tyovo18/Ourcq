import 'package:flutter/material.dart';

class MarathonienPage extends StatelessWidget {
  final int currentInvites = 3;
  final int requiredInvites = 5;

  @override
  Widget build(BuildContext context) {
    double progress = currentInvites / requiredInvites;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 24),
            Text(
              "Le marathonien",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16),
            Image.asset(
              'assets/marathonien.png',
              height: 100,
            ),
            SizedBox(height: 16),
            Text(
              "Marche 5 km dans les\nalentours d’Ourcq",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 12,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF25346D)),
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "$currentInvites/$requiredInvites",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 24),
            Text(
              "Récompense",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 12),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFF9FAFF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "-",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w600, height: 1.5),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/marathonien.png',
                    height: 80,
                  ),
                  Image.asset(
                    'assets/marathonienj.png',
                    height: 80,
                  ),
                  Image.asset(
                    'assets/marathonienr.png',
                    height: 80,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.white,
                child: Icon(Icons.close, color: Color(0xFF25346D), size: 28),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
