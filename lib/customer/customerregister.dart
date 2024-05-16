import 'package:checkbox_formfield/checkbox_list_tile_formfield.dart';
import 'package:flutter/material.dart';
import 'package:insurance/database/customerDatabase.dart';
import 'package:insurance/login/loginpage.dart';

class CustomerRegisterPageWidget extends StatefulWidget {
  const CustomerRegisterPageWidget({Key? key}) : super(key: key);

  @override
  _CustomerRegisterPageWidgetState createState() =>
      _CustomerRegisterPageWidgetState();
}

class _CustomerRegisterPageWidgetState
    extends State<CustomerRegisterPageWidget> {
  final _formKey = GlobalKey<FormState>();
  CustomerDatabase database = CustomerDatabase();

  bool ischecked = false;
  String myKad = '';
  String name = '';
  String email = '';
  String phone = '';
  String pass = '';
  String confirm = '';
  String address = '';

  @override
  void initState() {
    super.initState();
    myKad = '';
    phone = '';
    pass = '';
    confirm = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 20),
                                child: Container(
                                  width: 430,
                                  height: 350,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFF0000),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.asset(
                                            'asset/insurancee.jpeg',
                                            width: 250,
                                            height: 200,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const Align(
                                          alignment: AlignmentDirectional(0, 1),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 30, 0, 0),
                                            child: Text(
                                              '“Smart Insurance Solutions \n   for Life\'s Uncertainties”',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8, 5, 8, 10),
                                child: TextFormField(
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Your MyKad',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xFF006CFF),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.add_card,
                                      size: 30,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter your myKad!";
                                    } else if (value.length != 12 &&
                                        num.tryParse(value) != null) {
                                      return "Please enter a valid format of myKad";
                                    } else
                                      return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      myKad = value;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8, 5, 8, 10),
                                child: TextFormField(
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Your Name',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xFF006CFF),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      size: 30,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter your name!";
                                    } else
                                      return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      name = value;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8, 5, 8, 10),
                                child: TextFormField(
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Your Email',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xFF006CFF),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.mail,
                                      size: 30,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter your email!";
                                    } else if (!value.contains('@')) {
                                      return "Your email must have '@'!";
                                    } else
                                      return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      email = value;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8, 10, 8, 1),
                                child: TextFormField(
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Your Phone Number',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xFF006CFF),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.phone,
                                      size: 25,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter your phone number!";
                                    } else if (num.tryParse(value) != null &&
                                        (value.length != 11 &&
                                            value.length != 10)) {
                                      return "Please enter a valid phone number format!";
                                    } else
                                      return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      phone = value;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8, 10, 8, 1),
                                child: TextFormField(
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Your Address',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xFF006CFF),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.location_on_outlined,
                                      size: 25,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter your address!";
                                    } else
                                      return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      address = value;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8, 10, 8, 10),
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: 'Your Password',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xFF006CFF),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.vpn_key,
                                      size: 30,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter your password!";
                                    } else if (value.length < 6) {
                                      return "The password must have at least 6 characters!";
                                    } else
                                      return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      pass = value;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8, 10, 8, 10),
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: 'Confirm Your Password',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xFF006CFF),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    prefixIcon: const Icon(
                                      Icons.vpn_key,
                                      size: 30,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please confirm your password!";
                                    } else if (value != pass) {
                                      return "Password does not match";
                                    } else
                                      return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      confirm = value;
                                    });
                                  },
                                ),
                              ),
                              CheckboxListTileFormField(
                                title: const Text(
                                    'I agree with the Terms and Conditions'),
                                validator: (value) {
                                  if (value!) {
                                    return null;
                                  } else {
                                    return "Please tick the TnC";
                                  }
                                },
                                onChanged: (value) {
                                  setState(() {
                                    ischecked = value;
                                  });
                                },
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 30, 0, 0),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        padding: const EdgeInsets.fromLTRB(
                                            150, 10, 150, 10)),
                                    onPressed: () async {
                                      print(_formKey.currentState!.validate());
                                      if (_formKey.currentState!.validate() &&
                                          myKad.isNotEmpty &&
                                          phone.isNotEmpty &&
                                          pass.isNotEmpty &&
                                          email.isNotEmpty &&
                                          name.isNotEmpty &&
                                          ischecked != false) {
                                        if (!(await database
                                            .checkCustomer(myKad))) {
                                          database.customerRegister(
                                              myKad,
                                              phone,
                                              pass,
                                              name,
                                              email,
                                              address);
                                          showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              content: const Text(
                                                  'Your account has registered successfully!'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () => Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              LoginPageWidget())),
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            ),
                                          );
                                        } else {
                                          showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              content: const Text(
                                                  'The MyKad has been registered!'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'OK'),
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                      }
                                    },
                                    child: const Text("Register")),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            )));
  }
}
