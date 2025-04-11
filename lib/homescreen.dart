import 'package:flutter/material.dart';
import 'places_data.dart';
import 'dart:ui';
import 'quiz_screen.dart';
import 'event3_page.dart';
import 'event4_page.dart';
import 'event5_page.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Liste des descriptions avec titre, date et lieu
    final List<Map<String, String>> imageDescriptions = [
      {"title": "Hatha Yoga avec Nour Yoga", "date": "Tous les vendredis - 19:00", "location": "Cité Fertile", "image": "assets/image1.png"},
      {"title": "Rising Stars / Matilda Lloyd - Simon Lepper", "date": "Ven. 11 avr 2025", "location": "Philharmonie de Paris","image": "assets/image2.png"},
      {"title": "Jael: Motion sickness release party", "date": "Ven. 11 avr 2025", "location": "Dock B","image": "assets/image3.png"},
    ];

  final List<Map<String, String>> imageInfo = [
    {"title": "Test my knowledge", "image": "assets/quiz.png", "route": "quiz"},
    {"title": "Customize my suggestions", "image": "assets/personnalize.png", "route": "null"},

  ];


    final List<Map<String, String>> imagePopulaire = [
      {"title": "1km de de danse", "location": "Berges de l'Ourcq", "image": "assets/populaire1.png"},
      {"title": "Theodora en concert", "location": "Cabaret Sauvage", "image": "assets/populaire2.png"},
      {"title": "House of Underground", "location": "Trabendo", "image": "assets/populaire3.png"},
      {"title": "Cité LEGO", "location": "Cité des Sciences et de l'Industrie", "image": "assets/populaire4.png"},
      {"title": "Printemps du Cinéma", "location": "Tous les cinémas", "image": "assets/populaire5.png"},

    ];

        
   final PageController _controller = PageController(
      initialPage: 1, // Définit la deuxième image comme étant la page au centre
      viewportFraction: 0.6, // Largeur de l'élément (80% de l'écran)
    );
    

    return Scaffold(
      body: SingleChildScrollView( // Ajouté pour éviter l'overflow vertical
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Barre de recherche
              TextField(
                decoration: InputDecoration(
                  hintText: 'Recherche',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  suffixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 20),

              // Titre "Cette semaine"
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Cette semaine",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Slider horizontal 1
              Container(
                height: 340, // Hauteur du slider
                child: ListView.builder(
                  scrollDirection: Axis.horizontal, // Défilement horizontal
                  itemCount: imageDescriptions.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0), // Espacement entre les items
                      child: GestureDetector(
                        onTap: () {
                          // Naviguer vers une page spécifique pour chaque élément du slider
                          if (index == 0) {
                            // Si l'index est 0, on va vers Event1.dart
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Event3Page(), // Page Event1.dart
                              ),
                            );
                          } else if (index == 1) {
                            // Si l'index est 1, on va vers Event2.dart
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Event4Page(), // Page Event2.dart
                              ),
                            );
                          } else if (index == 2) {
                            // Si l'index est 2, on va vers Event3.dart
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Event5Page(), // Page Event3.dart
                              ),
                            );
                          }
                          // Vous pouvez ajouter plus de conditions pour d'autres éléments si nécessaire
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // Alignement à gauche
                          children: [
                            // Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15), // Coins arrondis
                              child: Image.asset(
                                imageDescriptions[index]['image']!, // Chemin vers les images
                                fit: BoxFit.cover,
                                width: 180,
                                height: 180,
                              ),
                            ),
                            SizedBox(height: 8),

                            // Localisation avec icône
                            Row(
                              children: [
                                Icon(Icons.location_on, size: 16, color: Colors.grey),
                                SizedBox(width: 4),
                                Text(
                                  imageDescriptions[index]['location']!,
                                  style: TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),

                            // Titre
                            SizedBox(
                              width: 180, // même largeur que l'image
                              child: Text(
                                imageDescriptions[index]['title']!,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            // Date
                            Text(
                              imageDescriptions[index]['date']!,
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(height: 4),

                            // Bouton "Show more"
                            ElevatedButton(
                              onPressed: () {
                                // Naviguer vers une page spécifique pour chaque événement
                                if (index == 0) {
                                  // Si l'index est 0, on va vers Event1.dart
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Event3Page(),
                                    ),
                                  );
                                } else if (index == 1) {
                                  // Si l'index est 1, on va vers Event2.dart
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Event4Page(),
                                    ),
                                  );
                                } else if (index == 2) {
                                  // Si l'index est 2, on va vers Event3.dart
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Event5Page(),
                                    ),
                                  );
                                }
                                // Vous pouvez ajouter plus de conditions pour d'autres éléments si nécessaire
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromRGBO(37, 52, 109, 1),
                                minimumSize: Size(120, 30),
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(11),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Show more',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(Icons.open_in_new, size: 16, color: Colors.white),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),


              // Titre "Cette semaine"
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Pour toi",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Deuxième slider horizontal
              Container( //Map 
                height: 190, // Hauteur du slider
                child: ListView.builder(
                  scrollDirection: Axis.horizontal, // Défilement horizontal
                  itemCount: places.length, // Utilisation de la longueur des lieux
                  itemBuilder: (context, index) {
                    final place = places[index]; // Récupération du lieu
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: GestureDetector(
                        onTap: () {
                          // Redirection vers la page des détails
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaceDetailsPage(place: place),
                            ),
                          );
                        },
                        child: Container(
                        width: 210, // Largeur de chaque box
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(3, 3), // Décalage de l'ombre
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image avec coins arrondis
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),

                              ),
                              child: Image.asset(
                                place.imageUrl,
                                fit: BoxFit.cover,
                                width: 210,
                                height: 100,
                              ),
                            ),
                            // Texte sous l'image
                            Padding(
                              padding: const EdgeInsets.all(8.0), // Un seul padding autour des deux textes
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start, // Aligner à gauche (optionnel)
                                children: [
                                  Text(
                                    place.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'MabryPro',
                                    ),
                                  ),
                                  SizedBox(height: 2), // Petit espace entre les deux textes
                                  Text(
                                    place.smallDesc,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'MabryPro',
                                      height: 1.1,
                                      color: const Color.fromRGBO(158, 158, 158, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Quizz et questionnaires",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 20),

              Container( // Quiz
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imageInfo.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: GestureDetector(
                        onTap: () {
                          // Vérifie si l'élément actuel est celui qui doit naviguer vers QuizScreen
                          if (index == 0) {  // Par exemple, l'élément à l'index 0
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => QuizScreen()),
                            );
                          }
                          // Si tu veux ajouter d'autres conditions pour d'autres éléments, tu peux faire comme ceci :
                          // else if (index == 1) { ... }
                          // et ainsi de suite pour d'autres index.
                        },
                        child: Container(
                          width: 210, // Largeur de chaque box
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(3, 3), // Décalage de l'ombre
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Image avec coins arrondis
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                                child: Image.asset(
                                  imageInfo[index]['image']!,
                                  fit: BoxFit.cover,
                                  width: 210,
                                  height: 90,
                                ),
                              ),
                              // Texte sous l'image
                              Padding(
                                padding: const EdgeInsets.all(8.0), // Padding autour des textes
                                child: Align(
                                  alignment: Alignment.center,
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: 200), // Limite la largeur du texte
                                    child: Text(
                                      imageInfo[index]['title']!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      textAlign: TextAlign.center, // Centre le texte même sur plusieurs lignes
                                      style: TextStyle(
                                        fontSize: 16,
                                        height: 1.1,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),

                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height:20),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Populaire",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 20),

                            
              Container(
                height: 300,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: imagePopulaire.length,
                  itemBuilder: (context, index) {
                    return AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        double value = 1.0;
                        double blurValue = 0.0;

                        // Vérifie si _controller.page n'est pas null avant de l'utiliser
                        if (_controller.position.haveDimensions && _controller.page != null) {
                          value = (_controller.page! - index).abs();
                          value = (1 - (value * 0.3)).clamp(0.7, 1.0);

                          // Appliquer le blur uniquement si la page est non null
                          blurValue = (_controller.page! - index).abs().clamp(0.0, 1.0) * 5;
                        }

                        return Transform.scale(
                          scale: value,
                          child: Opacity(
                            opacity: value < 1.0 ? 0.6 : 1.0,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8.0),  // Margin to space the pages
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.3),
                                        blurRadius: 10,
                                        offset: Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Stack(
                                      children: [
                                        // Apply a blur effect on the image
                                        ImageFiltered(
                                          imageFilter: ImageFilter.blur(
                                            sigmaX: blurValue,
                                            sigmaY: blurValue,
                                          ),
                                          child: Image.asset(
                                            imagePopulaire[index]['image']!,
                                            fit: BoxFit.cover,
                                            width: MediaQuery.sizeOf(context).width * 0.6,
                                            height: 270,
                                          ),
                                        ),
                                        // Lighter dark veil on the image
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Colors.black.withOpacity(0.2), // Reduced opacity for a lighter veil
                                          ),
                                          width: double.infinity,
                                          height: 270,
                                        ),
                                        // Text and other content on top of the image
                                        Positioned(
                                          bottom: 20,
                                          left: 20,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.sizeOf(context).width * 0.45,
                                                child: Text(
                                                  imagePopulaire[index]['title']!,
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    height: 1.1,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 4),
                                              SizedBox(
                                                width: MediaQuery.sizeOf(context).width * 0.4, // Adjust width if needed
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.location_on, size: 16, color: Colors.white),
                                                    SizedBox(width: 4),
                                                    Expanded(
                                                      child: Text(
                                                        imagePopulaire[index]['location']!,
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 1,
                                                        style: TextStyle(fontSize: 14, color: Colors.white),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),




              


            ],
          ),
        ),
      ),
    );
  }
}

class PlaceDetailsPage extends StatelessWidget {
  final Place place;

  PlaceDetailsPage({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(place.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 10,
              child: IconButton(
                iconSize: 40,
                icon: Icon(Icons.arrow_circle_left_rounded, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.67,
              minChildSize: 0.67,
              maxChildSize: 0.95,
              builder: (context, scrollController) {
                return Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2),
                    ],
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          place.name,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          place.description,
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 170,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: place.gallery.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(right: 10),
                                width: 230,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(place.gallery[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}