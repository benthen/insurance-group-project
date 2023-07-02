// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// import 'review_policy_page_model.dart';
// export 'review_policy_page_model.dart';

class ReviewPolicyPageWidget extends StatefulWidget {
  const ReviewPolicyPageWidget({Key? key}) : super(key: key);

  @override
  _ReviewPolicyPageWidgetState createState() => _ReviewPolicyPageWidgetState();
}

class _ReviewPolicyPageWidgetState extends State<ReviewPolicyPageWidget> {
  //late ReviewPolicyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    //_model = createModel(context, () => ReviewPolicyPageModel());
  }

  @override
  void dispose() {
    //_model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        //backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 484,
                height: 150,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF0000),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: const Align(
                  alignment: AlignmentDirectional(0, -1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: Text(
                      'Review Policy',
                      // style: FlutterFlowTheme.of(context).bodyMedium.override(
                      //       fontFamily: 'Readex Pro',
                      //       fontSize: 50,
                      //       fontWeight: FontWeight.w500,
                      //     ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Container(
                  width: 466,
                  height: 244,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF8888),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Review File: ',
                              // style: FlutterFlowTheme.of(context)
                              //     .bodyMedium
                              //     .override(
                              //       fontFamily: 'Readex Pro',
                              //       fontSize: 25,
                              //     ),
                            ),
                            Text(
                              'review.pdf',
                              // style: FlutterFlowTheme.of(context)
                              //     .bodyMedium
                              //     .override(
                              //       fontFamily: 'Readex Pro',
                              //       color: Color(0xFF0094FF),
                              //       fontSize: 25,
                              //     ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: Text(
                            'Booster Recommendation:',
                            // style: FlutterFlowTheme.of(context)
                            //     .bodyMedium
                            //     .override(
                            //       fontFamily: 'Readex Pro',
                            //       fontSize: 25,
                            //       fontWeight: FontWeight.w500,
                            //     ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                          child: Text(
                            'A Plus Health Booster',
                            // style: FlutterFlowTheme.of(context)
                            //     .bodyMedium
                            //     .override(
                            //       fontFamily: 'Readex Pro',
                            //       fontSize: 18,
                            //     ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: Text(
                            'Benefit:',
                            // style: FlutterFlowTheme.of(context)
                            //     .bodyMedium
                            //     .override(
                            //       fontFamily: 'Readex Pro',
                            //       fontSize: 25,
                            //       fontWeight: FontWeight.w500,
                            //     ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                          child: Text(
                            'Gain more benefit',
                            // style: FlutterFlowTheme.of(context)
                            //     .bodyMedium
                            //     .override(
                            //       fontFamily: 'Readex Pro',
                            //       fontSize: 18,
                            //     ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Text(
                    'Consultant contact: 012-3456789',
                    // style: FlutterFlowTheme.of(context).bodyMedium.override(
                    //       fontFamily: 'Readex Pro',
                    //       fontSize: 35,
                    //     ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Container(
                  width: 505,
                  height: 166,
                  decoration: BoxDecoration(
                    color: Color(0xFF80FFA7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // AutoSizeText(
                      //   'Do you want to buy booster package?',
                      //   textAlign: TextAlign.center,
                      //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                      //         fontFamily: 'Readex Pro',
                      //         fontSize: 30,
                      //       ),
                      // ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // FFButtonWidget(
                            //   onPressed: () {
                            //     print('Button pressed ...');
                            //   },
                            //   text: 'Yes',
                            //   options: FFButtonOptions(
                            //     height: 40,
                            //     padding: const EdgeInsetsDirectional.fromSTEB(
                            //         24, 0, 24, 0),
                            //     iconPadding:
                            //         EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            //     //color: FlutterFlowTheme.of(context).primary,
                            //     //textStyle: FlutterFlowTheme.of(context)
                            //         .titleSmall
                            //         .override(
                            //           fontFamily: 'Readex Pro',
                            //           color: Colors.white,
                            //         ),
                            //     elevation: 3,
                            //     borderSide: const BorderSide(
                            //       color: Colors.transparent,
                            //       width: 1,
                            //     ),
                            //     borderRadius: BorderRadius.circular(8),
                            //   ),
                            // ),
                            // FFButtonWidget(
                            //   onPressed: () {
                            //     print('Button pressed ...');
                            //   },
                            //   text: 'No',
                            //   options: FFButtonOptions(
                            //     height: 40,
                            //     padding: const EdgeInsetsDirectional.fromSTEB(
                            //         24, 0, 24, 0),
                            //     iconPadding:
                            //         EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            //     //color: FlutterFlowTheme.of(context).primary,
                            //     // textStyle: FlutterFlowTheme.of(context)
                            //     //     .titleSmall
                            //     //     .override(
                            //     //       fontFamily: 'Readex Pro',
                            //     //       color: Colors.white,
                            //     //     ),
                            //     elevation: 3,
                            //     borderSide: const BorderSide(
                            //       color: Colors.transparent,
                            //       width: 1,
                            //     ),
                            //     borderRadius: BorderRadius.circular(8),
                            //   ),
                            // ),
                            // FFButtonWidget(
                            //   onPressed: () {
                            //     print('Button pressed ...');
                            //   },
                            //   text: 'Not now',
                            //   options: FFButtonOptions(
                            //     height: 40,
                            //     padding: EdgeInsetsDirectional.fromSTEB(
                            //         24, 0, 24, 0),
                            //     iconPadding:
                            //         EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            //     //color: FlutterFlowTheme.of(context).primary,
                            //     // textStyle: FlutterFlowTheme.of(context)
                            //     //     .titleSmall
                            //     //     .override(
                            //     //       fontFamily: 'Readex Pro',
                            //     //       color: Colors.white,
                            //     //     ),
                            //     elevation: 3,
                            //     borderSide: BorderSide(
                            //       color: Colors.transparent,
                            //       width: 1,
                            //     ),
                            //     borderRadius: BorderRadius.circular(8),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
