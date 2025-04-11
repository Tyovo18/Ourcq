import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  ResultScreen(this.score, this.totalQuestions);

  String _getMessage(int score) {
    if (score == totalQuestions) {
      return "Wow ! Tu es un.e véritable expert.e !";
    } else if (score > totalQuestions / 2) {
      return "Pas mal ! Encore une fois !";
    } else {
      return "Courage, tu feras mieux la prochaine fois !";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Encadré avec fond d'image
            Container(
              width: MediaQuery.of(context).size.width * 0.9, // Rendre l'encadré plus long
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/fond.png'), // Chemin vers l'image de fond
                  fit: BoxFit.cover, // Adapter l'image à l'encadré
                ),
                borderRadius: BorderRadius.circular(20), // Coins arrondis
              ),
              padding: EdgeInsets.fromLTRB(20, 20, 20, 80), // Ajout de padding en bas (40)
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image en haut
                  Image.asset(
                    'assets/score.png', // Chemin vers l'image
                    height: 200, // Agrandir l'image
                    width: 200,
                  ),
                  SizedBox(height: 20),

                  // Encadré avec "Ton score est de" et le score
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 4), // Bordure blanche épaisse
                      borderRadius: BorderRadius.circular(8), // Coins arrondis
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    child: Column(
                      children: [
                        Text(
                          'Ton score est de', // Texte normal
                          style: TextStyle(
                            fontSize: 24, // Taille normale pour le texte
                            fontWeight: FontWeight.bold, // Texte en gras
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10), // Espacement entre le texte et le score
                        Text(
                          '$score', // Chiffre du score
                          style: TextStyle(
                            fontSize: 48, // Taille plus grande pour le chiffre
                            fontWeight: FontWeight.bold, // Texte en gras
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  // Texte en dessous du score
                  Text(
                    _getMessage(score), // Message dynamique basé sur le score
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold, // Texte en gras
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),

            // Boutons en bas
            Column(
              children: [
                // Bouton "Ressayer"
                ElevatedButton(
                  onPressed: () {
                    // Action pour ressayer le quizz
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => QuizScreen()), // Naviguer vers l'écran du quizz
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF25346D), // Fond bleu
                    foregroundColor: Colors.white, // Texte blanc
                    padding: EdgeInsets.symmetric(vertical: 15), // Espacement vertical
                    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 50), // Largeur de l'encadré
                  ),
                  child: Text('Réessayer'),
                ),
                SizedBox(height: 10), // Espacement entre les boutons

                // Bouton "Retour aux quizz"
                OutlinedButton(
                  onPressed: () {
                    // Action pour retourner à l'accueil ou à la liste des quizz
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()), // Naviguer vers l'écran d'accueil
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color(0xFF25346D), width: 2), // Bordure bleue
                    backgroundColor: Colors.white, // Fond blanc
                    foregroundColor: Color(0xFF25346D), // Texte bleu
                    padding: EdgeInsets.symmetric(vertical: 15), // Espacement vertical
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 50), // Largeur de l'encadré
                  ),
                  child: Text('Retour aux quizz'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
