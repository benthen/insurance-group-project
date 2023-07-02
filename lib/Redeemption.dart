// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

// import 'redemption_page_model.dart';
// export 'redemption_page_model.dart';

class RedemptionPageWidget extends StatefulWidget {
  const RedemptionPageWidget({Key? key}) : super(key: key);

  @override
  _RedemptionPageWidgetState createState() => _RedemptionPageWidgetState();
}

class _RedemptionPageWidgetState extends State<RedemptionPageWidget> {
  //late RedemptionPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    //_model = createModel(context, () => RedemptionPageModel());
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
                width: 406,
                height: 190,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF0000),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: const Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Text(
                        'Redemption',
                        // style: FlutterFlowTheme.of(context).bodyMedium.override(
                        //       fontFamily: 'Readex Pro',
                        //       color: Colors.white,
                        //       fontSize: 50,
                        //       fontWeight: FontWeight.w600,
                        //     ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                      child: Text(
                        'Receive a small gift as a reward!',
                        // style: FlutterFlowTheme.of(context).bodyMedium.override(
                        //       fontFamily: 'Readex Pro',
                        //       color: Colors.white,
                        //       fontSize: 20,
                        //     ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Container(
                  width: 460,
                  height: 143,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF7171),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: Text(
                            'Your reward point:',
                            // style: FlutterFlowTheme.of(context)
                            //     .bodyMedium
                            //     .override(
                            //       fontFamily: 'Readex Pro',
                            //       fontSize: 18,
                            //     ),
                          ),
                        ),
                      ),
                      Text(
                        '100',
                        // style: FlutterFlowTheme.of(context).bodyMedium.override(
                        //       fontFamily: 'Readex Pro',
                        //       fontSize: 60,
                        //     ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment(0, 0),
                        child: TabBar(
                          // labelColor: FlutterFlowTheme.of(context).primaryText,
                          // unselectedLabelColor:
                          //     FlutterFlowTheme.of(context).secondaryText,
                          // labelStyle: FlutterFlowTheme.of(context).titleMedium,
                          // indicatorColor: FlutterFlowTheme.of(context).primary,
                          tabs: [
                            Tab(
                              text: 'Coupons',
                            ),
                            Tab(
                              text: 'Gifts',
                            ),
                            Tab(
                              text: 'Cash',
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: Container(
                                      width: 473,
                                      height: 170,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFA3A3),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 0, 0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/873/600',
                                                      width: 100,
                                                      height: 125,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1, 0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 10, 5, 10),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1, 0),
                                                            child: Text(
                                                              'Mc Donalds',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              // style: FlutterFlowTheme
                                                              //         .of(context)
                                                              //     .bodyMedium
                                                              //     .override(
                                                              //       fontFamily:
                                                              //           'Readex Pro',
                                                              //       fontSize:
                                                              //           20,
                                                              //       fontWeight:
                                                              //           FontWeight
                                                              //               .w600,
                                                              //     ),
                                                            ),
                                                          ),
                                                          const Text(
                                                            '50% off discount on set meal',
                                                            textAlign:
                                                                TextAlign.start,
                                                            // style: FlutterFlowTheme
                                                            //         .of(context)
                                                            //     .bodyMedium,
                                                          ),
                                                          const Text(
                                                            '70 points',
                                                            textAlign:
                                                                TextAlign.start,
                                                            // style: FlutterFlowTheme
                                                            //         .of(context)
                                                            //     .bodyMedium,
                                                          ),
                                                          const Text(
                                                            'Use before 10 June 2023',
                                                            // style: FlutterFlowTheme
                                                            //         .of(context)
                                                            //     .bodyMedium,
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    1, 1),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          10,
                                                                          10,
                                                                          2),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed: () {
                                                                  print(
                                                                      'Button pressed ...');
                                                                },
                                                                text: 'Redeem',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 40,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24,
                                                                          0,
                                                                          24,
                                                                          0),
                                                                  iconPadding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                  // color: FlutterFlowTheme.of(
                                                                  //         context)
                                                                  //     .primary,
                                                                  // textStyle: FlutterFlowTheme.of(
                                                                  //         context)
                                                                  //     .titleSmall
                                                                  //     .override(
                                                                  //       fontFamily:
                                                                  //           'Readex Pro',
                                                                  //       color: Colors
                                                                  //           .white,
                                                                  //     ),
                                                                  elevation: 3,
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ]//.divide(const SizedBox(
                                                           // height: 4)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: Container(
                                      width: 473,
                                      height: 170,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFA3A3),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 0, 0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/873/600',
                                                      width: 100,
                                                      height: 125,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1, 0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 10, 5, 10),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1, 0),
                                                            child: Text(
                                                              'Mc Donalds',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              // style: FlutterFlowTheme
                                                              //         .of(context)
                                                              //     .bodyMedium
                                                              //     .override(
                                                              //       fontFamily:
                                                              //           'Readex Pro',
                                                              //       fontSize:
                                                              //           20,
                                                              //       fontWeight:
                                                              //           FontWeight
                                                              //               .w600,
                                                              //     ),
                                                            ),
                                                          ),
                                                          const Text(
                                                            '50% off discount on set meal',
                                                            textAlign:
                                                                TextAlign.start,
                                                            // style: FlutterFlowTheme
                                                            //         .of(context)
                                                            //     .bodyMedium,
                                                          ),
                                                          const Text(
                                                            '70 points',
                                                            textAlign:
                                                                TextAlign.start,
                                                            // style: FlutterFlowTheme
                                                            //         .of(context)
                                                            //     .bodyMedium,
                                                          ),
                                                          const Text(
                                                            'Use before 10 June 2023',
                                                            // style: FlutterFlowTheme
                                                            //         .of(context)
                                                            //     .bodyMedium,
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    1, 1),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          10,
                                                                          10,
                                                                          2),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed: () {
                                                                  print(
                                                                      'Button pressed ...');
                                                                },
                                                                text: 'Redeem',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 40,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24,
                                                                          0,
                                                                          24,
                                                                          0),
                                                                  iconPadding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                  // color: FlutterFlowTheme.of(
                                                                  //         context)
                                                                  //     .primary,
                                                                  // textStyle: FlutterFlowTheme.of(
                                                                  //         context)
                                                                  //     .titleSmall
                                                                  //     .override(
                                                                  //       fontFamily:
                                                                  //           'Readex Pro',
                                                                  //       color: Colors
                                                                  //           .white,
                                                                  //     ),
                                                                  elevation: 3,
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ]//.divide(const SizedBox(
                                                           // height: 4)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: Container(
                                      width: 473,
                                      height: 170,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFA3A3),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 0, 0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/873/600',
                                                      width: 100,
                                                      height: 125,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1, 0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 10, 5, 10),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1, 0),
                                                            child: Text(
                                                              'Mc Donalds',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              // style: FlutterFlowTheme
                                                              //         .of(context)
                                                              //     .bodyMedium
                                                              //     .override(
                                                              //       fontFamily:
                                                              //           'Readex Pro',
                                                              //       fontSize:
                                                              //           20,
                                                              //       fontWeight:
                                                              //           FontWeight
                                                              //               .w600,
                                                              //     ),
                                                            ),
                                                          ),
                                                          const Text(
                                                            '50% off discount on set meal',
                                                            textAlign:
                                                                TextAlign.start,
                                                            // style: FlutterFlowTheme
                                                            //         .of(context)
                                                            //     .bodyMedium,
                                                          ),
                                                          const Text(
                                                            '70 points',
                                                            textAlign:
                                                                TextAlign.start,
                                                            // style: FlutterFlowTheme
                                                            //         .of(context)
                                                            //     .bodyMedium,
                                                          ),
                                                          const Text(
                                                            'Use before 10 June 2023',
                                                            // style: FlutterFlowTheme
                                                            //         .of(context)
                                                            //     .bodyMedium,
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    1, 1),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          10,
                                                                          10,
                                                                          2),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed: () {
                                                                  print(
                                                                      'Button pressed ...');
                                                                },
                                                                text: 'Redeem',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 40,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24,
                                                                          0,
                                                                          24,
                                                                          0),
                                                                  iconPadding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                  // color: FlutterFlowTheme.of(
                                                                  //         context)
                                                                  //     .primary,
                                                                  // textStyle: FlutterFlowTheme.of(
                                                                  //         context)
                                                                  //     .titleSmall
                                                                  //     .override(
                                                                  //       fontFamily:
                                                                  //           'Readex Pro',
                                                                  //       color: Colors
                                                                  //           .white,
                                                                  //     ),
                                                                  elevation: 3,
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ]//.divide(const SizedBox(
                                                           // height: 4)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
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
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: Container(
                                      width: 473,
                                      height: 170,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFA3A3),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 0, 0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/873/600',
                                                      width: 100,
                                                      height: 125,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1, 0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 10, 5, 10),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1, 0),
                                                            child: Text(
                                                              'Mc Donalds',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              // style: FlutterFlowTheme
                                                              //         .of(context)
                                                              //     .bodyMedium
                                                              //     .override(
                                                              //       fontFamily:
                                                              //           'Readex Pro',
                                                              //       fontSize:
                                                              //           20,
                                                              //       fontWeight:
                                                              //           FontWeight
                                                              //               .w600,
                                                              //     ),
                                                            ),
                                                          ),
                                                          const Text(
                                                            '50% off discount on set meal',
                                                            textAlign:
                                                                TextAlign.start,
                                                            // style: FlutterFlowTheme
                                                            //         .of(context)
                                                            //     .bodyMedium,
                                                          ),
                                                          const Text(
                                                            '70 points',
                                                            textAlign:
                                                                TextAlign.start,
                                                            // style: FlutterFlowTheme
                                                            //         .of(context)
                                                            //     .bodyMedium,
                                                          ),
                                                          const Text(
                                                            'Use before 10 June 2023',
                                                            // style: FlutterFlowTheme
                                                            //         .of(context)
                                                            //     .bodyMedium,
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    1, 1),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          10,
                                                                          10,
                                                                          2),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed: () {
                                                                  print(
                                                                      'Button pressed ...');
                                                                },
                                                                text: 'Redeem',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 40,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24,
                                                                          0,
                                                                          24,
                                                                          0),
                                                                  iconPadding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                  // color: FlutterFlowTheme.of(
                                                                  //         context)
                                                                  //     .primary,
                                                                  // textStyle: FlutterFlowTheme.of(
                                                                  //         context)
                                                                  //     .titleSmall
                                                                  //     .override(
                                                                  //       fontFamily:
                                                                  //           'Readex Pro',
                                                                  //       color: Colors
                                                                  //           .white,
                                                                  //     ),
                                                                  elevation: 3,
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ]//.divide(const SizedBox(
                                                           // height: 4)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: Container(
                                      width: 473,
                                      height: 170,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFA3A3),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 0, 0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/873/600',
                                                      width: 100,
                                                      height: 125,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1, 0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 10, 5, 10),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1, 0),
                                                            child: Text(
                                                              'Mc Donalds',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              // style: FlutterFlowTheme
                                                              //         .of(context)
                                                              //     .bodyMedium
                                                              //     .override(
                                                              //       fontFamily:
                                                              //           'Readex Pro',
                                                              //       fontSize:
                                                              //           20,
                                                              //       fontWeight:
                                                              //           FontWeight
                                                              //               .w600,
                                                              //     ),
                                                            ),
                                                          ),
                                                          const Text(
                                                            '50% off discount on set meal',
                                                            textAlign:
                                                                TextAlign.start,
                                                            // style: FlutterFlowTheme
                                                            //         .of(context)
                                                            //     .bodyMedium,
                                                          ),
                                                          const Text(
                                                            '70 points',
                                                            textAlign:
                                                                TextAlign.start,
                                                            // style: FlutterFlowTheme
                                                            //         .of(context)
                                                            //     .bodyMedium,
                                                          ),
                                                          const Text(
                                                            'Use before 10 June 2023',
                                                            // style: FlutterFlowTheme
                                                            //         .of(context)
                                                            //     .bodyMedium,
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    1, 1),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          10,
                                                                          10,
                                                                          2),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed: () {
                                                                  print(
                                                                      'Button pressed ...');
                                                                },
                                                                text: 'Redeem',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 40,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24,
                                                                          0,
                                                                          24,
                                                                          0),
                                                                  iconPadding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                  // color: FlutterFlowTheme.of(
                                                                  //         context)
                                                                  //     .primary,
                                                                  // textStyle: FlutterFlowTheme.of(
                                                                  //         context)
                                                                  //     .titleSmall
                                                                  //     .override(
                                                                  //       fontFamily:
                                                                  //           'Readex Pro',
                                                                  //       color: Colors
                                                                  //           .white,
                                                                  //     ),
                                                                  elevation: 3,
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ]//.divide(const SizedBox(
                                                           // height: 4)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: Container(
                                      width: 473,
                                      height: 170,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFA3A3),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 0, 0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/873/600',
                                                      width: 100,
                                                      height: 125,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1, 0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 10, 5, 10),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1, 0),
                                                            child: Text(
                                                              'Mc Donalds',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              // style: FlutterFlowTheme
                                                              //         .of(context)
                                                              //     .bodyMedium
                                                              //     .override(
                                                              //       fontFamily:
                                                              //           'Readex Pro',
                                                              //       fontSize:
                                                              //           20,
                                                              //       fontWeight:
                                                              //           FontWeight
                                                              //               .w600,
                                                              //     ),
                                                            ),
                                                          ),
                                                          const Text(
                                                            '50% off discount on set meal',
                                                            textAlign:
                                                                TextAlign.start,
                                                            // style: FlutterFlowTheme
                                                            //         .of(context)
                                                            //     .bodyMedium,
                                                          ),
                                                          const Text(
                                                            '70 points',
                                                            textAlign:
                                                                TextAlign.start,
                                                            // style: FlutterFlowTheme
                                                            //         .of(context)
                                                            //     .bodyMedium,
                                                          ),
                                                          const Text(
                                                            'Use before 10 June 2023',
                                                            // style: FlutterFlowTheme
                                                            //         .of(context)
                                                            //     .bodyMedium,
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    1, 1),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          10,
                                                                          10,
                                                                          2),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed: () {
                                                                  print(
                                                                      'Button pressed ...');
                                                                },
                                                                text: 'Redeem',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 40,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24,
                                                                          0,
                                                                          24,
                                                                          0),
                                                                  iconPadding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                  // color: FlutterFlowTheme.of(
                                                                  //         context)
                                                                  //     .primary,
                                                                  // textStyle: FlutterFlowTheme.of(
                                                                  //         context)
                                                                  //     .titleSmall
                                                                  //     .override(
                                                                  //       fontFamily:
                                                                  //           'Readex Pro',
                                                                  //       color: Colors
                                                                  //           .white,
                                                                  //     ),
                                                                  elevation: 3,
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ]//.divide(const SizedBox(
                                                           // height: 4)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
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
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: Container(
                                      width: 473,
                                      height: 170,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFA3A3),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 0, 0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/873/600',
                                                      width: 100,
                                                      height: 125,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1, 0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 10, 5, 10),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1, 0),
                                                            child: Text(
                                                              'Mc Donalds',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              // style: FlutterFlowTheme
                                                              //         .of(context)
                                                              //     .bodyMedium
                                                              //     .override(
                                                              //       fontFamily:
                                                              //           'Readex Pro',
                                                              //       fontSize:
                                                              //           20,
                                                              //       fontWeight:
                                                              //           FontWeight
                                                              //               .w600,
                                                              //     ),
                                                            ),
                                                          ),
                                                          const Text(
                                                            '50% off discount on set meal',
                                                            textAlign:
                                                                TextAlign.start,
                                                            // style: FlutterFlowTheme
                                                            //         .of(context)
                                                            //     .bodyMedium,
                                                          ),
                                                          const Text(
                                                            '70 points',
                                                            textAlign:
                                                                TextAlign.start,
                                                            // style: FlutterFlowTheme
                                                            //         .of(context)
                                                            //     .bodyMedium,
                                                          ),
                                                          const Text(
                                                            'Use before 10 June 2023',
                                                            // style: FlutterFlowTheme
                                                            //         .of(context)
                                                            //     .bodyMedium,
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    1, 1),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          10,
                                                                          10,
                                                                          2),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed: () {
                                                                  print(
                                                                      'Button pressed ...');
                                                                },
                                                                text: 'Redeem',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 40,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24,
                                                                          0,
                                                                          24,
                                                                          0),
                                                                  iconPadding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                  // color: FlutterFlowTheme.of(
                                                                  //         context)
                                                                  //     .primary,
                                                                  // textStyle: FlutterFlowTheme.of(
                                                                  //         context)
                                                                  //     .titleSmall
                                                                  //     .override(
                                                                  //       fontFamily:
                                                                  //           'Readex Pro',
                                                                  //       color: Colors
                                                                  //           .white,
                                                                  //     ),
                                                                  elevation: 3,
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ]//.divide(const SizedBox(
                                                           // height: 4)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: Container(
                                      width: 473,
                                      height: 170,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFA3A3),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 0, 0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/873/600',
                                                      width: 100,
                                                      height: 125,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1, 0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 10, 5, 10),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1, 0),
                                                            child: Text(
                                                              'Mc Donalds',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              // style: FlutterFlowTheme
                                                              //         .of(context)
                                                              //     .bodyMedium
                                                              //     .override(
                                                              //       fontFamily:
                                                              //           'Readex Pro',
                                                              //       fontSize:
                                                              //           20,
                                                              //       fontWeight:
                                                              //           FontWeight
                                                              //               .w600,
                                                              //     ),
                                                            ),
                                                          ),
                                                          const Text(
                                                            '50% off discount on set meal',
                                                            textAlign:
                                                                TextAlign.start,
                                                            // style: FlutterFlowTheme
                                                            //         .of(context)
                                                            //     .bodyMedium,
                                                          ),
                                                          const Text(
                                                            '70 points',
                                                            textAlign:
                                                                TextAlign.start,
                                                            // style: FlutterFlowTheme
                                                            //         .of(context)
                                                            //     .bodyMedium,
                                                          ),
                                                          const Text(
                                                            'Use before 10 June 2023',
                                                            // style: FlutterFlowTheme
                                                            //         .of(context)
                                                            //     .bodyMedium,
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    1, 1),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          10,
                                                                          10,
                                                                          2),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed: () {
                                                                  print(
                                                                      'Button pressed ...');
                                                                },
                                                                text: 'Redeem',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 40,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24,
                                                                          0,
                                                                          24,
                                                                          0),
                                                                  iconPadding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                  // color: FlutterFlowTheme.of(
                                                                  //         context)
                                                                  //     .primary,
                                                                  // textStyle: FlutterFlowTheme.of(
                                                                  //         context)
                                                                  //     .titleSmall
                                                                  //     .override(
                                                                  //       fontFamily:
                                                                  //           'Readex Pro',
                                                                  //       color: Colors
                                                                  //           .white,
                                                                  //     ),
                                                                  elevation: 3,
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ]//.divide(const SizedBox(
                                                           // height: 4)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: Container(
                                      width: 473,
                                      height: 170,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFFA3A3),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 0, 0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.network(
                                                      'https://picsum.photos/seed/873/600',
                                                      width: 100,
                                                      height: 125,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1, 0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5, 10, 5, 10),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1, 0),
                                                            child: Text(
                                                              'Mc Donalds',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              // style: FlutterFlowTheme
                                                              //         .of(context)
                                                              //     .bodyMedium
                                                              //     .override(
                                                              //       fontFamily:
                                                              //           'Readex Pro',
                                                              //       fontSize:
                                                              //           20,
                                                              //       fontWeight:
                                                              //           FontWeight
                                                              //               .w600,
                                                              //     ),
                                                            ),
                                                          ),
                                                          const Text(
                                                            '50% off discount on set meal',
                                                            textAlign:
                                                                TextAlign.start,
                                                            // style: FlutterFlowTheme
                                                            //         .of(context)
                                                            //     .bodyMedium,
                                                          ),
                                                          const Text(
                                                            '70 points',
                                                            textAlign:
                                                                TextAlign.start,
                                                            // style: FlutterFlowTheme
                                                            //         .of(context)
                                                            //     .bodyMedium,
                                                          ),
                                                          const Text(
                                                            'Use before 10 June 2023',
                                                            // style: FlutterFlowTheme
                                                            //         .of(context)
                                                            //     .bodyMedium,
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    1, 1),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          10,
                                                                          10,
                                                                          2),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed: () {
                                                                  print(
                                                                      'Button pressed ...');
                                                                },
                                                                text: 'Redeem',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 40,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24,
                                                                          0,
                                                                          24,
                                                                          0),
                                                                  iconPadding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                  // color: FlutterFlowTheme.of(
                                                                  //         context)
                                                                  //     .primary,
                                                                  // textStyle: FlutterFlowTheme.of(
                                                                  //         context)
                                                                  //     .titleSmall
                                                                  //     .override(
                                                                  //       fontFamily:
                                                                  //           'Readex Pro',
                                                                  //       color: Colors
                                                                  //           .white,
                                                                  //     ),
                                                                  elevation: 3,
                                                                  borderSide:
                                                                      const BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ]//.divide(const SizedBox(
                                                           // height: 4)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
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
  
  FFButtonWidget({required Null Function() onPressed, required String text, required options}) {}
  
  FFButtonOptions({required int height, required EdgeInsetsDirectional padding, required EdgeInsetsDirectional iconPadding, required int elevation, required BorderSide borderSide, required BorderRadius borderRadius}) {}
}
