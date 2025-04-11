import 'package:flutter/material.dart';

class Event3Page extends StatelessWidget {
  final Color customBlue = const Color(0xFF25346D);

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
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/yoga.png',
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
                            color: Colors.grey[500], size: 16),
                        SizedBox(width: 4),
                        Text("Nom du lieu",
                            style: TextStyle(color: Colors.grey[500])),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text("Nom event",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text("12 jan. 2025 - 20:30",
                        style: TextStyle(color: Colors.grey[700])),
                    SizedBox(height: 16),
                    Text(
                      "Lorem ipsum dolor sit amet consectetur. Proin mi purus hac aliquam vitae aliquam leo. Platea elementum mauris scelerisque lorem ornare in cursus.",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Dignissim dolor lacinia amet viverra. Aliquam accumsan curabitur ac tellus mattis nulla eget eu dolor. Est sollicitudin eu libero at cursus dis odio risus eget. Egestas sollicitudin viverra nunc fringilla. Egestas nunc cursus rutrum pretium pulvinar sed cras ac convallis.",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 24),
                    Text("Dates et horaires",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 12),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: customBlue),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Column(
                          children: [
                            Text("Dim. 12 jan.",
                                style: TextStyle(color: customBlue)),
                            Text("20:30", style: TextStyle(color: customBlue)),
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
                    Text("Nom du lieu",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    Text("00 rue adresse du lieu, 93000",
                        style: TextStyle(color: Colors.grey[600])),
                    SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        transportChip("5", "Nom de l'arrêt", Color(0xFFF28C2B),
                            isCircle: true),
                        transportChip("E", "Nom de l'arrêt", Color(0xFF9B1567),
                            isCircle: true),
                        transportChip("60", "Nom de l'arrêt", Color(0xFFE50914),
                            isCircle: false),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: 120,
                      width: double.infinity,
                      color: Colors.grey[300],
                      alignment: Alignment.center,
                      child: Text("Map avec localisation du lieu"),
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
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'assets/micro.png',
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
                                Text("Nom event",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.black)),
                                Text("Du 12 jan. au 24 jan. 2025",
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
      {bool isCircle = true}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: color,
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: isCircle ? null : BorderRadius.circular(4),
          ),
          child: Text(
            code,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
        SizedBox(width: 6),
        Text(name, style: TextStyle(color: Colors.grey[800])),
      ],
    );
  }
}