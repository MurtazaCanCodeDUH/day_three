import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Must be called
  await windowManager.ensureInitialized(); //Must be called
  //waitUntilReadyToShow ==> Optional method to use, requires modification of native runner - Read docs of the package.
  await windowManager.waitUntilReadyToShow().then((_) async {
    await windowManager.isClosable();
    await windowManager.isFullScreen(); //Hiding the titlebar
    await windowManager.setTitle(
        "Day 3"); //We don't have a titlebar, this title appears in Task Manager for example.
    await windowManager.show(); //Finally show app window.
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          //primarySwatch: Color(0xffff0000)
          ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background.png'),
                  fit: BoxFit.cover)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .2,
                      ),
                      Column(
                        children: [
                          const Text(
                            "Greetings, detective.",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "I never knew you were this smart to infiltrate my house",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w300),
                          ),
                          const Text(
                            "with that robot you programmed. Impressive!",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w300),
                          ),
                          const Text(
                            "Now, try to get out of here alive :)",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w300),
                          ),
                          const SizedBox(
                            height: 140,
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Task1()),
                              );
                            },
                            height: 50,
                            minWidth: MediaQuery.of(context).size.width * 0.1,
                            color: const Color(0xffffffff),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: const Text(
                              "Task 1",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff000000),
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox()
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class Task1 extends StatelessWidget {
  Task1({Key? key}) : super(key: key);
  TextEditingController code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              const Text(
                "Task 1",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 70,
              ),
              const Text(
                "Given a string columnTitle that represents the column title as appears in an Excel sheet, return its corresponding column number.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 30),
              TextButton(
                  onPressed: () => showDialog<String>(
                      barrierDismissible: true,
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          title: const Center(
                            child: Text(
                              "Examples",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          content: SingleChildScrollView(
                            child: SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    0.6,
                                width:
                                MediaQuery.of(context).size.width * 0.55,
                                child: SingleChildScrollView(
                                  child: Column(children: [
                                    SingleChildScrollView(
                                      child: Container(
                                        height:
                                        MediaQuery.of(context).size.height *
                                            0.8,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/task11.png',
                                                ),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                  ]),
                                )),
                          ),
                          actions: <Widget>[
                            Center(
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MaterialButton(
                                          height: 50,
                                          minWidth: 100,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          color: Colors.black,
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text(
                                            'Close',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ]))
                          ])),
                  child: const Text(
                    "Examples",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 90,
              ),
              const Text(
                "But the question is, 'Where is the string?' How about a riddle? So riddle me this:",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              const Text(
                "If you have me, you will want to share me. If you share me, you will no longer have me. What am I?",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              const Text(
                "Starts with S.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              MaterialButton(
                onPressed: () => showDialog<String>(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            title: const Center(
                              child: Text(
                                "Check Answer",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            content: SizedBox(
                                height: 130,
                                child: Column(children: [
                                  const Text(
                                      "Enter your answer for task 1 to go to task 2"),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(4, 20, 4, 8),
                                    child: TextFormField(
                                      textAlign: TextAlign.center,
                                      controller: code,
                                      textInputAction: TextInputAction.next,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      keyboardType: TextInputType.text,
                                      style: const TextStyle(
                                        color: Color(0xff361553),
                                        fontSize: 35,
                                        fontFamily: 'Anton',
                                        letterSpacing: 8.0,
                                      ),
                                      cursorColor: const Color(0xffaf52e0),
                                      decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 18, horizontal: 10.0),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Color(0xff361553)),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Color(0xffeeeeee)),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          focusedErrorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2, color: Colors.red),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          errorBorder:
                                              OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.red), borderRadius: BorderRadius.all(Radius.circular(10))),
                                          filled: true,
                                          fillColor: Color(0xfff8f8f8)),
                                      validator: (value) {
                                        value == null || value.isEmpty
                                            ? "Please enter code to continue"
                                            : null;
                                      },
                                    ),
                                  )
                                ])),
                            actions: <Widget>[
                              Center(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: MaterialButton(
                                        height: 50,
                                        minWidth: 100,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        color: Colors.black,
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: MaterialButton(
                                        height: 50,
                                        minWidth: 100,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        color: Colors.black,
                                        onPressed: () => {
                                          Navigator.pop(context, 'Cancel'),
                                          if (code.text == '228096070')
                                            {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Task2()),
                                              )
                                            }
                                        },
                                        child: const Text(
                                          'Check',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    )
                                  ]))
                            ])),
                height: 50,
                minWidth: MediaQuery.of(context).size.width * 0.1,
                color: const Color(0xffffffff),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Text(
                  "Check Answer",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff000000),
                      fontSize: 20),
                ),
              ),
            ],
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class Task2 extends StatelessWidget {
  Task2({Key? key}) : super(key: key);
  TextEditingController code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              const Text(
                "Task 2",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 70,
              ),
              const Text(
                "The appeal of a string is the number of distinct characters found in the string.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 5),
              const Text(
                "For example, the appeal of 'abbca' is 3 because it has 3 distinct characters: 'a', 'b', and 'c'.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 5),
              const Text(
                "Given a string s, return the total appeal of all of its substrings.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 5),
              const Text(
                "A substring is a contiguous sequence of characters within a string.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 30),
              TextButton(
                  onPressed: () => showDialog<String>(
                      barrierDismissible: true,
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              title: const Center(
                                child: Text(
                                  "Examples",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              content: SingleChildScrollView(
                                child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.6,
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: SingleChildScrollView(
                                      child: Column(children: [
                                        Container(
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  0.45,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                    'assets/task2ex1.png',
                                                  ),
                                                  fit: BoxFit.cover)),
                                        ),
                                        Container(
                                          height:
                                          MediaQuery.of(context).size.height *
                                              0.45,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                    'assets/task2ex2.png',
                                                  ),
                                                  fit: BoxFit.cover)),
                                        )
                                      ]),
                                    )),
                              ),
                              actions: <Widget>[
                                Center(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MaterialButton(
                                          height: 50,
                                          minWidth: 100,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          color: Colors.black,
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text(
                                            'Close',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ]))
                              ])),
                  child: const Text(
                    "Examples",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Your input string is: ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                  ),
                  SelectableText(
                    "'auto**co*deisr*evolu**tionise***drandomw**ordsdont*mean***anyt**hin*g'",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                    toolbarOptions: ToolbarOptions(copy: true, selectAll: true,),
                  ),
                ],
              ),
              const SizedBox(height: 5,),
              const Text(
                "Note: we will check the code!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              MaterialButton(
                onPressed: () => showDialog<String>(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            title: const Center(
                              child: Text(
                                "Check Answer",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            content: SizedBox(
                                height: 130,
                                child: Column(children: [
                                  const Text(
                                      "Enter your answer for task 2 to go to task 3"),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(4, 20, 4, 8),
                                    child: TextFormField(
                                      textAlign: TextAlign.center,
                                      controller: code,
                                      textInputAction: TextInputAction.next,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      keyboardType: TextInputType.text,
                                      style: const TextStyle(
                                        color: Color(0xff361553),
                                        fontSize: 35,
                                        fontFamily: 'Anton',
                                        letterSpacing: 8.0,
                                      ),
                                      cursorColor: const Color(0xffaf52e0),
                                      decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 18, horizontal: 10.0),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Color(0xff361553)),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Color(0xffeeeeee)),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          focusedErrorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 2, color: Colors.red),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          errorBorder:
                                              OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.red), borderRadius: BorderRadius.all(Radius.circular(10))),
                                          filled: true,
                                          fillColor: Color(0xfff8f8f8)),
                                      validator: (value) {
                                        value == null || value.isEmpty
                                            ? "Please enter code to continue"
                                            : null;
                                      },
                                    ),
                                  )
                                ])),
                            actions: <Widget>[
                              Center(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: MaterialButton(
                                        height: 50,
                                        minWidth: 100,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        color: Colors.black,
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: MaterialButton(
                                        height: 50,
                                        minWidth: 100,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        color: Colors.black,
                                        onPressed: () => {
                                          Navigator.pop(context, 'Cancel'),
                                          if (code.text == 'aucdeisevotiondrandoordsdonmanhig') {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Task3()),
                                            )
                                          }
                                        },
                                        child: const Text(
                                          'Check',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    )
                                  ]))
                            ])),
                height: 50,
                minWidth: MediaQuery.of(context).size.width * 0.1,
                color: const Color(0xffffffff),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Text(
                  "Check Answer",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff000000),
                      fontSize: 20),
                ),
              ),
            ],
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
class Task3 extends StatelessWidget {
  Task3({Key? key}) : super(key: key);
  TextEditingController code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              const Text(
                "Task 3",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 70,
              ),
              const Text(
                "A string is considered beautiful if it satisfies the following conditions:",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 5),
              const Text(
                "Each of the 5 English vowels ('a', 'e', 'i', 'o', 'u') must appear at least once in it.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 5),
              const Text(
                "The letters must be sorted in alphabetical order (i.e. all 'a's before 'e's, all 'e's before 'i's, etc.).",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 5),
              const Text(
                "For example, strings 'aeiou' and 'aaaaaaeiiiioou' are considered beautiful, but 'uaeio', 'aeoiu', and 'aaaeeeooo' are not beautiful.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 5),
              const Text(
                "Given a string word consisting of English vowels, return the length of the longest beautiful substring of word. If no such substring exists, return 0.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 5),
              const Text(
                "A substring is a contiguous sequence of characters in a string.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 30),
              TextButton(
                  onPressed: () => showDialog<String>(
                      barrierDismissible: true,
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          title: const Center(
                            child: Text(
                              "Examples",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          content: SingleChildScrollView(
                            child: SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    0.6,
                                width:
                                MediaQuery.of(context).size.width * 0.5,
                                child: SingleChildScrollView(
                                  child: Column(children: [
                                    Container(
                                      height:
                                      MediaQuery.of(context).size.height *
                                          0.6,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                'assets/task3.png',
                                              ),
                                              fit: BoxFit.cover)),
                                    ),

                                  ]),
                                )),
                          ),
                          actions: <Widget>[
                            Center(
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MaterialButton(
                                          height: 50,
                                          minWidth: 100,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          color: Colors.black,
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text(
                                            'Close',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ]))
                          ])),
                  child: const Text(
                    "Examples",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  )),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Your input string is: ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                  ),
                  SelectableText(
                    "'aaaaaaaaaaaaaaaaaaaeoooooooouuuuuuuuiieaioeeaeiouuuuuuuuuuuiieaooeiaaeeeeeeeeeeeeeeeiiouuuuuuuuooooaeaeiouaeoiuouiaeou'",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                    toolbarOptions: ToolbarOptions(copy: true, selectAll: true,),
                  ),
                ],
              ),
              const SizedBox(height: 5,),
              const Text(
                "Note: we will check the code!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              MaterialButton(
                onPressed: () => showDialog<String>(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20))),
                        title: const Center(
                          child: Text(
                            "Check Answer",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        content: SizedBox(
                            height: 130,
                            child: Column(children: [
                              const Text(
                                  "Enter your answer for task 3 to go to task 4"),
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(4, 20, 4, 8),
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  controller: code,
                                  textInputAction: TextInputAction.next,
                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.text,
                                  style: const TextStyle(
                                    color: Color(0xff361553),
                                    fontSize: 35,
                                    fontFamily: 'Anton',
                                    letterSpacing: 8.0,
                                  ),
                                  cursorColor: const Color(0xffaf52e0),
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 18, horizontal: 10.0),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xff361553)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xffeeeeee)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2, color: Colors.red),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      errorBorder:
                                      OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.red), borderRadius: BorderRadius.all(Radius.circular(10))),
                                      filled: true,
                                      fillColor: Color(0xfff8f8f8)),
                                  validator: (value) {
                                    value == null || value.isEmpty
                                        ? "Please enter code to continue"
                                        : null;
                                  },
                                ),
                              )
                            ])),
                        actions: <Widget>[
                          Center(
                              child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: MaterialButton(
                                        height: 50,
                                        minWidth: 100,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        color: Colors.black,
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: MaterialButton(
                                        height: 50,
                                        minWidth: 100,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        color: Colors.black,
                                        onPressed: () => {
                                          Navigator.pop(context, 'Cancel'),
                                          if (code.text == '28') {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Task4()),
                                            )
                                          }
                                        },
                                        child: const Text(
                                          'Check',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    )
                                  ]))
                        ])),
                height: 50,
                minWidth: MediaQuery.of(context).size.width * 0.1,
                color: const Color(0xffffffff),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Text(
                  "Check Answer",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff000000),
                      fontSize: 20),
                ),
              ),
            ],
          ),
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}class Task4 extends StatelessWidget {
  Task4({Key? key}) : super(key: key);
  TextEditingController code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              const Text(
                "Task 4",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 70,
              ),
              const Text(
                "You are given a 0-indexed 2D integer array flowers, where flowers[i] = [starti, endi]",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 5),
              const Text(
                "means the ith flower will be in full bloom from starti to endi (inclusive).",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 5),
              const Text(
                "You are also given a 0-indexed integer array persons of size n, where persons[i] is the time that the ith person will arrive to see the flowers.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 5),
              const Text(
                "Return an integer array answer of size n, where answer[i] is the number of flowers that are in full bloom when the ith person arrives.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 30),
              TextButton(
                  onPressed: () => showDialog<String>(
                      barrierDismissible: true,
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          title: const Center(
                            child: Text(
                              "Examples",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          content: SingleChildScrollView(
                            child: SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    0.7,
                                width:
                                MediaQuery.of(context).size.width * 0.5,
                                child: SingleChildScrollView(
                                  child: Column(children: [
                                    SingleChildScrollView(
                                      child: Container(
                                        height: 500,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/task4.png',
                                                ),
                                                fit: BoxFit.contain)),
                                      ),
                                    ),

                                  ]),
                                )),
                          ),
                          actions: <Widget>[
                            Center(
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: MaterialButton(
                                          height  : 50,
                                          minWidth: 100,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          color: Colors.black,
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text(
                                            'Close',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ]))
                          ])),
                  child: const Text(
                    "Examples",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  )),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Your inputs are: ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                  ),
                  SelectableText(
                    "flowers = [[1,6],[3,7],[9,12],[4,13]], persons = [2,3,7,11]",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                    toolbarOptions: ToolbarOptions(copy: true, selectAll: true,),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              MaterialButton(
                onPressed: () => showDialog<String>(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20))),
                        title: const Center(
                          child: Text(
                            "Check Answer",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        content: SizedBox(
                            height: 130,
                            child: Column(children: [
                              const Text(
                                  "Enter your answer for task 4"),
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(4, 20, 4, 8),
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  controller: code,
                                  textInputAction: TextInputAction.next,
                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  keyboardType: TextInputType.text,
                                  style: const TextStyle(
                                    color: Color(0xff361553),
                                    fontSize: 35,
                                    fontFamily: 'Anton',
                                    letterSpacing: 8.0,
                                  ),
                                  cursorColor: const Color(0xffaf52e0),
                                  decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 18, horizontal: 10.0),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xff361553)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2,
                                              color: Color(0xffeeeeee)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 2, color: Colors.red),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      errorBorder:
                                      OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.red), borderRadius: BorderRadius.all(Radius.circular(10))),
                                      filled: true,
                                      fillColor: Color(0xfff8f8f8)),
                                  validator: (value) {
                                    value == null || value.isEmpty
                                        ? "Please enter code to continue"
                                        : null;
                                  },
                                ),
                              )
                            ])),
                        actions: <Widget>[
                          Center(
                              child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: MaterialButton(
                                        height: 50,
                                        minWidth: 100,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        color: Colors.black,
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: MaterialButton(
                                        height: 50,
                                        minWidth: 100,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        color: Colors.black,
                                        onPressed: () => {
                                          Navigator.pop(context, 'Cancel'),
                                          if (code.text == '[1, 2, 2, 2]') {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Task5()),
                                            )
                                          }
                                        },
                                        child: const Text(
                                          'Check',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    )
                                  ]))
                        ])),
                height: 50,
                minWidth: MediaQuery.of(context).size.width * 0.1,
                color: const Color(0xffffffff),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Text(
                  "Check Answer",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff000000),
                      fontSize: 20),
                ),
              ),
            ],
          ),
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
class Task5 extends StatelessWidget {
  Task5({Key? key}) : super(key: key);
  TextEditingController code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background.png'),
                  fit: BoxFit.cover)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .2,
                      ),
                      Column(
                        children: const [
                          Text(
                            "You win.",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 200,
                          ),

                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox()
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}