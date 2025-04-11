import 'package:flutter/material.dart';

class Event4Page extends StatelessWidget {
  final Color customBlue = const Color(0xFF25346D);

  final List<Map<String, String>> dates = [
    {'day': 'Ven. 11 avr.', 'hour': '20:00'}
  ];

  final List<Map<String, String>> recommendations = [
    {
      'image': 'assets/guitarist.png',
      'title': 'Nom event',
      'date': '12 jan. 2025 - 20:30'
    },
    {
      'image': 'assets/guitarist.png',
      'title': 'Nom event',
      'date': '12 jan. 2025 - 20:30'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              backgroundColor: Colors.black,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/trompette.png',
                  fit: BoxFit.cover,
                ),
              ),
              leading: Positioned(
              top: 20,
              left: 10,
              child: IconButton(
                iconSize: 40,
                icon: Icon(Icons.arrow_circle_left_rounded, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.share, color: Colors.black),
                  ),
                )
              ],
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                            size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text("Philharmonie de Paris",
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text("Rising Stars / Matilda Lloyd - Simon Lepper",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text("Ven. 11 avr 2025",
                        style: TextStyle(color: Colors.grey[700])),
                    SizedBox(height: 16),
                    Text(
                      "\u00c9toile montante de la trompette, Matilda Lloyd présente un attrayant panorama d’œuvres et de transcriptions, dans lequel Debussy, Fauré et Ibert côtoient notamment Bozza, un des plus prolifiques compositeurs pour instruments à vent.",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Saluée par The Times comme « une éloquente soliste de la trompette », Matilda Lloyd a fait dès 2016 ses débuts aux célèbres Proms de Londres. En compagnie de Simon Lepper, elle assure la création française d’une pièce de Dani Howard, compositrice britannique de 32 ans dont le catalogue déjà imposant comprend plusieurs pages dédiées aux cuivres. S’il est un créateur qui a considérablement enrichi le répertoire pour trompette, c’est bien Eugène Bozza (1905-1991) qui, de 1943 à 1978 a composé pas moins de six œuvres pour l’instrument avec accompagnement de piano. Le Belge Théo Charlier (1868-1944) s’est lui aussi consacré assidûment à la trompette (un concours international porte son nom), particulièrement à travers 36 Études transcendantes.",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Ces artistes sont présentés par le Barbican Centre de Londres et le Konserthuset de Stockholm.",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 24),
                    Text("Dates et horaires",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 12),
                    SizedBox(
                      height: 80,
                      child: PageView.builder(
                        controller: PageController(viewportFraction: 0.5),
                        itemCount: dates.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: dateBox(
                                dates[index]['day']!, dates[index]['hour']!),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.language, color: customBlue),
                          label: Text("Site web",
                              style: TextStyle(color: customBlue)),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: customBlue),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.confirmation_num_outlined,
                              color: Colors.white),
                          label: Text("Billetterie",
                              style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: customBlue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32),
                    Text("Y accéder",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 12),
                    Text("Philharmonie de Paris",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    Text("221 Av. Jean Jaurès, 75019 Paris",
                        style: TextStyle(color: Colors.grey[400])),
                    SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        transportChip("N13", "", Color(0xFFF27BAB)),
                        transportChip("N41", "", Color(0xFFF27BAB)),
                        transportChip("N45", "", Color(0xFFF27BAB)),
                        transportChip("E", "Pantin", Color(0xFF9B1567),
                            isCircle: true),
                        transportChip("5", "Porte de Pantin", Color(0xFFF28C2B),
                            isCircle: true),
                        transportChip(
                            "T3b", "Porte de Pantin", Color(0xFF26A67D)),
                      ],
                    ),
                    SizedBox(height: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/map2.png',
                        height: 160,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 32),
                    Text("On vous recommande aussi...",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 12),
                    SizedBox(
                      height: 280,
                      child: PageView.builder(
                        controller: PageController(viewportFraction: 0.5),
                        itemCount: recommendations.length,
                        itemBuilder: (context, index) {
                          final reco = recommendations[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    reco['image']!,
                                    height: 160,
                                    width: 160,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(Icons.location_on_outlined,
                                        size: 14, color: Colors.grey[600]),
                                    SizedBox(width: 4),
                                    Text("Nom du lieu",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[600])),
                                  ],
                                ),
                                Text(reco['title']!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.black)),
                                Text(reco['date']!,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey[700])),
                                SizedBox(height: 8),
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.open_in_new,
                                      size: 16, color: Colors.white),
                                  label: Text("En savoir plus",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white)),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: customBlue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dateBox(String jour, String heure) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF25346D)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(jour, style: TextStyle(color: Color(0xFF25346D))),
          Text(heure, style: TextStyle(color: Color(0xFF25346D))),
        ],
      ),
    );
  }

  Widget transportChip(String code, String name, Color color,
      {bool isCircle = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: color,
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: isCircle ? null : BorderRadius.circular(3),
          ),
          child: Text(
            code,
            style: TextStyle(
                color: isCircle ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12),
          ),
        ),
        SizedBox(width: 6),
        Text(name, style: TextStyle(color: Colors.black)),
      ],
    );
  }
}
