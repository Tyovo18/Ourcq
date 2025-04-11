import 'package:latlong2/latlong.dart';

class Place {
  final String name;
  final LatLng location;
  final String description;
  final String smallDesc;
  final String imageUrl;
  final String openingHours;
  final List<String> gallery;

  Place({
    required this.name,
    required this.location,
    required this.description,
    required this.smallDesc,
    required this.imageUrl,
    required this.openingHours,
    required this.gallery,
  });
}

final List<Place> places = [
  Place(
    name: "Ciné 104",
    location: LatLng(48.8921813, 2.4090396),
    description:
        "Situé au cœur de Pantin, Ciné 104 est un cinéma d’art et d’essai réputé pour sa programmation éclectique, mêlant films d’auteur, classiques et avant-premières.",
    smallDesc: "Cinéma art et essai à Pantin, avec une programmation variée",
    imageUrl: "assets/cine.png",
    openingHours: "11h00 - 22h45",
    gallery: [
      "assets/cine1.png",
      "assets/cine2.png",
      "assets/cine3.png",
      "assets/cine4.png",
    ],
  ),
  Place(
    name: "Philharmonie de Paris",
    location: LatLng(48.891566, 2.39407),
    description: "Située dans le parc de la Villette, la Philharmonie de Paris est un lieu culturel majeur entièrement tourné vers la musique. Avec son architecture contemporaine signée Jean Nouvel et sa grande salle de concert réputée pour son acoustique exceptionnelle, elle propose une programmation riche et ouverte, mêlant musique classique, jazz, musiques actuelles et du monde.\n\n"
        "Tout au long de l’année, la Philharmonie accueille aussi des expositions, des festivals, des conférences et des ateliers pour petits et grands. C’est un espace vivant, qui donne envie de découvrir la musique autrement, que l’on soit mélomane passionné ou simplement curieux.\n\n"
        "Un lieu où la culture musicale se vit pleinement, dans un esprit de transmission, d’expérimentation et de partage.",
    smallDesc: "Lieu dédié à la musique, concerts et expositions",
    imageUrl: "assets/philharmonie.png",
    openingHours: "12h00 - 18h00",
    gallery: [
      "assets/philharmonie1.png",
      "assets/philharmonie2.png",
      "assets/philharmonie3.png",
    ],
  ),
  Place(
    name: "Cité Fertile",
    location: LatLng(48.90059, 2.39812),
    description: "La Cité Fertile est un tiers-lieu écoresponsable dédié à la transition écologique et sociale, installé sur une ancienne gare de marchandises SNCF à Pantin.\n\n"
        "Sur un hectare, elle offre un espace de vie et d'expérimentation où se rencontrent citoyens, associations et entreprises engagés pour construire ensemble la ville durable de demain.\n\n"
        "Avec ses espaces végétalisés, son potager pédagogique et sa brasserie artisanale, la Cité Fertile propose une programmation riche : ateliers, conférences, festivals et événements conviviaux rythment la vie de ce lieu innovant.",
    smallDesc: "Tiers-lieu écologique à Pantin, dédié aux projets et initiatives durables",
    imageUrl: "assets/cite.png",
    openingHours: "12h00 - 2h00",
    gallery: [
      "assets/cite1.png",
      "assets/cite2.png",
      "assets/cite3.png",
    ],
  ),
];
