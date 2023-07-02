import 'package:flutter/material.dart';
import 'package:insurance/RedeemedItem.dart';

void main() {
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
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RedeemedItemPageWidget(),
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

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: [
      Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Image.asset('asset/insurance.jpg'),
            const SizedBox(height: 20),
            const Text(
              "Welcome back!!",
              style: TextStyle(fontSize: 50, color: Colors.white),
            )
          ],
        ),
      ),
      const SizedBox(height: 20),
      Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3, color: Colors.greenAccent), //<-- SEE HERE
                  ),
                  icon: Icon(Icons.person),
                  hintText: 'Enter your ID',
                  labelText: 'ID',
                ),
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3, color: Colors.greenAccent), //<-- SEE HERE
                  ),
                  icon: Icon(Icons.key),
                  hintText: 'Enter your password',
                  labelText: 'Password',
                ),
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                GestureDetector(
                  child: const Text(
                    "Forgot Password",
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                  onTap: () {
                    print("Hello Ben");
                  },
                )
              ]),
              Row(children: [
                Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    }),
                const Text("I agree with the Terms and Conditions")
              ]),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.red, fixedSize: const Size(300, 50)),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {},
              ),
            ],
          )),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Don't have account?"),
          GestureDetector(
            child: const Text(
              "Register here",
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      )
    ]))));
  }
}