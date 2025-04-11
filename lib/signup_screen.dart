// signup_screen.dart
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10), // Espacement en haut
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 80,
                    height: 90,
                  ),
                  SizedBox(width: 16), // Espacement entre le logo et le titre
                  Image.asset(
                    'assets/titre.png',
                    height: 80,
                  ),
                ],
              ),
              SizedBox(height: 40),
              Text(
                'Bienvenue !',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30), // Espacement avant les champs
              TextField(
                decoration: InputDecoration(
                  labelText: 'Prénom *',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nom *',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Adresse mail *',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Mot de passe *',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirmer le mot de passe *',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30), // Espacement avant le bouton
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF065AF4), // Couleur de fond du bouton
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15), // Taille du bouton
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Coins arrondis
                  ),
                  elevation: 5, // Ombre du bouton
                ),
                child: Text(
                  "S'inscrire",
                  style: TextStyle(
                    fontSize: 18, // Taille du texte
                    fontWeight: FontWeight.bold, // Texte en gras
                    color: Colors.white, // Couleur du texte
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Texte "Déjà un compte ?"
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Déjà un compte ? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Text(
                      "Connectez-vous",
                      style: TextStyle(
                        color: Color(0xFF065AF4),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Ligne "ou"
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("ou"),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Bouton Google
              ElevatedButton.icon(
                onPressed: () {
                  // Action pour inscription avec Google
                  print("Inscription avec Google");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Fond blanc
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(color: Colors.grey), // Bordure grise
                  ),
                  elevation: 2,
                ),
                icon: Image.asset(
                  'assets/google_logo.png',
                  height: 24,
                ),
                label: Text(
                  "S'inscrire avec Google",
                  style: TextStyle(
                    color: Colors.black, // Texte noir
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}