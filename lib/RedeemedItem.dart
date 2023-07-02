// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// import 'redeemed_item_page_model.dart';
// export 'redeemed_item_page_model.dart';

class RedeemedItemPageWidget extends StatefulWidget {
  const RedeemedItemPageWidget({Key? key}) : super(key: key);

  @override
  _RedeemedItemPageWidgetState createState() => _RedeemedItemPageWidgetState();
}

class _RedeemedItemPageWidgetState extends State<RedeemedItemPageWidget> {
  //late RedeemedItemPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    //_model = createModel(context, () => RedeemedItemPageModel());
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
       // backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                      child: Text(
                        'Redeemed Item',
                        // style: FlutterFlowTheme.of(context).bodyMedium.override(
                        //       fontFamily: 'Readex Pro',
                        //       fontSize: 45,
                        //       fontWeight: FontWeight.w500,
                        //     ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Container(
                    width: 513,
                    height: 198,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF7070),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              'https://picsum.photos/seed/563/600',
                              width: 125,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Item: Earphone',
                                // style: FlutterFlowTheme.of(context)
                                //     .bodyMedium
                                //     .override(
                                //       fontFamily: 'Readex Pro',
                                //       fontSize: 20,
                                //       fontWeight: FontWeight.w500,
                                //     ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Status: ',
                                    // style: FlutterFlowTheme.of(context)
                                    //     .bodyMedium
                                    //     .override(
                                    //       fontFamily: 'Readex Pro',
                                    //       fontSize: 16,
                                    //     ),
                                  ),
                                  Text(
                                    'Delivering',
                                    // style: FlutterFlowTheme.of(context)
                                    //     .bodyMedium
                                    //     .override(
                                    //       fontFamily: 'Readex Pro',
                                    //       color: Color(0xFFFFE962),
                                    //       fontSize: 16,
                                    //     ),
                                  ),
                                ],
                              ),
                              Text(
                                'Date: 23/6/2023',
                                // style: FlutterFlowTheme.of(context)
                                //     .bodyMedium
                                //     .override(
                                //       fontFamily: 'Readex Pro',
                                //       fontSize: 16,
                                //     ),
                              ),
                              // AutoSizeText(
                              //   'Tracking ID: 1bienrv2533485',
                              //   // style: FlutterFlowTheme.of(context)
                              //   //     .bodyMedium
                              //   //     .override(
                              //   //       fontFamily: 'Readex Pro',
                              //   //       fontSize: 16,
                              //   //     ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Container(
                    width: 513,
                    height: 198,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF7070),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              'https://picsum.photos/seed/563/600',
                              width: 125,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Item: Earphone',
                                // style: FlutterFlowTheme.of(context)
                                //     .bodyMedium
                                //     .override(
                                //       fontFamily: 'Readex Pro',
                                //       fontSize: 20,
                                //       fontWeight: FontWeight.w500,
                                //     ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Status: ',
                                    // style: FlutterFlowTheme.of(context)
                                    //     .bodyMedium
                                    //     .override(
                                    //       fontFamily: 'Readex Pro',
                                    //       fontSize: 16,
                                    //     ),
                                  ),
                                  Text(
                                    'Delivering',
                                    // style: FlutterFlowTheme.of(context)
                                    //     .bodyMedium
                                    //     .override(
                                    //       fontFamily: 'Readex Pro',
                                    //       color: Color(0xFFFFE962),
                                    //       fontSize: 16,
                                    //     ),
                                  ),
                                ],
                              ),
                              Text(
                                'Date: 23/6/2023',
                                // style: FlutterFlowTheme.of(context)
                                //     .bodyMedium
                                //     .override(
                                //       fontFamily: 'Readex Pro',
                                //       fontSize: 16,
                                //     ),
                              ),
                              // AutoSizeText(
                              //   'Tracking ID: 1bienrv2533485',
                              //   // style: FlutterFlowTheme.of(context)
                              //   //     .bodyMedium
                              //   //     .override(
                              //   //       fontFamily: 'Readex Pro',
                              //   //       fontSize: 16,
                              //   //     ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Container(
                    width: 513,
                    height: 198,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF7070),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              'https://picsum.photos/seed/563/600',
                              width: 125,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Item: Earphone',
                                // style: FlutterFlowTheme.of(context)
                                //     .bodyMedium
                                //     .override(
                                //       fontFamily: 'Readex Pro',
                                //       fontSize: 20,
                                //       fontWeight: FontWeight.w500,
                                //     ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Status: ',
                                    // style: FlutterFlowTheme.of(context)
                                    //     .bodyMedium
                                    //     .override(
                                    //       fontFamily: 'Readex Pro',
                                    //       fontSize: 16,
                                    //     ),
                                  ),
                                  Text(
                                    'Delivering',
                                    // style: FlutterFlowTheme.of(context)
                                    //     .bodyMedium
                                    //     .override(
                                    //       fontFamily: 'Readex Pro',
                                    //       color: Color(0xFFFFE962),
                                    //       fontSize: 16,
                                    //     ),
                                  ),
                                ],
                              ),
                              Text(
                                'Date: 23/6/2023',
                                // style: FlutterFlowTheme.of(context)
                                //     .bodyMedium
                                //     .override(
                                //       fontFamily: 'Readex Pro',
                                //       fontSize: 16,
                                //     ),
                              ),
                              // AutoSizeText(
                              //   'Tracking ID: 1bienrv2533485',
                              //   // style: FlutterFlowTheme.of(context)
                              //   //     .bodyMedium
                              //   //     .override(
                              //   //       fontFamily: 'Readex Pro',
                              //   //       fontSize: 16,
                              //   //     ),
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
      ),
    );
  }
}
