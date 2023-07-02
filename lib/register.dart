import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 100),
            Container(
                height: 250,
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: GestureDetector(
                      child: Row(
                        children: [
                          Image.asset("asset/insurance.jpg",
                              height: 300, width: 300),
                          const Text("Customer Registration")
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Register()));
                      },
                    ))),
            const SizedBox(height: 30),
            Container(
                height: 250,
                decoration: const BoxDecoration(
                  color: Colors.red,
                ),
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: GestureDetector(
                      child: Row(
                        children: [
                          Image.asset("asset/insurance.jpg",
                              height: 300, width: 300),
                          const Text("Consultant Registration")
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Register()));
                      },
                    ))),
          ],
        ),
      ),
    ));
  }
}
