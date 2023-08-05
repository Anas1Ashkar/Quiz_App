import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showResultsMessage = false;
  int questionIndex = 0;
  int result = 0;

  List correctAnswers = [
    'football ',
    'black ',
    'Cheetah ',
    'Ronaldo ',
  ];

  List chosenAnswers = [];

  List<Map<String, dynamic>> questionsWithAnswers = [
    {
      'question': 'What is the best sport ?',
      'answers': [
        'basketball ',
        'football ',
        'volleyball ',
        'tennis ',
      ],
    },
    {
      'question': 'What is the most beautiful color ?',
      'answers': [
        'red ',
        'blue ',
        'black ',
        'green ',
      ],
    },
    {
      'question': 'What is the fastest animal ?',
      'answers': [
        'horse ',
        'turtle ',
        'dog ',
        'Cheetah ',
      ],
    },
    {
      'question': 'Who is the best player? Of course, Siiiiiiiiiiiiiii',
      'answers': [
        'Ronaldo ',
        'Messi ',
        'Salah ',
        'Shekabala ',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final questionWithAnswer = questionsWithAnswers[questionIndex];
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Quiz App"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    if (showResultsMessage == false) ...[
                      Text(questionWithAnswer['question'],
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1)),
                      const SizedBox(
                        height: 20,
                      ),
                      for (int i = 0;
                          i < questionWithAnswer['answers'].length;
                          i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                                ),
                                onPressed: () {
                                  setState(() {
                                    chosenAnswers
                                        .add(questionWithAnswer['answers'][i]);
                                    print(chosenAnswers);

                                    if (questionIndex <
                                        questionsWithAnswers.length - 1) {
                                      questionIndex++;
                                    } else {
                                      for (int j = 0;
                                          j < chosenAnswers.length;
                                          j++) {
                                        if (chosenAnswers[j] ==
                                            correctAnswers[j]) {
                                          result++;
                                        }
                                      }
                                      showResultsMessage = true;
                                    }
                                  });
                                },
                                child: Text(
                                  questionWithAnswer['answers'][i],
                                  style: const TextStyle(fontSize: 18),
                                )),
                          ),
                        ),
                    ],
                    if (showResultsMessage == true) ...[
                      Text('Congratulations!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.indigo.shade700)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Your score is: $result/${questionsWithAnswers.length}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              questionIndex = 0;
                              showResultsMessage = false;
                              result = 0;
                              chosenAnswers.clear();
                            });
                          },
                          child: const Text(
                            'Reset quiz',
                            style: TextStyle(color: Colors.red, fontSize: 15),
                          ))
                    ]
                  ],
                )
              ]),
        ),
      ),
    );
  }
}