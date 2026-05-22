import 'dart:async';
import 'package:flutter/material.dart';

// ==========================================
// CLASSES DEFINITION FROM LAB 2 LOGIC
// ==========================================

class Student {
  String name;
  int age;
  double gpa;
  Student(this.name, this.age, this.gpa);

  @override
  String toString() => "Student(Name: $name, Age: $age, GPA: $gpa)";
}

class Product {
  String id;
  String name;
  double price;
  int quantity;
  Product({required this.id, required this.name, required this.price, required this.quantity});
  double total() => price * quantity;
}

class Person {
  String name;
  Person(this.name);
  String info() => "Person: $name";
}

class Employee extends Person {
  String role;
  Employee(String name, this.role) : super(name);

  @override
  String info() => "Employee: $name, Role: $role";
}

class Question {
  String questionText;
  List<String> options;
  int correctAnswerIndex;
  Question({required this.questionText, required this.options, required this.correctAnswerIndex});
}

// ==========================================
// FLUTTER APPLICATION ENTRY POINT
// ==========================================

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Lab2Visualizer(),
  ));
}

class Lab2Visualizer extends StatefulWidget {
  const Lab2Visualizer({super.key});

  @override
  State<Lab2Visualizer> createState() => _Lab2VisualizerState();
}

class _Lab2VisualizerState extends State<Lab2Visualizer> {
  String _currentExerciseTitle = "Select an Exercise";
  String _outputResult = "Click any exercise button above to see the output.";
  final List<String> _streamOutputs = [];
  StreamSubscription? _subscription;

  // Clear previous outputs and stop existing streams
  void _resetOutput(String title) {
    _subscription?.cancel();
    setState(() {
      _currentExerciseTitle = title;
      _outputResult = "";
      _streamOutputs.clear();
    });
  }

  // Helper to standardise basic string printing
  void _printToScreen(String result) {
    setState(() {
      _outputResult = result;
    });
  }

  // --- LOGIC FOR EACH EXERCISE ---

  void runExercise1() {
    _resetOutput("Exercise 1: Extended Hello Dart");
    String studentName = "Thao Nguyen";
    int age = 21;
    double gpa = 3.9;
    _printToScreen("Student: $studentName\nAge: $age\nGPA: $gpa");
  }

  void runExercise2() {
    _resetOutput("Exercise 2: Simple Calculator");
    int a = 20;
    int b = 6;
    String res = "$a + $b = ${a + b}\n"
        "$a - $b = ${a - b}\n"
        "$a * $b = ${a * b}\n"
        "$a / $b = ${a / b}\n"
        "$a % $b = ${a % b}";
    _printToScreen(res);
  }

  void runExercise3() {
    _resetOutput("Exercise 3: Variables and Constants");
    var varValue = "Dynamic type inference";
    dynamic dynamicValue = 100;
    dynamicValue = "Changed to String";
    final finalValue = DateTime.now();
    const constValue = 3.14159;
    
    String res = "var (compile-time inference): $varValue\n"
        "dynamic (runtime flexible): $dynamicValue\n"
        "final (runtime constant): $finalValue\n"
        "const (compile-time constant): $constValue";
    _printToScreen(res);
  }

  void runExercise4() {
    _resetOutput("Exercise 4: Student Grade Classification");
    double score = 85.5;
    String grade = "";
    if (score < 50) { grade = "Fail"; }
    else if (score <= 65) { grade = "Average"; }
    else if (score <= 80) { grade = "Good"; }
    else if (score <= 100) { grade = "Excellent"; }
    _printToScreen("Score: $score\nClassification: $grade");
  }

  void runExercise5() {
    _resetOutput("Exercise 5: Task Schedule by Day");
    String dayInput = "Mon";
    String activity = "";
    switch (dayInput) {
      case "Mon":
        activity = "Monday Activity: Attend Lecture and Code Dart basics.";
        break;
      case "Tue":
        activity = "Tuesday Activity: Practice Flutter UI layouts.";
        break;
      default:
        activity = "Other Days: Review coursework.";
    }
    _printToScreen("Input: $dayInput\n$activity");
  }

