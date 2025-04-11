import 'package:flutter/material.dart';

// Assurez-vous que vous importez les pages correspondantes
import 'socialisateur.dart';
import 'rat.dart';
import 'marathonien.dart';
import 'globe-trotteur.dart';
import 'champion.dart';
import 'critique.dart';

class BadgePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Centrer tout le contenu
          children: [
            // Flèche de retour en haut à gauche
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Retour à la page précédente
                  },
                  child: Icon(Icons.arrow_back,
                      color: Color(0xFF25346D), size: 30),
                ),
              ),
            ),

            // Image 3-6 avec bords arrondis
            ClipRRect(
              borderRadius: BorderRadius.circular(16), // Arrondir les bords
              child: Image.asset(
                'assets/3-6.png',
                height: 200,
                fit: BoxFit.cover, // Garder l'image bien ajustée
              ),
            ),

            // Row 1 avec les logos
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Socialisateur
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SocialisateurPage()),
                    );
                  },
                  child: Image.asset('assets/socialisateurV.png', height: 80),
                ),
                SizedBox(width: 20),

                // Logo Rat
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RatPage()),
                    );
                  },
                  child: Image.asset('assets/ratg.png', height: 80),
                ),
                SizedBox(width: 20),

                // Logo Marathonien
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MarathonienPage()),
                    );
                  },
                  child: Image.asset('assets/marathonieng.png', height: 80),
                ),
              ],
            ),

            SizedBox(height: 24),

            // Row 2 avec les logos
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Globe-Trotteur
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GlobeTrotteurPage()),
                    );
                  },
                  child: Image.asset('assets/globej.png', height: 80),
                ),
                SizedBox(width: 20),

                // Logo Champion
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChampionPage()),
                    );
                  },
                  child: Image.asset('assets/tropheg.png', height: 80),
                ),
                SizedBox(width: 20),

                // Logo Critique
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CritiquePage()),
                    );
                  },
                  child: Image.asset('assets/critique.png', height: 80),
                ),
              ],
            ),

            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
