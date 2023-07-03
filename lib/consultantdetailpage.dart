import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

//import 'consultant_detail_page_model.dart';

class ConsultantDetailPageWidget extends StatefulWidget {
  const ConsultantDetailPageWidget({Key? key}) : super(key: key);

  @override
  _ConsultantDetailPageWidgetState createState() =>
      _ConsultantDetailPageWidgetState();
}

class _ConsultantDetailPageWidgetState
    extends State<ConsultantDetailPageWidget> {
  //late ConsultantDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    //_model = createModel(context, () => ConsultantDetailPageModel());
  }

  @override
  void dispose() {
    //_model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
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
                  padding: EdgeInsets.all(10),
                  child: Container(
                    width: 435,
                    height: 69,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF8686),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Name: ',
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            'Ben',
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 25,
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
                      padding: EdgeInsets.only(left: 10),
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
                            'Active',
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 25,
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
                    height: 58,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF8686),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Phone No:',
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            ' 1234567890',
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 25,
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
                    height: 58,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF8686),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Email:',
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            ' test@example.com',
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 25,
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
                    height: 58,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF8686),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Date of Birth:',
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            ' 1990-01-01',
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 25,
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
                    height: 58,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF8686),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Address:',
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            ' 123 Main St',
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 25,
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
                    height: 58,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF8686),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'City:',
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            ' New York',
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 25,
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
                    height: 58,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF8686),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Country:',
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            ' USA',
                            style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Perform some action on button click
                  },
                  child: Text('Edit Profile'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