  void runExercise6() {
    _resetOutput("Exercise 6: Salary Calculation Function");
    double calcSalary(double hours, double rate) => hours * rate;
    double totalSalary = calcSalary(40, 150000);
    _printToScreen("Calculated Salary (40 hours @ 150k): ${totalSalary.toStringAsFixed(0)} VND");
  }

  void runExercise7() {
    _resetOutput("Exercise 7: Function with Named Parameters");
    String buffer = "";
    void register({required String name, int age = 18}) {
      buffer += "Registration Success -> Name: $name, Age: $age\n";
    }
    register(name: "Minh Huong");
    register(name: "Thanh Binh", age: 22);
    _printToScreen(buffer);
  }

  void runExercise8() {
    _resetOutput("Exercise 8: Number List Processing");
    List<int> numbers = [12, 45, 7, 23, 56, 89, 90, 34, 11, 8];
    List<int> evens = [];
    List<int> odds = [];
    for (var num in numbers) {
      if (num % 2 == 0) { evens.add(num); }
      else { odds.add(num); }
    }
    _printToScreen("Original List: $numbers\n\nEvens: $evens\nOdds: $odds");
  }

  void runExercise9() {
    _resetOutput("Exercise 9: Set Uniqueness Test");
    Set<String> courses = {"PRM393", "OOM201", "DBI202"};
    courses.add("PRM393"); // Duplicate
    courses.add("SWE301");
    _printToScreen("Tried adding duplicate 'PRM393'\n\nFinal Unique Set:\n$courses");
  }

  void runExercise10() {
    _resetOutput("Exercise 10: Student Score Map");
    Map<String, int> studentScores = {"Minh Huong": 88, "Thao Nguyen": 97, "Thanh Binh": 92};
    String highestStudent = "";
    int highestScore = -1;
    studentScores.forEach((name, score) {
      if (score > highestScore) {
        highestScore = score;
        highestStudent = name;
      }
    });
    _printToScreen("Map Data: $studentScores\n\nHighest Score: Student '$highestStudent' achieved $highestScore points");
  }

  void runExercise11() {
    _resetOutput("Exercise 11: Student Class");
    List<Student> studentsList = [
      Student("Huong", 20, 3.5),
      Student("Nguyen", 21, 3.9),
      Student("Binh", 19, 3.2),
      Student("Chuy", 22, 3.7),
      Student("Member A", 20, 3.4),
    ];
    String res = studentsList.join("\n");
    _printToScreen("Generated 5 Student Objects:\n\n$res");
  }

  void runExercise12() {
    _resetOutput("Exercise 12: Product Class");
    Product prod = Product(id: "P101", name: "Matcha Latte", price: 45000, quantity: 3);
    _printToScreen("Product: ${prod.name}\nPrice: ${prod.price} VND\nQuantity: ${prod.quantity}\n\nTotal Cost: ${prod.total().toStringAsFixed(0)} VND");
  }

  void runExercise13() {
    _resetOutput("Exercise 13: Inheritance Practice");
    Employee emp = Employee("Thanh Binh", "Software Engineer");
    _printToScreen("Polymorphic Method Call:\n\n${emp.info()}");
  }

  void runExercise14() async {
    _resetOutput("Exercise 14: Future Data Loading");
    _printToScreen("Loading data from asynchronous future (2s delay)...");
    
    await Future.delayed(const Duration(seconds: 2));
    List<int> fetchedData = [10, 20, 30, 40, 50];
    
    _printToScreen("Data successfully loaded!\nResult: $fetchedData");
  }

