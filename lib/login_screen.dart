import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          width: 80,
                          height: 90,
                        ),
                        SizedBox(width: 16),
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
                        fontFamily: 'MabryPro',  // Appliquer la police ici
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      style: TextStyle(fontFamily: 'MabryPro'),  // Appliquer la police ici
                      decoration: InputDecoration(
                        labelText: 'Adresse mail *',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      style: TextStyle(fontFamily: 'MabryPro'),  // Appliquer la police ici
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Mot de passe *',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          print("Mot de passe oublié");
                        },
                        child: Text(
                          "Mot de passe oublié ?",
                          style: TextStyle(
                            fontFamily: 'MabryPro',  // Appliquer la police ici
                            color: Color(0xFF065AF4),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    // Bouton avec l'image de fond
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          image: AssetImage('assets/fond.png'), // Image de fond du bouton
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent, // Rendre l'arrière-plan du bouton transparent
                          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 5,
                        ),
                        child: Text(
                          "Se connecter",
                          style: TextStyle(
                            fontFamily: 'MabryPro',  // Appliquer la police ici
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Le texte reste blanc
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Pas de compte ? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/signup');
                          },
                          child: Text(
                            "Inscrivez-vous",
                            style: TextStyle(
                              fontFamily: 'MabryPro',  // Appliquer la police ici
                              color: Color(0xFF065AF4),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
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
                    ElevatedButton.icon(
                      onPressed: () {
                        print("Connexion avec Google");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Colors.grey),
                        ),
                        elevation: 2,
                      ),
                      icon: Image.asset(
                        'assets/google_logo.png',
                        height: 24,
                      ),
                      label: Text(
                        "Se connecter avec Google",
                        style: TextStyle(
                          fontFamily: 'MabryPro',  // Appliquer la police ici
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
