import 'package:flutter/material.dart';
import 'parametres.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Text(
                    'Profil',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  IconButton(
                    icon: const Icon(Icons.settings, color: Colors.black),
                    onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ParametresPage(),
                          ),
                        );
                      },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profil.png'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Lina Lambrecq',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'lina.lambrecq23@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 32),
            _buildActionButton(
              text: 'Invite tes amis !',
              description: 'Gagne des réductions en partageant l’appli !',
              backgroundColor: const Color(0xFF065AF4),
              textColor: Colors.white,
            ),
            const SizedBox(height: 16),
            _buildActionButton(
              text: 'Lieux visités',
              description: 'Accède à l’historique de tes déplacements',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderColor: Colors.grey.shade300,
            ),
            const SizedBox(height: 16),
            _buildActionButton(
              text: 'Coupons et codes de réduction',
              description: 'Profite d’offres exclusives et d’avantages',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderColor: Colors.grey.shade300,
            ),
            const SizedBox(height: 32),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Centres d’intérêt',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInterestButton(
                  text: 'Cinémas',
                  color: const Color(0xFF065AF4),
                  icon: Icon(Icons.movie_creation_outlined, color: Color.fromARGB(255, 0, 0, 0)),
                ),
                _buildInterestButton(
                  text: 'Concerts',
                  color: const Color(0xFFE9C71C),
                  icon: Icon(Icons.music_note_outlined, color: Color.fromARGB(255, 0, 0, 0)),
                ),
                _buildInterestButton(
                  text: 'Musées',
                  color: const Color(0xFFF21D1D),
                  icon: Icon(Icons.museum_outlined, color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF065AF4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: Text('Modifier', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
              ),
            ),
            const SizedBox(height: 32),
            Container(
              color: const Color(0xFFF9F9F9),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Row(
                children: [
                  const Icon(Icons.help_outline, color: Color(0xFF065AF4)),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Besoin d’aide ?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Des questions ? Nous sommes là pour y répondre',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'App version 1.0.0',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String text,
    required String description,
    required Color backgroundColor,
    Color textColor = Colors.white,
    Color borderColor = Colors.transparent,
  }) {
    return Container(
      width: 350,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(fontSize: 14, color: textColor.withOpacity(0.8)),
          ),
        ],
      ),
    );
  }

  Widget _buildInterestButton({
    required String text,
    required Color color,
    required Icon icon, 
  }) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 8),
        
      ],
    );
  }
}
