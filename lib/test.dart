import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final myList = [
    {
      "image": "image1.png",
      "titre": "Imprimante",
      "soustitre": "Salle 228",
    },
    {
      "image": "image1.png",
      "titre": "Imprimante",
      "soustitre": "Salle 230",
    },
    {
      "image": "image1.png",
      "titre": "Ordinateur",
      "soustitre": "Salle 228",
    },
    {
      "image": "image1.png",
      "titre": "Ordinateur",
      "soustitre": "Salle 230",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            ListView.builder(
              itemCount: myList.length,
              itemBuilder: (context, index) {
                final myElmt = myList[index];
                final myImg = myElmt['image'];
                final myTle = myElmt['titre'];
                final mySstle = myElmt['soustitre'];
                return Card(
                  child: ListTile(
                    leading: Image.asset("assets/$myImg"),
                    title: Text("$myTle - $mySstle"),
                  ),
                );
              },
            ),
          ],
        ),
        ),
      ),
    );
  }
}
