import 'package:flutter/material.dart';

class SocialisateurPage extends StatefulWidget {
  @override
  _SocialisateurPageState createState() => _SocialisateurPageState();
}


class _SocialisateurPageState extends State<SocialisateurPage> {
  int currentInvites = 5;
  int requiredInvites = 7;
  String rewardText = "-5 % sur toutes les confiseries\nau Ciné 104";
  String logoPath = 'assets/socialisateurV.png'; // Logo initial
  Color logoColor = Colors.green; // Initial color for the selected logo
  bool isGreenSelected = true;

  // Méthode pour changer la récompense en fonction du logo
  void changeReward(String newReward, String newLogo, Color newColor,
      int newInvites, int newRequired, bool isGreenLogo) {
    setState(() {
      rewardText = newReward;
      logoPath = newLogo;
      logoColor = newColor;
      currentInvites = newInvites;
      requiredInvites = newRequired;
      isGreenSelected = isGreenLogo;
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress = currentInvites / requiredInvites;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 24),
            Text("Le socialisateur",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            SizedBox(height: 16),
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.asset(logoPath, height: 100),
              ],
            ),
            SizedBox(height: 16),
            Text(
              "Invite $requiredInvites amis à\ntélécharger l’application",
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
            Text("$currentInvites/$requiredInvites",
                style: TextStyle(fontSize: 14)),
            SizedBox(height: 24),
            Text("Récompense",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                if (isGreenSelected) {
                  // Naviguer vers la nouvelle page si le logo vert est sélectionné
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RewardDetailsPage()),
                  );
                }
              },
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFF9FAFF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      rewardText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1.5),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 8,
                    child: isGreenSelected
                        ? CircleAvatar(
                            radius: 12,
                            backgroundColor: Color(0xFF25346D),
                            child: Icon(Icons.check,
                                color: Colors.white, size: 16),
                          )
                        : SizedBox
                            .shrink(), // Pas de CircleAvatar pour le jaune et rouge
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    changeReward(
                      "-5 % sur toutes les confiseries\nau Ciné 104",
                      'assets/socialisateurV.png',
                      Colors.green,
                      5, // Nombre d'invites pour le vert
                      3, // Nombre d'invites requis pour le vert
                      true, // Sélection du vert
                    );
                  },
                  child: Image.asset('assets/socialisateurV.png', height: 80),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    changeReward(
                      "-10% sur toutes les confiseries\nau Ciné 104",
                      'assets/socialisateur.png',
                      Colors.yellow,
                      5, // Nombre d'invites pour le jaune
                      7, // Nombre d'invites requis pour le jaune
                      false,
                    );
                  },
                  child: Image.asset('assets/socialisateur.png', height: 80),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    changeReward(
                      "Une boisson offerte au Ciné 104",
                      'assets/socialisateurR.png',
                      Colors.red,
                      5, // Nombre d'invites pour le rouge
                      12, // Nombre d'invites requis pour le rouge
                      false,
                    );
                  },
                  child: Image.asset('assets/socialisateurR.png', height: 80),
                ),
              ],
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

class RewardDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("-5 % sur toutes les confiseries"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("09U7FJ",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Image.asset("assets/qrcode.png", width: 150, height: 150),
            SizedBox(height: 16),
            Text("Où ?", style: TextStyle(fontSize: 18)),
            Text("Ciné 104", style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text("Date d'expiration", style: TextStyle(fontSize: 18)),
            Text("15/07/2025", style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text("Détails", style: TextStyle(fontSize: 18)),
            Text(
              "Offre valable en France, à usage unique, sur présentation de ce bon dans la limite des stocks disponibles et jusqu'à la date mentionnée. Offre non cumulable avec d'autres réductions en cours.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