  void runExercise15() {
    _resetOutput("Exercise 15: Stream Counter");
    _printToScreen("Listening to asynchronous stream (emits every 1s)...");

    Stream<int> streamCounter() async* {
      for (int i = 1; i <= 5; i++) {
        await Future.delayed(const Duration(seconds: 1));
        yield i;
      }
    }

    _subscription = streamCounter().listen((val) {
      setState(() {
        _streamOutputs.add("Emitted: $val");
        _outputResult = _streamOutputs.join("\n");
      });
    }, onDone: () {
      setState(() {
        _streamOutputs.add("Stream closed smoothly.");
        _outputResult = _streamOutputs.join("\n");
      });
    });
  }

  void runExercise16() async {
    _resetOutput("Exercise 16: Mini Project - Cart System");
    setState(() {
      _streamOutputs.add("Initializing Cart...");
      _outputResult = _streamOutputs.join("\n");
    });

    List<Product> items = [
      Product(id: "M01", name: "Matcha Latte", price: 45000, quantity: 2),
      Product(id: "B02", name: "Bun Dau Lon", price: 65000, quantity: 1),
      Product(id: "T03", name: "Tra Tao Xanh", price: 30000, quantity: 2),
    ];

    setState(() {
      _streamOutputs.add("Added 3 Items. Removing ID 'T03' (Tra Tao Xanh)...");
      items.removeWhere((item) => item.id == "T03");
      _outputResult = _streamOutputs.join("\n");
    });

    setState(() {
      _streamOutputs.add("\nProcessing checkout gateway...");
      _outputResult = _streamOutputs.join("\n");
    });

    await Future.delayed(const Duration(seconds: 2));
    double finalTotal = items.fold(0, (sum, item) => sum + item.total());

    setState(() {
      _streamOutputs.add("Checkout successful!");
      _streamOutputs.add("Final Cart Total: ${finalTotal.toStringAsFixed(0)} VND");
      _outputResult = _streamOutputs.join("\n");
    });
  }

  void runExercise17() {
    _resetOutput("Exercise 17: Mini Project - Quiz System");
    _printToScreen("Starting Quiz Stream Context (streaming questions)...");

    List<Question> quizList = [
      Question(
          questionText: "What is the entry point of Flutter?",
          options: ["A. main.dart", "B. index.html", "C. app.js"],
          correctAnswerIndex: 0),
      Question(
          questionText: "Which collection contains only unique values?",
          options: ["A. List", "B. Map", "C. Set"],
          correctAnswerIndex: 2),
    ];

    Stream<Question> getQuizStream() async* {
      for (var q in quizList) {
        await Future.delayed(const Duration(seconds: 1));
        yield q;
      }
    }

    _subscription = getQuizStream().listen((q) {
      setState(() {
        _streamOutputs.add("\nQuestion: ${q.questionText}");
        _streamOutputs.add("Options: ${q.options.join(" | ")}");
        _streamOutputs.add("Answer Key: ${q.options[q.correctAnswerIndex]}");
        _outputResult = _streamOutputs.join("\n");
      });
    }, onDone: () {
      setState(() {
        _streamOutputs.add("\nQuiz stream finished successfully.");
        _outputResult = _streamOutputs.join("\n");
      });
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Array of function pointers corresponding to each exercise button
    final List<VoidCallback> exercises = [
      runExercise1, runExercise2, runExercise3, runExercise4, runExercise5,
      runExercise6, runExercise7, runExercise8, runExercise9, runExercise10,
      runExercise11, runExercise12, runExercise13, runExercise14, runExercise15,
      runExercise16, runExercise17
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dart Lab 2 Interactive Suite"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Grid showing shortcut navigation buttons for all 17 Exercises
            const Text(
              "Select an exercise to execute:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 180,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 2.2,
                ),
                itemCount: 17,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: exercises[index],
                    child: Text("Ex ${index + 1}", style: const TextStyle(fontSize: 12, color: Colors.white)),
                  );
                },
              ),
            ),
            const Divider(height: 30, thickness: 2),
            // Panel rendering active outputs dynamically 
            Text(
              _currentExerciseTitle,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    _outputResult,
                    style: const TextStyle(fontFamily: 'Courier', color: Colors.greenAccent, fontSize: 14, height: 1.4),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}