class Question {
  final int? id, answer;
  final String question;
  final List<String>? options;

  Question({this.id, required this.question, this.answer, this.options});
}

List sample_data = [
  {
    "id": 1,
    "question": "Who among the following nations is not a member of BRICS?",
    "options": ['India', 'China', 'Russia', 'Japan'],
    "answer_index": 3,
  },
  {
    "id": 2,
    "question": "The Instrument Wind vane is used for measuring.",
    "options": [
      'Atmospheric pressure',
      'Velocity of Air',
      'Direction of Wind',
      'Air pressure'
    ],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": " Salt is obtained from sea water through which process.",
    "options": ['Adsorption', 'Evaporation', 'Sublimation', 'Absorption'],
    "answer_index": 1,
  },
  {
    "id": 4,
    "question": "The Samkhya School of Philosophy was founded by",
    "options": ['Gautam Buddha', 'Mahipala', 'Gopala', 'Kapila'],
    "answer_index": 3,
  },
  {
    "id": 5,
    "question":
        "Who among the given had translated the Upanishads from Sanskrit to Persian",
    "options": ['Dara Shukoh', 'Babar', 'Mirza Galib', 'Abul Fazal'],
    "answer_index": 0,
  },
  {
    "id": 6,
    "question": "What is the pH value of the human body?",
    "options": ['9.2 to 9.8', '7.0 to 7.8', '6.1 to 6.3', '5.4 to 5.6'],
    "answer_index": 1,
  },
  {
    "id": 7,
    "question": "Which of the following are called Key Industrial animals?",
    "options": [
      'Producers',
      'Tertiary consumers',
      'Primary consumers',
      'None of these'
    ],
    "answer_index": 2,
  },
  {
    "id": 8,
    "question": "Elections to panchayats in state are regulated by",
    "options": [
      'Gram panchayat',
      'Nagar Nigam',
      'Election Commission of India',
      'State Election Commission'
    ],
    "answer_index": 3,
  },
  {
    "id": 9,
    "question":
        "Which of the following Himalayan regions is called Shivalik's ?",
    "options": [
      'Upper Himalayas',
      'Lower Himalayas',
      'Outer Himalayas',
      'Inner Himalayas'
    ],
    "answer_index": 2,
  },
  {
    "id": 10,
    "question": "Right to emergency medical aid is a",
    "options": [
      'Legal Right',
      'Illegal Right',
      'Constitutional Right',
      'Fundamental Right'
    ],
    "answer_index": 3,
  },
  {
    "id": 11,
    "question": "Which of the given devices is used for counting blood cells?",
    "options": [
      'Hmelethometer',
      'Spyscometer',
      'Hemocytometer',
      'Hamosytometer'
    ],
    "answer_index": 2,
  },
  {
    "id": 12,
    "question":
        "Which of the given compounds is used to make fireproof clothing?",
    "options": [
      'Aluminum chloride',
      'Aluminum Sulphate',
      'Magnesium Chloride',
      'Magnesium Sulphate'
    ],
    "answer_index": 1,
  },
  {
    "id": 13,
    "question":
        "Which of the given cities is located on the bank of river Ganga?",
    "options": ['Patna', 'Gwalior', 'Bhopal', 'Mathura'],
    "answer_index": 0,
  },
  {
    "id": 14,
    "question": "Which of the given is a disease caused by protozoa?",
    "options": ['Cancer', 'Typhoid', 'Kala-azar', 'Chicken Pox'],
    "answer_index": 2,
  },
  {
    "id": 15,
    "question":
        " Digestion of food in human beings begins in which part of the alimentary canal?",
    "options": ['Liver', 'Kidney', 'Mouth', 'Large intestine'],
    "answer_index": 2,
  },
  {
    "id": 16,
    "question": "Which of the given vitamin is a water-soluble vitamin?",
    "options": ['Vitamin A', 'Vitamin B', 'Vitamin K', 'Vitamin D'],
    "answer_index": 1,
  },
  {
    "id": 17,
    "question": "Which of the given vitamin is a water-soluble vitamin?",
    "options": ['Vitamin A', 'Vitamin B', 'Vitamin K', 'Vitamin D'],
    "answer_index": 1,
  },
  {
    "id": 18,
    "question": " Which of the following is responsible for nitrogen fixation?",
    "options": ['Fungus', 'Bacteria', 'Virus', 'Insects'],
    "answer_index": 1,
  },
  {
    "id": 19,
    "question":
        " Which of the given vitamins is responsible for blood clotting?",
    "options": ['Vitamin A', 'Vitamin B', 'Vitamin K', 'Vitamin D'],
    "answer_index": 2,
  },
  {
    "id": 20,
    "question":
        " Which of the given Mughal emperors had introduced the Mansabdari system?",
    "options": ['Shahjahan', 'Babar', 'Akbar', 'Aurangzeb'],
    "answer_index": 1,
  },
];
