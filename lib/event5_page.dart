import 'package:flutter/material.dart';

class Event5Page extends StatelessWidget {
  final Color customBlue = const Color(0xFF25346D);

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
                background: Image.asset('assets/photo.png', fit: BoxFit.cover),
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
                        Text("Dock B", style: TextStyle(color: Colors.grey)),
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
                    Divider(thickness: 1, color: Colors.grey[300]),
                    SizedBox(height: 12),
                    Text(
                      "🚨 JAEL – MOTION SICKNESS RELEASE PARTY 🚨",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Préparez-vous pour une nuit de beats survoltés, JAEL prend le contrôle du Dock B le 11 avril ! Le DJ, producteur et multi-instrumentiste néerlandais débarque avec son son signature pour célébrer la sortie de Motion Sickness.",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Attendez-vous à un set électrisant mêlant Baile Funk, Garage, UK Bass et electro, le tout porté par une énergie inarrêtable.\nLe reste du lineup arrive bientôt – restez connectés !",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    Text("📍 Dock B – Pantin"),
                    Text("🗓️ vendredi 11 avril 2024"),
                    Text("⏰ 00h00 – 06h00"),
                    Text("🎟️ billetterie disponible sur Shotgun& Dice"),
                    Text(
                        " Notre lieu se veut inclusif et bienveillant, nous ne tolérons aucune forme de discrimination "),
                    Text(
                        "🔊 Nous vous invitons à signaler à notre staff tout comportement inapproprié lors d’une soirée. 🔊"),
                    SizedBox(height: 24),
                    Text("Dates et horaires",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 12),
                    Center(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: customBlue),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          children: [
                            Text("Ven. 11 avr.",
                                style: TextStyle(color: customBlue)),
                            Text("23:45", style: TextStyle(color: customBlue)),
                          ],
                        ),
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
                    Text("Dock B",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    Text("1 Place de la Pointe, 93500 Pantin",
                        style: TextStyle(color: Colors.grey[400])),
                    SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      runSpacing: 8,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        transportChip("61", "", Color(0xFF6ECB5A)),
                        transportChip("147", "", Color(0xFFE4374D)),
                        transportChip("249", "", Color(0xFFE4374D)),
                        transportChip("N45", "", Color(0xFFF4B400)),
                        transportChip(
                            "5", "Église de Pantin", Color(0xFFF28C2B),
                            isCircle: true),
                        transportChip("E", "Pantin", Color(0xFF9B1567),
                            isCircle: true),
                      ],
                    ),
                    SizedBox(height: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset('assets/map3.png',
                          height: 160,
                          width: double.infinity,
                          fit: BoxFit.cover),
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
                                  child: Image.asset(reco['image']!,
                                      height: 160,
                                      width: 160,
                                      fit: BoxFit.cover),
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
              fontSize: 12,
            ),
          ),
        ),
        SizedBox(width: 6),
        Text(name, style: TextStyle(color: Colors.black)),
      ],
    );
  }
}
