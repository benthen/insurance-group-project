import 'package:checkbox_formfield/checkbox_list_tile_formfield.dart';
import 'package:flutter/material.dart';
import 'package:insurance/database/consultantDatabase.dart';
import 'package:insurance/login/loginpage.dart';


class AgentRegister extends StatefulWidget {
  const AgentRegister({
    Key? key,
  }) : super(key: key);

  @override
  _AgentRegisterState createState() => _AgentRegisterState();
}

class _AgentRegisterState extends State<AgentRegister> {
  final _formKey = GlobalKey<FormState>();
  ConsultantDatabase database = ConsultantDatabase();

  bool isChecked = false;
  String id = '';
  String agency = '';
  String code = '';
  String pass = '';
  String confirm = '';
  String filename = '';
  String address = '';
  String phone = '';
  String email = '';

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
                        width: 416,
                        height: 550,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                            'asset/insurance.jpg',
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
                                    labelText: 'Your Agent ID',
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
                                      return "Please enter your agent ID!";
                                    } else if (value.length < 6) {
                                      return "Agent ID must contain at least 6 characters!";
                                    } else
                                      return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      id = value;
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
                                    labelText: 'Your Agency',
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
                                      return "Please enter your agency!";
                                    } else
                                      return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      agency = value;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8, 10, 8, 10),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Your National Code',
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
                                      return "Please enter your national code!";
                                    } else
                                      return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      code = value;
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
                                padding: EdgeInsetsDirectional.fromSTEB(
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
                                      return "Your password must contain at least 6 characters!";
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
                              Row(
                                children: [
                                  const SizedBox(width: 10),
                                  ElevatedButton(
                                      onPressed: () async {
                                        String name =
                                            await database.getCertBasename();
                                        setState(() {
                                          filename = '$id-$name';
                                        });
                                      },
                                      child: Text("Upload Cert")),
                                  const SizedBox(width: 20),
                                  Text(
                                    filename,
                                    style: TextStyle(color: Colors.blue),
                                  )
                                ],
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
                                    isChecked = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        )),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              padding:
                                  const EdgeInsets.fromLTRB(150, 10, 150, 10)),
                          onPressed: () async {
                            if (isChecked != false &&
                                code.isNotEmpty &&
                                id.isNotEmpty &&
                                pass.isNotEmpty &&
                                agency.isNotEmpty &&
                                filename != '') {
                              if (!(await database.checkConsultant(id))) {
                                database.consultantRegister(id, code, agency,
                                    pass, filename, address, phone, email);
                                database.uploadCert(filename);
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    content: const Text(
                                        'Your registration is submitted\nPlease wait for the approval'),
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
                                        'The agent ID has been registered!'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            } else {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  content: const Text(
                                      'Please upload your agent certification!'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          child: const Text("Register")),
                    ),
                  ],
                ),
              ),
            )));
  }
}
