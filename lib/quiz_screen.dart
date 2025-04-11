import 'package:flutter/material.dart';
import 'result_screen.dart';

class Question {
  String questionText;
  List<String> options;
  int correctAnswerIndex;

  Question(this.questionText, this.options, this.correctAnswerIndex);
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> questions = [
    Question(
      "En quelle année la Cité des Sciences et de l'Industrie a-t-elle été créée ?",
      ["1954", "1986", "1996", "2005"],
      1,
    ),
    Question(
      "Quel président français a inauguré la Cité des Sciences et de l'Industrie ?",
      ["George Pompidou", "Valéry Giscard d'Estaing", "François Mitterrand", "Jacques Chirac"],
      2,
    ),
    Question(
      "Quel bâtiment sphrérique emblématique est associé à la Cité des sciences ?",
      ["La Géode", "Le Planétarium", "Le Dôme", "La Sphère"],
      0,
    ),
    Question(
      "Avant de devenir la Cité des Sciences, quel était l'usage principal du site où elle est située ?",
      ["Des abattoirs", "Une gare ferroviaire", "Une usine automobile", "Un marché ouvert"],
      0,
    ),
    Question(
      "Quel architecte a transformé l'ancienne salle des ventes inachevée en la Cité des Sciences ?",
      ["Jean Nouvel", "Renzo Piano", "Adrien Fainsilber", "Norman Foster"],
      2,
    ),
    Question(
      "Quel est le nom du sous-marin exposé à la Cité des Sciences et de l'Industrie ?",
      ["Le Nautilus", "Le Redoutable", "Le Triomphant", "L'Argonaute"],
      3,
    ),
    Question(
      "Quel est la mission principale de la Cité des Sciences et de l'Industrie ?",
      ["Conserver des oeuvres d'art", "Promouvoir la science et la technique", "Former des ingénieurs", "Organiser des foires industrielles"],
      1,
    ),
    Question(
      "En moyenne, combien de visiteurs la Cité des Sciences accueille-t-elle chaque année ?",
      ["1.5 million", "2 millions", "2.4 millions", "3 millions"],
      1,
    ),
    Question(
      "Quel espace dédié aux enfants propose des expositions interactives à la Cité des Sciences ?",
      ["La Cité des enfants", "Le Jardin des sciences", "Le Labo des petits", "L'Atelier des découvertes"],
      0,
    ),
    Question(
      "Quel est le nom du planétarium de la Cité des Sciences et de l'Industrie ?",
      ["Planétarium de Paris", "Planétarium de la Cité", "Planétarium de la Villette", "Planétarium Universcience"],
      2,
    ),
  ];

  int questionIndex = 0;
  int score = 0;
  bool hasAnswered = false;
  int selectedAnswerIndex = -1;

  void answerQuestion(int selectedIndex) {
    if (hasAnswered) return;

    setState(() {
      hasAnswered = true;
      selectedAnswerIndex = selectedIndex;
      if (selectedIndex == questions[questionIndex].correctAnswerIndex) {
        score++;
      }
    });
  }

  void goToNextQuestion() {
    setState(() {
      hasAnswered = false;
      selectedAnswerIndex = -1;
      if (questionIndex < questions.length - 1) {
        questionIndex++;
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(score, questions.length),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = questions[questionIndex];

    return Scaffold(
      appBar: AppBar(title: Text('Quizz • La Cité des Sciences et de l’Industrie')),
      body: SingleChildScrollView( // Permet de défiler le contenu
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Barre de progression
              LinearProgressIndicator(
                value: (questionIndex + 1) / questions.length,
                backgroundColor: Colors.grey[300],
                color: Color(0xFF25346D),
                minHeight: 8,
              ),
              SizedBox(height: 20),

              // Encadré avec fond image
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/fond.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  currentQuestion.questionText,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.6),
                        offset: Offset(1, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 30),

              // Boutons de réponses
              ...currentQuestion.options.asMap().entries.map((entry) {
                int idx = entry.key;
                String option = entry.value;

                String optionLabel = String.fromCharCode(65 + idx); // 65 est le code ASCII pour 'A'

                Color? backgroundColor;
                Color borderColor = Color(0xFF25346D);
                Color textColor = Color(0xFF25346D); // Couleur par défaut du texte

                if (hasAnswered) {
                  if (idx == currentQuestion.correctAnswerIndex) {
                    backgroundColor = Color(0xFF265936); // Vert pour les bonnes réponses
                    textColor = Colors.white; // Texte blanc sur fond vert
                  } else if (idx == selectedAnswerIndex) {
                    backgroundColor = Color(0xFFF21C1D); // Rouge pour les mauvaises réponses
                    textColor = Colors.white; // Texte blanc sur fond rouge
                  } else {
                    backgroundColor = Colors.white;
                  }
                } else {
                  backgroundColor = Colors.white;
                }

                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 6),
                  child: OutlinedButton(
                    onPressed: () => answerQuestion(idx),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: backgroundColor,
                      side: BorderSide(color: borderColor, width: 2),
                      padding: EdgeInsets.symmetric(vertical: 20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start, // Aligner la lettre au début
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20), // Padding uniquement à gauche
                          child: Text(
                            optionLabel, // Afficher la lettre (A, B, C, D)
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold, // Texte en gras
                              color: textColor, // Couleur dynamique du texte
                            ),
                          ),
                        ),
                        SizedBox(width: 10), // Espacement entre la lettre et le texte
                        Expanded(
                          child: Text(
                            option, // Afficher l'option centrée
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold, // Texte en gras
                              color: textColor, // Couleur dynamique du texte
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),

              SizedBox(height: 20),

              if (hasAnswered)
                ElevatedButton(
                  onPressed: goToNextQuestion,
                  child: Text(
                    questionIndex < questions.length - 1
                        ? "Question suivante"
                        : "Voir les résultats",
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
