import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insurance/admin/adminhome.dart';
import 'package:insurance/database/consultantDatabase.dart';

class ConsultantDetailPageWidget extends StatefulWidget {
  final String id;
  const ConsultantDetailPageWidget({super.key, required this.id});

  @override
  _ConsultantDetailPageWidgetState createState() =>
      _ConsultantDetailPageWidgetState();
}

class _ConsultantDetailPageWidgetState
    extends State<ConsultantDetailPageWidget> {
  ConsultantDatabase database = ConsultantDatabase();

  Map<String, dynamic> detail = {};

  @override
  void initState() {
    super.initState();
    assignMap();
  }

  Future<void> assignMap() async {
    final map = await database.getConsultantDetail(widget.id);
    setState(() {
      detail = map;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 445,
                height: 239,
                decoration: BoxDecoration(
                  color: Color(0xFFFF0000),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Consultant Detail',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Container(
                  width: 435,
                  height: 69,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF8686),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 18, 0, 0),
                    child: Text(
                      'Agent ID: ${detail['agent id']}',
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Container(
                  width: 435,
                  height: 69,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF8686),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 18, 0, 0),
                    child: Text(
                      'National Code: ${detail['national code']}',
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Container(
                  width: 435,
                  height: 69,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF8686),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 18, 0, 0),
                    child: Text(
                      'Agency: ${detail['agency']}',
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Container(
                  width: 435,
                  height: 69,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF8686),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 18, 0, 0),
                    child: Text(
                      'Name: ${detail['name']}',
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Container(
                  width: 435,
                  height: 83,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF8686),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Status: ',
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          detail['status'],
                          style: GoogleFonts.openSans(
                            color: Colors.yellow,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Container(
                  width: 435,
                  height: 83,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF8686),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 18, 0, 0),
                    child: Text(
                      'Phone No: ${detail['phone']}',
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Container(
                  width: 435,
                  height: 83,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF8686),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 18, 0, 0),
                    child: Text(
                      'Email: ${detail['email']}',
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Container(
                  width: 435,
                  height: 83,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF8686),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 18, 0, 0),
                    child: Text(
                      'Address: ${detail['address']}',
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Block'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('View Log'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminHomePageWidget()));
        },
        child: const Icon(Icons.arrow_circle_left),
      ),
    );
  }
}
