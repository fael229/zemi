import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/detail_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MoyenPaiementWidget extends StatefulWidget {
  const MoyenPaiementWidget({
    Key? key,
    this.refComm,
  }) : super(key: key);

  final DocumentReference? refComm;

  @override
  _MoyenPaiementWidgetState createState() => _MoyenPaiementWidgetState();
}

class _MoyenPaiementWidgetState extends State<MoyenPaiementWidget> {
  ApiCallResponse? apiResult0fd11;
  ApiCallResponse? apiResultldm11;
  ApiCallResponse? apiResulty733;
  ApiCallResponse? apiResultyz12;
  String? dropDown1111Value;
  TextEditingController? textFieldmomo111Controller;
  TextEditingController? textField125Controller;
  String? reseau2222Value;
  String? dropDown22222Value;
  TextEditingController? textFieldjoi222Controller;
  var placePicker2222Value = FFPlace();
  ApiCallResponse? apiResult0fd;
  ApiCallResponse? apiResultldm;
  ApiCallResponse? apiResulty73;
  ApiCallResponse? apiResultyz8;
  String? dropDownValue1;
  TextEditingController? textController6;
  TextEditingController? textController5;
  String? reseauValue;
  String? dropDownValue2;
  TextEditingController? textController7;
  var placePickerValue = FFPlace();
  List<ProduitsRecord>? algoliaSearchResults = [];
  TextEditingController? searchField232Controller;
  LatLng? currentUserLocationValue;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'moyenPaiement'});
    searchField232Controller = TextEditingController();
    textController5 = TextEditingController(text: FFAppState().indication);
    textController6 = TextEditingController(text: FFAppState().momo);
    textController7 = TextEditingController(text: FFAppState().joignable);
    textField125Controller =
        TextEditingController(text: FFAppState().indication);
    textFieldmomo111Controller = TextEditingController(text: FFAppState().momo);
    textFieldjoi222Controller =
        TextEditingController(text: FFAppState().joignable);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    searchField232Controller?.dispose();
    textController5?.dispose();
    textController6?.dispose();
    textController7?.dispose();
    textField125Controller?.dispose();
    textFieldmomo111Controller?.dispose();
    textFieldjoi222Controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: AuthUserStreamWidget(
            builder: (context) => StreamBuilder<UsersRecord>(
              stream: UsersRecord.getDocument(currentUserReference!),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: SpinKitPulse(
                        color: FlutterFlowTheme.of(context).primaryColor,
                        size: 20,
                      ),
                    ),
                  );
                }
                final stackUsersRecord = snapshot.data!;
                return Stack(
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 24, 0, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    borderWidth: 1,
                                    buttonSize: 60,
                                    icon: Icon(
                                      FFIcons.kfiRrArrowLeft,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 30,
                                    ),
                                    onPressed: () async {
                                      context.pop();
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24, 20, 0, 0),
                                    child: Text(
                                      'Paiement Commande',
                                      style:
                                          FlutterFlowTheme.of(context).title1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            StreamBuilder<List<PanierRecord>>(
                              stream: queryPanierRecord(
                                parent: currentUserReference,
                                queryBuilder: (panierRecord) => panierRecord
                                    .whereIn('ref', FFAppState().panieRef),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: SpinKitPulse(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 20,
                                      ),
                                    ),
                                  );
                                }
                                List<PanierRecord> containerPanierRecordList =
                                    snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  constraints: BoxConstraints(
                                    maxWidth: 500,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0x00272B50),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 35),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 0, 20),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 12, 5),
                                                child: Builder(
                                                  builder: (context) {
                                                    final panChild =
                                                        FFAppState()
                                                            .panieRef
                                                            .toList();
                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: List.generate(
                                                            panChild.length,
                                                            (panChildIndex) {
                                                          final panChildItem =
                                                              panChild[
                                                                  panChildIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        4,
                                                                        0,
                                                                        4),
                                                            child: Container(
                                                              width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width,
                                                              height: 130,
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxWidth: 500,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        10,
                                                                        10,
                                                                        10),
                                                                child: StreamBuilder<
                                                                    PanierRecord>(
                                                                  stream: PanierRecord
                                                                      .getDocument(
                                                                          panChildItem),
                                                                  builder:
                                                                      (context,
                                                                          snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              20,
                                                                          height:
                                                                              20,
                                                                          child:
                                                                              SpinKitPulse(
                                                                            color: FlutterFlowTheme.of(context).primaryColor,
                                                                            size: 20,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    final rowPanierRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize.max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Container(
                                                                            height: MediaQuery.of(context).size.height * 1,
                                                                            decoration: BoxDecoration(
                                                                              color: Color(0x00FFFFFF),
                                                                            ),
                                                                            child: Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                    child: Container(
                                                                                      width: MediaQuery.of(context).size.width * 0.5,
                                                                                      height: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0x00FFFFFF),
                                                                                      ),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              StreamBuilder<ProduitsRecord>(
                                                                                                stream: ProduitsRecord.getDocument(rowPanierRecord.prodRef!),
                                                                                                builder: (context, snapshot) {
                                                                                                  // Customize what your widget looks like when it's loading.
                                                                                                  if (!snapshot.hasData) {
                                                                                                    return Center(
                                                                                                      child: SizedBox(
                                                                                                        width: 20,
                                                                                                        height: 20,
                                                                                                        child: SpinKitPulse(
                                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                          size: 20,
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  }
                                                                                                  final textProduitsRecord = snapshot.data!;
                                                                                                  return Text(
                                                                                                    'Nom:',
                                                                                                    maxLines: 2,
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'sf pro text',
                                                                                                          fontSize: 16,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                              Expanded(
                                                                                                flex: 2,
                                                                                                child: StreamBuilder<ProduitsRecord>(
                                                                                                  stream: ProduitsRecord.getDocument(rowPanierRecord.prodRef!),
                                                                                                  builder: (context, snapshot) {
                                                                                                    // Customize what your widget looks like when it's loading.
                                                                                                    if (!snapshot.hasData) {
                                                                                                      return Center(
                                                                                                        child: SizedBox(
                                                                                                          width: 20,
                                                                                                          height: 20,
                                                                                                          child: SpinKitPulse(
                                                                                                            color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                            size: 20,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    }
                                                                                                    final textProduitsRecord = snapshot.data!;
                                                                                                    return Text(
                                                                                                      textProduitsRecord.nom!,
                                                                                                      textAlign: TextAlign.end,
                                                                                                      maxLines: 2,
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                            fontFamily: 'sf pro text',
                                                                                                            fontSize: 16,
                                                                                                            useGoogleFonts: false,
                                                                                                          ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                                                                                            child: StreamBuilder<ProduitsRecord>(
                                                                                              stream: ProduitsRecord.getDocument(rowPanierRecord.prodRef!),
                                                                                              builder: (context, snapshot) {
                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                if (!snapshot.hasData) {
                                                                                                  return Center(
                                                                                                    child: SizedBox(
                                                                                                      width: 20,
                                                                                                      height: 20,
                                                                                                      child: SpinKitPulse(
                                                                                                        color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                        size: 20,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                }
                                                                                                final rowProduitsRecord = snapshot.data!;
                                                                                                return Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                                                                                                      child: Text(
                                                                                                        'Quantité',
                                                                                                        textAlign: TextAlign.center,
                                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                              fontFamily: 'sf pro text',
                                                                                                              fontSize: 18,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                                                                                                      child: Text(
                                                                                                        rowPanierRecord.qty!.toString(),
                                                                                                        textAlign: TextAlign.center,
                                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                              fontFamily: 'sf pro text',
                                                                                                              fontSize: 18,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
                                                                                                  child: StreamBuilder<ProduitsRecord>(
                                                                                                    stream: ProduitsRecord.getDocument(rowPanierRecord.prodRef!),
                                                                                                    builder: (context, snapshot) {
                                                                                                      // Customize what your widget looks like when it's loading.
                                                                                                      if (!snapshot.hasData) {
                                                                                                        return Center(
                                                                                                          child: SizedBox(
                                                                                                            width: 20,
                                                                                                            height: 20,
                                                                                                            child: SpinKitPulse(
                                                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                              size: 20,
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      }
                                                                                                      final textProduitsRecord = snapshot.data!;
                                                                                                      return Text(
                                                                                                        rowPanierRecord.type!,
                                                                                                        textAlign: TextAlign.start,
                                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                              fontFamily: 'sf pro text',
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              fontSize: 13,
                                                                                                              fontWeight: FontWeight.bold,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                  child: StreamBuilder<ProduitsRecord>(
                                                                                                    stream: ProduitsRecord.getDocument(rowPanierRecord.prodRef!),
                                                                                                    builder: (context, snapshot) {
                                                                                                      // Customize what your widget looks like when it's loading.
                                                                                                      if (!snapshot.hasData) {
                                                                                                        return Center(
                                                                                                          child: SizedBox(
                                                                                                            width: 20,
                                                                                                            height: 20,
                                                                                                            child: SpinKitPulse(
                                                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                              size: 20,
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      }
                                                                                                      final textProduitsRecord = snapshot.data!;
                                                                                                      return Text(
                                                                                                        '${functions.reduce(() {
                                                                                                          if (rowPanierRecord.type == 'simple') {
                                                                                                            return functions.multippl(textProduitsRecord.prix!, rowPanierRecord.qty!);
                                                                                                          } else if (rowPanierRecord.type == 'plat complet') {
                                                                                                            return functions.multippl(textProduitsRecord.prixComplet!, rowPanierRecord.qty!);
                                                                                                          } else {
                                                                                                            return functions.multippl(textProduitsRecord.prixDemi!, rowPanierRecord.qty!);
                                                                                                          }
                                                                                                        }(), textProduitsRecord.pourcentage!).toString()} FCFA',
                                                                                                        textAlign: TextAlign.end,
                                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                              fontFamily: 'sf pro text',
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              fontSize: 18,
                                                                                                              fontWeight: FontWeight.bold,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 10),
                                                                                            child: Container(
                                                                                              width: double.infinity,
                                                                                              height: 1,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional
                                                .fromSTEB(30, 0, 20, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 5, 5, 0),
                                                    child: Text(
                                                      'Sous Total',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'sf pro text',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 5, 0, 0),
                                                    child: Text(
                                                      '${functions.subtotal(containerPanierRecordList.map((e) => e.mt).withoutNulls.toList()).toString()} FCFA',
                                                      textAlign:
                                                          TextAlign.end,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'sf pro text',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional
                                                .fromSTEB(30, 10, 20, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 5, 5, 0),
                                                    child: Text(
                                                      'Jour de livraison',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'sf pro text',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 5, 0, 0),
                                                    child: StreamBuilder<
                                                        PrecommandeRecord>(
                                                      stream: PrecommandeRecord
                                                          .getDocument(widget
                                                              .refComm!),
                                                      builder: (context,
                                                          snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot
                                                            .hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 20,
                                                              height: 20,
                                                              child:
                                                                  SpinKitPulse(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 20,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final textPrecommandeRecord =
                                                            snapshot.data!;
                                                        return Text(
                                                          dateTimeFormat(
                                                            'd/M H:mm',
                                                            textPrecommandeRecord
                                                                .date!,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'sf pro text',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional
                                                .fromSTEB(30, 10, 20, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 5, 5, 0),
                                                    child: Text(
                                                      'Frais Livraison',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'sf pro text',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 5, 0, 0),
                                                    child: StreamBuilder<
                                                        List<
                                                            FraisLivraisonRecord>>(
                                                      stream:
                                                          queryFraisLivraisonRecord(
                                                        singleRecord: true,
                                                      ),
                                                      builder: (context,
                                                          snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot
                                                            .hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 20,
                                                              height: 20,
                                                              child:
                                                                  SpinKitPulse(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 20,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<FraisLivraisonRecord>
                                                            textFraisLivraisonRecordList =
                                                            snapshot.data!;
                                                        final textFraisLivraisonRecord =
                                                            textFraisLivraisonRecordList
                                                                    .isNotEmpty
                                                                ? textFraisLivraisonRecordList
                                                                    .first
                                                                : null;
                                                        return Text(
                                                          '${functions.livreSup(containerPanierRecordList.length, textFraisLivraisonRecord!.nom!, stackUsersRecord.abonnLivraison!).toString()} FCFA',
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'sf pro text',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsetsDirectional
                                                .fromSTEB(30, 10, 20, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 5, 5, 0),
                                                    child: Text(
                                                      'Total',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'sf pro text',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 28,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 5, 0, 0),
                                                    child: StreamBuilder<
                                                        List<
                                                            FraisLivraisonRecord>>(
                                                      stream:
                                                          queryFraisLivraisonRecord(
                                                        singleRecord: true,
                                                      ),
                                                      builder: (context,
                                                          snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot
                                                            .hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 20,
                                                              height: 20,
                                                              child:
                                                                  SpinKitPulse(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 20,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<FraisLivraisonRecord>
                                                            textFraisLivraisonRecordList =
                                                            snapshot.data!;
                                                        final textFraisLivraisonRecord =
                                                            textFraisLivraisonRecordList
                                                                    .isNotEmpty
                                                                ? textFraisLivraisonRecordList
                                                                    .first
                                                                : null;
                                                        return Text(
                                                          '${functions.ttc(functions.subtotal(containerPanierRecordList.map((e) => e.mt).withoutNulls.toList()), functions.livreSup(containerPanierRecordList.length, textFraisLivraisonRecord!.nom!, stackUsersRecord.abonnLivraison!)).toString()} FCFA',
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'sf pro text',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 22,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Form(
                                            key: formKey1,
                                            autovalidateMode:
                                                AutovalidateMode.disabled,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              30, 0, 20, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0,
                                                                      16,
                                                                      0,
                                                                      0),
                                                          child:
                                                              FlutterFlowPlacePicker(
                                                            iOSGoogleMapsApiKey:
                                                                'AIzaSyCRGKk3dJAAsplwPXQ2Vnnlg07i28ERsb8',
                                                            androidGoogleMapsApiKey:
                                                                'AIzaSyBssFwtKUm1SeYwXoX2mcHCqrGez2r6eP4',
                                                            webGoogleMapsApiKey:
                                                                'AIzaSyB5sjnjOQ2_0K76Dm8zJRa6N5KQ1sCeuJI',
                                                            onSelect:
                                                                (place) async {
                                                              setState(() =>
                                                                  placePicker2222Value =
                                                                      place);
                                                            },
                                                            defaultText:
                                                                'Lieu de livraison',
                                                            icon: Icon(
                                                              Icons.place,
                                                              color: Colors
                                                                  .white,
                                                              size: 16,
                                                            ),
                                                            buttonOptions:
                                                                FFButtonOptions(
                                                              width: 200,
                                                              height: 40,
                                                              color: FlutterFlowTheme.of(
                                                                      context)
                                                                  .tertiary400,
                                                              textStyle: FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle2
                                                                  .override(
                                                                    fontFamily:
                                                                        'sf pro text',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if (placePicker2222Value !=
                                                    null)
                                                  StreamBuilder<UsersRecord>(
                                                    stream: UsersRecord
                                                        .getDocument(
                                                            currentUserReference!),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 20,
                                                            height: 20,
                                                            child:
                                                                SpinKitPulse(
                                                              color: FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryColor,
                                                              size: 20,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final columnUsersRecord =
                                                          snapshot.data!;
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        30,
                                                                        16,
                                                                        20,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          textField125Controller,
                                                                      onFieldSubmitted:
                                                                          (_) async {
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().indication =
                                                                              textField125Controller!.text;
                                                                        });
                                                                      },
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            'Courte indication',
                                                                        hintStyle: FlutterFlowTheme.of(context)
                                                                            .bodyText2
                                                                            .override(
                                                                              fontFamily: 'sf pro text',
                                                                              fontSize: 16,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                            width: 2,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(20),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                            width: 2,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(20),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color: Color(0x00000000),
                                                                            width: 2,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(20),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color: Color(0x00000000),
                                                                            width: 2,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(20),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily: 'sf pro text',
                                                                            fontSize: 18,
                                                                            useGoogleFonts: false,
                                                                            lineHeight: 2,
                                                                          ),
                                                                      maxLines:
                                                                          5,
                                                                      validator:
                                                                          (val) {
                                                                        if (val == null ||
                                                                            val.isEmpty) {
                                                                          return 'Field is required';
                                                                        }

                                                                        return null;
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        30,
                                                                        16,
                                                                        20,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FlutterFlowDropDown<
                                                                    String>(
                                                                  initialOption:
                                                                      dropDown1111Value ??=
                                                                          '+229',
                                                                  options: [
                                                                    '+229'
                                                                  ],
                                                                  onChanged: (val) =>
                                                                      setState(() =>
                                                                          dropDown1111Value =
                                                                              val),
                                                                  width: 120,
                                                                  height: 60,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'sf pro text',
                                                                        color:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        fontSize:
                                                                            18,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                  hintText:
                                                                      'Votre Opérateur Réseau',
                                                                  icon: Icon(
                                                                    Icons
                                                                        .arrow_drop_down,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 30,
                                                                  ),
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  elevation:
                                                                      2,
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(context)
                                                                          .secondaryText,
                                                                  borderWidth:
                                                                      2,
                                                                  borderRadius:
                                                                      10,
                                                                  margin: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          4,
                                                                          12,
                                                                          4),
                                                                  hidesUnderline:
                                                                      true,
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          textFieldmomo111Controller,
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            'Numéro MOMO',
                                                                        hintStyle: FlutterFlowTheme.of(context)
                                                                            .bodyText2
                                                                            .override(
                                                                              fontFamily: 'sf pro text',
                                                                              fontSize: 16,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                        enabledBorder:
                                                                            UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                            width: 2,
                                                                          ),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            topLeft: Radius.circular(4.0),
                                                                            topRight: Radius.circular(4.0),
                                                                          ),
                                                                        ),
                                                                        focusedBorder:
                                                                            UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                            width: 2,
                                                                          ),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            topLeft: Radius.circular(4.0),
                                                                            topRight: Radius.circular(4.0),
                                                                          ),
                                                                        ),
                                                                        errorBorder:
                                                                            UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color: Color(0x00000000),
                                                                            width: 2,
                                                                          ),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            topLeft: Radius.circular(4.0),
                                                                            topRight: Radius.circular(4.0),
                                                                          ),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color: Color(0x00000000),
                                                                            width: 2,
                                                                          ),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            topLeft: Radius.circular(4.0),
                                                                            topRight: Radius.circular(4.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily: 'sf pro text',
                                                                            fontSize: 18,
                                                                            useGoogleFonts: false,
                                                                            lineHeight: 2,
                                                                          ),
                                                                      validator:
                                                                          (val) {
                                                                        if (val == null ||
                                                                            val.isEmpty) {
                                                                          return 'Field is required';
                                                                        }

                                                                        return null;
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        30,
                                                                        16,
                                                                        20,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child: FlutterFlowDropDown<
                                                                      String>(
                                                                    initialOption:
                                                                        reseau2222Value ??=
                                                                            valueOrDefault<String>(
                                                                      FFAppState()
                                                                          .reseau,
                                                                      'mtn',
                                                                    ),
                                                                    options: [
                                                                      'mtn',
                                                                      'moov'
                                                                    ],
                                                                    onChanged:
                                                                        (val) =>
                                                                            setState(() => reseau2222Value = val),
                                                                    width:
                                                                        180,
                                                                    height:
                                                                        60,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'sf pro text',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              24,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                    hintText:
                                                                        'Votre Opérateur Réseau',
                                                                    icon:
                                                                        Icon(
                                                                      Icons
                                                                          .arrow_drop_down,
                                                                      color: FlutterFlowTheme.of(context)
                                                                          .secondaryText,
                                                                      size:
                                                                          30,
                                                                    ),
                                                                    fillColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                    elevation:
                                                                        2,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                    borderWidth:
                                                                        2,
                                                                    borderRadius:
                                                                        10,
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            4,
                                                                            12,
                                                                            4),
                                                                    hidesUnderline:
                                                                        true,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        30,
                                                                        16,
                                                                        20,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FlutterFlowDropDown<
                                                                    String>(
                                                                  initialOption:
                                                                      dropDown22222Value ??=
                                                                          '+229',
                                                                  options: [
                                                                    '+229'
                                                                  ],
                                                                  onChanged: (val) =>
                                                                      setState(() =>
                                                                          dropDown22222Value =
                                                                              val),
                                                                  width: 120,
                                                                  height: 60,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'sf pro text',
                                                                        color:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        fontSize:
                                                                            18,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                  hintText:
                                                                      'Votre Opérateur Réseau',
                                                                  icon: Icon(
                                                                    Icons
                                                                        .arrow_drop_down,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 30,
                                                                  ),
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  elevation:
                                                                      2,
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(context)
                                                                          .secondaryText,
                                                                  borderWidth:
                                                                      2,
                                                                  borderRadius:
                                                                      10,
                                                                  margin: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          4,
                                                                          12,
                                                                          4),
                                                                  hidesUnderline:
                                                                      true,
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          textFieldjoi222Controller,
                                                                      autofocus:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        hintText:
                                                                            'Numéro  Joignable',
                                                                        hintStyle: FlutterFlowTheme.of(context)
                                                                            .bodyText2
                                                                            .override(
                                                                              fontFamily: 'sf pro text',
                                                                              fontSize: 16,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                        enabledBorder:
                                                                            UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                            width: 2,
                                                                          ),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            topLeft: Radius.circular(4.0),
                                                                            topRight: Radius.circular(4.0),
                                                                          ),
                                                                        ),
                                                                        focusedBorder:
                                                                            UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                            width: 2,
                                                                          ),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            topLeft: Radius.circular(4.0),
                                                                            topRight: Radius.circular(4.0),
                                                                          ),
                                                                        ),
                                                                        errorBorder:
                                                                            UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color: Color(0x00000000),
                                                                            width: 2,
                                                                          ),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            topLeft: Radius.circular(4.0),
                                                                            topRight: Radius.circular(4.0),
                                                                          ),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            UnderlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color: Color(0x00000000),
                                                                            width: 2,
                                                                          ),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            topLeft: Radius.circular(4.0),
                                                                            topRight: Radius.circular(4.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily: 'sf pro text',
                                                                            fontSize: 18,
                                                                            useGoogleFonts: false,
                                                                            lineHeight: 2,
                                                                          ),
                                                                      validator:
                                                                          (val) {
                                                                        if (val == null ||
                                                                            val.isEmpty) {
                                                                          return 'Field is required';
                                                                        }

                                                                        return null;
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          if (FFAppState()
                                                                  .cash ==
                                                              false)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          30,
                                                                          0,
                                                                          20,
                                                                          0),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      FraisLivraisonRecord>>(
                                                                stream:
                                                                    queryFraisLivraisonRecord(
                                                                  singleRecord:
                                                                      true,
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            20,
                                                                        height:
                                                                            20,
                                                                        child:
                                                                            SpinKitPulse(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          size:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<FraisLivraisonRecord>
                                                                      rowFraisLivraisonRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  final rowFraisLivraisonRecord = rowFraisLivraisonRecordList
                                                                          .isNotEmpty
                                                                      ? rowFraisLivraisonRecordList
                                                                          .first
                                                                      : null;
                                                                  return Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              16,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              StreamBuilder<PrecommandeRecord>(
                                                                            stream: PrecommandeRecord.getDocument(widget.refComm!),
                                                                            builder: (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Center(
                                                                                  child: SizedBox(
                                                                                    width: 20,
                                                                                    height: 20,
                                                                                    child: SpinKitPulse(
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                      size: 20,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              final buttonPrecommandeRecord = snapshot.data!;
                                                                              return FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  currentUserLocationValue = await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                                  if (formKey1.currentState == null || !formKey1.currentState!.validate()) {
                                                                                    return;
                                                                                  }

                                                                                  if (dropDown1111Value == null) {
                                                                                    return;
                                                                                  }
                                                                                  if (reseau2222Value == null) {
                                                                                    return;
                                                                                  }
                                                                                  if (dropDown22222Value == null) {
                                                                                    return;
                                                                                  }

                                                                                  if (placePicker2222Value == FFPlace()) {
                                                                                    return;
                                                                                  }

                                                                                  apiResulty733 = await TransactionGenererCall.call(
                                                                                    description: buttonPrecommandeRecord.nom,
                                                                                    amount: functions.ttc(functions.subtotal(containerPanierRecordList.map((e) => e.mt).withoutNulls.toList()), functions.livreSup(containerPanierRecordList.length, rowFraisLivraisonRecord!.nom!, columnUsersRecord.abonnLivraison!)).toString(),
                                                                                    currency: 'XOF',
                                                                                    callbackUrl: 'https://maplateforme.com/callback',
                                                                                    firstname: columnUsersRecord.prenom,
                                                                                    lastname: columnUsersRecord.nom,
                                                                                    email: currentUserEmail,
                                                                                    number: functions.phone(dropDown1111Value!, textFieldmomo111Controller!.text),
                                                                                    country: 'bj',
                                                                                  );
                                                                                  if ((apiResulty733?.succeeded ?? true)) {
                                                                                    apiResultldm11 = await TransactionsTokenCall.call(
                                                                                      id: getJsonField(
                                                                                        (apiResulty733?.jsonBody ?? ''),
                                                                                        r'''$..id''',
                                                                                      ).toString(),
                                                                                    );
                                                                                    if ((apiResultldm11?.succeeded ?? true)) {
                                                                                      apiResultyz12 = await PaiementSansRediCall.call(
                                                                                        token: getJsonField(
                                                                                          (apiResultldm11?.jsonBody ?? ''),
                                                                                          r'''$.token''',
                                                                                        ).toString(),
                                                                                        moyensPaie: reseau2222Value,
                                                                                      );
                                                                                      if ((apiResultyz12?.succeeded ?? true)) {
                                                                                        apiResult0fd11 = await StatutCall.call(
                                                                                          id: getJsonField(
                                                                                            (apiResulty733?.jsonBody ?? ''),
                                                                                            r'''$..id''',
                                                                                          ).toString(),
                                                                                        );
                                                                                        if (getJsonField(
                                                                                              (apiResult0fd11?.jsonBody ?? ''),
                                                                                              r'''$..status''',
                                                                                            ) ==
                                                                                            getJsonField(
                                                                                              FFAppState().statuspaiement,
                                                                                              r'''$..status''',
                                                                                            )) {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                'Payé avec succès',
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                              ),
                                                                                              duration: Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).tertiary400,
                                                                                            ),
                                                                                          );

                                                                                          final precommandeUpdateData = createPrecommandeRecordData(
                                                                                            statut: 'Payé',
                                                                                            totalpaye: functions.ttc(functions.subtotal(containerPanierRecordList.map((e) => e.mt).withoutNulls.toList()), functions.livreSup(containerPanierRecordList.length, rowFraisLivraisonRecord!.nom!, columnUsersRecord.abonnLivraison!)),
                                                                                            datepay: getCurrentTimestamp,
                                                                                            numero: functions.phone(dropDown22222Value!, textFieldjoi222Controller!.text),
                                                                                            lieu: placePicker2222Value.name,
                                                                                            e1: true,
                                                                                            e2: false,
                                                                                            e3: false,
                                                                                            e4: false,
                                                                                            e5: false,
                                                                                            indication: textField125Controller!.text,
                                                                                            livrer: false,
                                                                                            attribution: false,
                                                                                            aboLivre: false,
                                                                                            positionClient: currentUserLocationValue,
                                                                                            lieu2: placePicker2222Value.latLng,
                                                                                          );
                                                                                          await widget.refComm!.update(precommandeUpdateData);
                                                                                          FFAppState().update(() {
                                                                                            FFAppState().commande = true;
                                                                                            FFAppState().paiementEtape = false;
                                                                                          });
                                                                                          FFAppState().update(() {
                                                                                            FFAppState().panieRef = [];
                                                                                          });
                                                                                          FFAppState().update(() {
                                                                                            FFAppState().indication = textField125Controller!.text;
                                                                                            FFAppState().momo = textFieldmomo111Controller!.text;
                                                                                            FFAppState().reseau = reseau2222Value!;
                                                                                            FFAppState().joignable = textFieldjoi222Controller!.text;
                                                                                          });
                                                                                          FFAppState().update(() {
                                                                                            FFAppState().tabSimple = true;
                                                                                          });

                                                                                          context.goNamed('cart2');
                                                                                        }
                                                                                      } else {
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              'Veuillez vérifier votre numéromomo ou Fonds insuffisants',
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                            ),
                                                                                            duration: Duration(milliseconds: 4000),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).alternate,
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                    } else {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'Veuillez vérifier votre numéromomo ou Fonds insuffisants',
                                                                                            style: TextStyle(
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                          ),
                                                                                          duration: Duration(milliseconds: 4000),
                                                                                          backgroundColor: FlutterFlowTheme.of(context).alternate,
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                  } else {
                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                      SnackBar(
                                                                                        content: Text(
                                                                                          'Veuillez vérifier votre numéromomo ou Fonds insuffisants',
                                                                                          style: TextStyle(
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                          ),
                                                                                        ),
                                                                                        duration: Duration(milliseconds: 4000),
                                                                                        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                      ),
                                                                                    );
                                                                                  }

                                                                                  setState(() {});
                                                                                },
                                                                                text: 'Payer Maintenant',
                                                                                options: FFButtonOptions(
                                                                                  width: 130,
                                                                                  height: 50,
                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                        fontFamily: 'sf pro text',
                                                                                        color: Colors.white,
                                                                                        fontSize: 18,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                  borderSide: BorderSide(
                                                                                    color: Colors.transparent,
                                                                                    width: 1,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                    ))
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 1,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Visibility(
                            visible: responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context)
                                                .size
                                                .width *
                                            0.19,
                                        height: MediaQuery.of(context)
                                                .size
                                                .height *
                                            1,
                                        decoration: BoxDecoration(
                                          color: Color(0x00272B50),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 40, 0, 0),
                                              child:
                                                  StreamBuilder<UsersRecord>(
                                                stream:
                                                    UsersRecord.getDocument(
                                                        currentUserReference!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 20,
                                                        height: 20,
                                                        child: SpinKitPulse(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final columnUsersRecord =
                                                      snapshot.data!;
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 60,
                                                        height: 60,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          columnUsersRecord
                                                              .photoUrl!,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(0,
                                                                    15, 0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize
                                                                  .max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        0,
                                                                        5,
                                                                        0),
                                                                child:
                                                                    SelectionArea(
                                                                        child:
                                                                            Text(
                                                                  columnUsersRecord
                                                                      .displayName!,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  maxLines: 1,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'sf pro text',
                                                                        fontSize:
                                                                            12,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                )),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 50, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(0, 0,
                                                                  0, 15),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          10,
                                                                          0),
                                                              child:
                                                                  Container(
                                                                width: 100,
                                                                height: 30,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0x00FC6A57),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          50),
                                                                ),
                                                                child:
                                                                    InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    context.pushNamed(
                                                                        'Accueil');
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            50,
                                                                        borderWidth:
                                                                            1,
                                                                        buttonSize:
                                                                            30,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                        icon:
                                                                            Icon(
                                                                          FFIcons.kfiRrHome,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              15,
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          print('IconButton pressed ...');
                                                                        },
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8,
                                                                              0,
                                                                              8,
                                                                              0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize: MainAxisSize.max,
                                                                            children: [
                                                                              InkWell(
                                                                                onTap: () async {
                                                                                  context.pushNamed('Accueil');
                                                                                },
                                                                                child: Text(
                                                                                  'Accueil',
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'sf pro text',
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: false,
                                                                                      ),
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
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(0, 0,
                                                                  0, 15),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          10,
                                                                          0),
                                                              child:
                                                                  Container(
                                                                width: 100,
                                                                height: 30,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0x00FC6A57),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          50),
                                                                ),
                                                                child:
                                                                    InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    context.pushNamed(
                                                                        'favoris');
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            50,
                                                                        borderWidth:
                                                                            1,
                                                                        buttonSize:
                                                                            30,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                        icon:
                                                                            Icon(
                                                                          FFIcons.kfiRrHeart,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              15,
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          print('IconButton pressed ...');
                                                                        },
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8,
                                                                              0,
                                                                              8,
                                                                              0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize: MainAxisSize.max,
                                                                            children: [
                                                                              InkWell(
                                                                                onTap: () async {
                                                                                  context.pushNamed('favoris');
                                                                                },
                                                                                child: Text(
                                                                                  'Favoris',
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'sf pro text',
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: false,
                                                                                      ),
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
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(0, 0,
                                                                  0, 15),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          10,
                                                                          0),
                                                              child:
                                                                  Container(
                                                                width: 100,
                                                                height: 30,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0x00FC6A57),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          50),
                                                                ),
                                                                child:
                                                                    InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    context.pushNamed(
                                                                        'category');
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            50,
                                                                        borderWidth:
                                                                            1,
                                                                        buttonSize:
                                                                            30,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                        icon:
                                                                            Icon(
                                                                          FFIcons.kfiRrApps,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              15,
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          print('IconButton pressed ...');
                                                                        },
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8,
                                                                              0,
                                                                              8,
                                                                              0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize: MainAxisSize.max,
                                                                            children: [
                                                                              InkWell(
                                                                                onTap: () async {
                                                                                  context.pushNamed('category');
                                                                                },
                                                                                child: Text(
                                                                                  'Catégories',
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'sf pro text',
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: false,
                                                                                      ),
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
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(0, 0,
                                                                  0, 15),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          10,
                                                                          0),
                                                              child:
                                                                  Container(
                                                                width: 150,
                                                                height: 30,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          50),
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                ),
                                                                child:
                                                                    InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    context.pushNamed(
                                                                        'cart2');
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            30,
                                                                        borderWidth:
                                                                            1,
                                                                        buttonSize:
                                                                            30,
                                                                        fillColor:
                                                                            Color(0xFFCC4433),
                                                                        icon:
                                                                            Icon(
                                                                          Icons.shopping_basket_outlined,
                                                                          color:
                                                                              Colors.white,
                                                                          size:
                                                                              15,
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          print('IconButton pressed ...');
                                                                        },
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8,
                                                                              0,
                                                                              8,
                                                                              0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize: MainAxisSize.max,
                                                                            children: [
                                                                              InkWell(
                                                                                onTap: () async {
                                                                                  context.pushNamed('cart2');
                                                                                },
                                                                                child: Text(
                                                                                  'Commandes',
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'sf pro text',
                                                                                        color: Colors.white,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: false,
                                                                                      ),
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
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(0, 0,
                                                                  0, 15),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          10,
                                                                          0),
                                                              child:
                                                                  Container(
                                                                width: 100,
                                                                height: 30,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0x00FC6A57),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          50),
                                                                ),
                                                                child:
                                                                    InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    context.pushNamed(
                                                                        'user');
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            50,
                                                                        borderWidth:
                                                                            1,
                                                                        buttonSize:
                                                                            30,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                        icon:
                                                                            Icon(
                                                                          FFIcons.kfiRrUser,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              15,
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          print('IconButton pressed ...');
                                                                        },
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8,
                                                                              0,
                                                                              8,
                                                                              0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize: MainAxisSize.max,
                                                                            children: [
                                                                              InkWell(
                                                                                onTap: () async {
                                                                                  context.pushNamed('user');
                                                                                },
                                                                                child: Text(
                                                                                  'Profil',
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'sf pro text',
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: false,
                                                                                      ),
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
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(0, 40,
                                                                  0, 0),
                                                      child: Image.asset(
                                                        'assets/images/zem_food-1.png',
                                                        width: 60,
                                                        height: 60,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: 100,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              1,
                                          decoration: BoxDecoration(
                                            color: Color(0x00272B50),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(30, 0, 30, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width *
                                                          0.55,
                                                      decoration:
                                                          BoxDecoration(
                                                        color:
                                                            Color(0x00272B50),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20,
                                                                    16,
                                                                    20,
                                                                    0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize
                                                                  .max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          0),
                                                              child:
                                                                  Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.25,
                                                                height: 40,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth:
                                                                      500,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0x00272B50),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          28),
                                                                ),
                                                                child:
                                                                    TextFormField(
                                                                  controller:
                                                                      searchField232Controller,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    'searchField232Controller',
                                                                    Duration(
                                                                        milliseconds:
                                                                            200),
                                                                    () async {
                                                                      setState(() =>
                                                                          algoliaSearchResults =
                                                                              null);
                                                                      await ProduitsRecord
                                                                          .search(
                                                                        term:
                                                                            searchField232Controller!.text,
                                                                      ).then((r) => algoliaSearchResults = r).onError((_, __) => algoliaSearchResults = []).whenComplete(() =>
                                                                          setState(() {}));
                                                                    },
                                                                  ),
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelStyle:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyText2,
                                                                    hintText:
                                                                        'Recherchez un plat ici',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color:
                                                                            Color(0x00000000),
                                                                        width:
                                                                            0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(29),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color:
                                                                            Color(0x00000000),
                                                                        width:
                                                                            0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(29),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color:
                                                                            Color(0x00000000),
                                                                        width:
                                                                            0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(29),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color:
                                                                            Color(0x00000000),
                                                                        width:
                                                                            0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(29),
                                                                    ),
                                                                    filled:
                                                                        true,
                                                                    fillColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            14,
                                                                            24,
                                                                            14,
                                                                            24),
                                                                    prefixIcon:
                                                                        Icon(
                                                                      FFIcons
                                                                          .ksearchFael,
                                                                      color: FlutterFlowTheme.of(context)
                                                                          .secondaryText,
                                                                    ),
                                                                    suffixIcon: searchField232Controller!
                                                                            .text
                                                                            .isNotEmpty
                                                                        ? InkWell(
                                                                            onTap: () async {
                                                                              searchField232Controller?.clear();
                                                                              setState(() => algoliaSearchResults = null);
                                                                              await ProduitsRecord.search(
                                                                                term: searchField232Controller!.text,
                                                                              ).then((r) => algoliaSearchResults = r).onError((_, __) => algoliaSearchResults = []).whenComplete(() => setState(() {}));

                                                                              setState(() {});
                                                                            },
                                                                            child: Icon(
                                                                              Icons.clear,
                                                                              color: Color(0xFF757575),
                                                                              size: 22,
                                                                            ),
                                                                          )
                                                                        : null,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                              ),
                                                            ),
                                                            if (searchField232Controller!
                                                                        .text !=
                                                                    null &&
                                                                searchField232Controller!
                                                                        .text !=
                                                                    '')
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        8,
                                                                        0,
                                                                        0),
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child:
                                                                      Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            MediaQuery.of(context).size.width * 0.55,
                                                                        height:
                                                                            MediaQuery.of(context).size.height * 1,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x00FFFFFF),
                                                                          borderRadius:
                                                                              BorderRadius.circular(15),
                                                                        ),
                                                                        child:
                                                                            FutureBuilder<List<ProduitsRecord>>(
                                                                          future:
                                                                              ProduitsRecord.search(
                                                                            term: searchField232Controller!.text,
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 20,
                                                                                  height: 20,
                                                                                  child: SpinKitPulse(
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    size: 20,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            List<ProduitsRecord> columnProduitsRecordList = snapshot.data!;
                                                                            // Customize what your widget looks like with no search results.
                                                                            if (snapshot.data!.isEmpty) {
                                                                              return Container(
                                                                                height: 100,
                                                                                child: Center(
                                                                                  child: Text('No results.'),
                                                                                ),
                                                                              );
                                                                            }
                                                                            return Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: List.generate(columnProduitsRecordList.length, (columnIndex) {
                                                                                final columnProduitsRecord = columnProduitsRecordList[columnIndex];
                                                                                return Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.of(context).size.width,
                                                                                    height: 130,
                                                                                    constraints: BoxConstraints(
                                                                                      maxWidth: 500,
                                                                                    ),
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                    ),
                                                                                    child: StreamBuilder<ProduitsRecord>(
                                                                                      stream: ProduitsRecord.getDocument(columnProduitsRecord.reference),
                                                                                      builder: (context, snapshot) {
                                                                                        // Customize what your widget looks like when it's loading.
                                                                                        if (!snapshot.hasData) {
                                                                                          return Center(
                                                                                            child: SizedBox(
                                                                                              width: 20,
                                                                                              height: 20,
                                                                                              child: SpinKitPulse(
                                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                size: 20,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        }
                                                                                        final rowProduitsRecord = snapshot.data!;
                                                                                        return InkWell(
                                                                                          onTap: () async {
                                                                                            FFAppState().update(() {
                                                                                              FFAppState().prixDefaut = true;
                                                                                              FFAppState().refFav = null;
                                                                                            });
                                                                                            FFAppState().update(() {
                                                                                              FFAppState().qty = 1;
                                                                                            });

                                                                                            final produitsUpdateData = {
                                                                                              'vue': FieldValue.increment(1),
                                                                                            };
                                                                                            await rowProduitsRecord.reference.update(produitsUpdateData);
                                                                                            showModalBottomSheet(
                                                                                              isScrollControlled: true,
                                                                                              backgroundColor: Colors.transparent,
                                                                                              context: context,
                                                                                              builder: (context) {
                                                                                                return Padding(
                                                                                                  padding: MediaQuery.of(context).viewInsets,
                                                                                                  child: Container(
                                                                                                    height: MediaQuery.of(context).size.height * 1,
                                                                                                    child: DetailWidget(
                                                                                                      prodRef: rowProduitsRecord.reference,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ).then((value) => setState(() {}));
                                                                                          },
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              ClipRRect(
                                                                                                borderRadius: BorderRadius.circular(10),
                                                                                                child: Image.network(
                                                                                                  rowProduitsRecord.image!,
                                                                                                  width: 100,
                                                                                                  height: 100,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Container(
                                                                                                  height: MediaQuery.of(context).size.height * 1,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Color(0x00FFFFFF),
                                                                                                  ),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                                        child: Container(
                                                                                                          width: MediaQuery.of(context).size.width * 0.5,
                                                                                                          height: double.infinity,
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Color(0x00FFFFFF),
                                                                                                          ),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            children: [
                                                                                                              Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Expanded(
                                                                                                                    flex: 2,
                                                                                                                    child: Text(
                                                                                                                      rowProduitsRecord.nom!,
                                                                                                                      maxLines: 2,
                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                            fontFamily: 'sf pro text',
                                                                                                                            fontSize: 16,
                                                                                                                            useGoogleFonts: false,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      '${dateTimeFormat(
                                                                                                                        'Hm',
                                                                                                                        rowProduitsRecord.ouv,
                                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                                      )} - ${dateTimeFormat(
                                                                                                                        'Hm',
                                                                                                                        rowProduitsRecord.clo,
                                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                                      )}',
                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                            fontFamily: 'sf pro text',
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                            useGoogleFonts: false,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                              Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Expanded(
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                                      child: Text(
                                                                                                                        () {
                                                                                                                          if (rowProduitsRecord.multi == false) {
                                                                                                                            return '${functions.multippl(rowProduitsRecord.prix!, FFAppState().qty).toString()} FCFA';
                                                                                                                          } else if ((rowProduitsRecord.multi == true) && (FFAppState().prixDefaut == false)) {
                                                                                                                            return '${functions.multippl(rowProduitsRecord.prixComplet!, FFAppState().qty).toString()} FCFA';
                                                                                                                          } else {
                                                                                                                            return '${functions.multippl(rowProduitsRecord.prixDemi!, FFAppState().qty).toString()} FCFA';
                                                                                                                          }
                                                                                                                        }(),
                                                                                                                        textAlign: TextAlign.start,
                                                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                              fontFamily: 'sf pro text',
                                                                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                              fontSize: 18,
                                                                                                                              fontWeight: FontWeight.bold,
                                                                                                                              useGoogleFonts: false,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }),
                                                                            );
                                                                          },
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
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(0, 16,
                                                                  0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        0,
                                                                        10,
                                                                        0),
                                                            child: Container(
                                                              width: 140,
                                                              height: 40,
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxWidth: 160,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary400,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50),
                                                              ),
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  GoRouter.of(
                                                                          context)
                                                                      .prepareAuthEvent();
                                                                  await signOut();

                                                                  context.goNamedAuth(
                                                                      'Onboarding1',
                                                                      mounted);
                                                                },
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    FlutterFlowIconButton(
                                                                      borderColor:
                                                                          Colors.transparent,
                                                                      borderRadius:
                                                                          50,
                                                                      borderWidth:
                                                                          1,
                                                                      buttonSize:
                                                                          40,
                                                                      fillColor:
                                                                          Color(0xFF109C89),
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .logout,
                                                                        color:
                                                                            Colors.white,
                                                                        size:
                                                                            20,
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        print(
                                                                            'IconButton pressed ...');
                                                                      },
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8,
                                                                            0,
                                                                            8,
                                                                            0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: InkWell(
                                                                                onTap: () async {
                                                                                  GoRouter.of(context).prepareAuthEvent();
                                                                                  await signOut();

                                                                                  context.goNamedAuth('Onboarding1', mounted);
                                                                                },
                                                                                child: Text(
                                                                                  'Déconnexion',
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'sf pro text',
                                                                                        color: Colors.white,
                                                                                        fontSize: 12,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                ),
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
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 20, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: 100,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.97,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .only(
                                                            bottomLeft: Radius
                                                                .circular(0),
                                                            bottomRight:
                                                                Radius
                                                                    .circular(
                                                                        0),
                                                            topLeft: Radius
                                                                .circular(60),
                                                            topRight: Radius
                                                                .circular(0),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0,
                                                                      40,
                                                                      0,
                                                                      0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.55,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.97,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0x00272B50),
                                                                ),
                                                                child:
                                                                    Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          100),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize.max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              30,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize: MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: SelectionArea(
                                                                                    child: Text(
                                                                                  'Paiement',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'sf pro text',
                                                                                        fontSize: 16,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                )),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        StreamBuilder<
                                                                            List<PanierRecord>>(
                                                                          stream:
                                                                              queryPanierRecord(
                                                                            parent: currentUserReference,
                                                                            queryBuilder: (panierRecord) => panierRecord.whereIn('ref', FFAppState().panieRef),
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 20,
                                                                                  height: 20,
                                                                                  child: SpinKitPulse(
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    size: 20,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            List<PanierRecord> containerPanierRecordList = snapshot.data!;
                                                                            return Container(
                                                                              width: double.infinity,
                                                                              constraints: BoxConstraints(
                                                                                maxWidth: 500,
                                                                              ),
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0x00272B50),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 35),
                                                                                child: SingleChildScrollView(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                                                                        child: Container(
                                                                                          width: MediaQuery.of(context).size.width,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0x00FFFFFF),
                                                                                            borderRadius: BorderRadius.circular(15),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 5),
                                                                                            child: Builder(
                                                                                              builder: (context) {
                                                                                                final panChild = FFAppState().panieRef.toList();
                                                                                                return SingleChildScrollView(
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                                    children: List.generate(panChild.length, (panChildIndex) {
                                                                                                      final panChildItem = panChild[panChildIndex];
                                                                                                      return Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 4),
                                                                                                        child: Container(
                                                                                                          width: MediaQuery.of(context).size.width,
                                                                                                          height: 130,
                                                                                                          constraints: BoxConstraints(
                                                                                                            maxWidth: 500,
                                                                                                          ),
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                                                                                                            child: StreamBuilder<PanierRecord>(
                                                                                                              stream: PanierRecord.getDocument(panChildItem),
                                                                                                              builder: (context, snapshot) {
                                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                                if (!snapshot.hasData) {
                                                                                                                  return Center(
                                                                                                                    child: SizedBox(
                                                                                                                      width: 20,
                                                                                                                      height: 20,
                                                                                                                      child: SpinKitPulse(
                                                                                                                        color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                        size: 20,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                }
                                                                                                                final rowPanierRecord = snapshot.data!;
                                                                                                                return Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      child: Container(
                                                                                                                        height: MediaQuery.of(context).size.height * 1,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: Color(0x00FFFFFF),
                                                                                                                        ),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                          children: [
                                                                                                                            Expanded(
                                                                                                                              child: Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                                                                child: Container(
                                                                                                                                  width: MediaQuery.of(context).size.width * 0.5,
                                                                                                                                  height: double.infinity,
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    color: Color(0x00FFFFFF),
                                                                                                                                  ),
                                                                                                                                  child: Column(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                    children: [
                                                                                                                                      Row(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        children: [
                                                                                                                                          StreamBuilder<ProduitsRecord>(
                                                                                                                                            stream: ProduitsRecord.getDocument(rowPanierRecord.prodRef!),
                                                                                                                                            builder: (context, snapshot) {
                                                                                                                                              // Customize what your widget looks like when it's loading.
                                                                                                                                              if (!snapshot.hasData) {
                                                                                                                                                return Center(
                                                                                                                                                  child: SizedBox(
                                                                                                                                                    width: 20,
                                                                                                                                                    height: 20,
                                                                                                                                                    child: SpinKitPulse(
                                                                                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                                                      size: 20,
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                );
                                                                                                                                              }
                                                                                                                                              final textProduitsRecord = snapshot.data!;
                                                                                                                                              return Text(
                                                                                                                                                'Nom:',
                                                                                                                                                maxLines: 2,
                                                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                      fontFamily: 'sf pro text',
                                                                                                                                                      fontSize: 16,
                                                                                                                                                      useGoogleFonts: false,
                                                                                                                                                    ),
                                                                                                                                              );
                                                                                                                                            },
                                                                                                                                          ),
                                                                                                                                          Expanded(
                                                                                                                                            flex: 2,
                                                                                                                                            child: StreamBuilder<ProduitsRecord>(
                                                                                                                                              stream: ProduitsRecord.getDocument(rowPanierRecord.prodRef!),
                                                                                                                                              builder: (context, snapshot) {
                                                                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                                                                if (!snapshot.hasData) {
                                                                                                                                                  return Center(
                                                                                                                                                    child: SizedBox(
                                                                                                                                                      width: 20,
                                                                                                                                                      height: 20,
                                                                                                                                                      child: SpinKitPulse(
                                                                                                                                                        color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                                                        size: 20,
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                  );
                                                                                                                                                }
                                                                                                                                                final textProduitsRecord = snapshot.data!;
                                                                                                                                                return Text(
                                                                                                                                                  textProduitsRecord.nom!,
                                                                                                                                                  textAlign: TextAlign.end,
                                                                                                                                                  maxLines: 2,
                                                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                        fontFamily: 'sf pro text',
                                                                                                                                                        fontSize: 16,
                                                                                                                                                        useGoogleFonts: false,
                                                                                                                                                      ),
                                                                                                                                                );
                                                                                                                                              },
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                      Padding(
                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                                                                                                                                        child: StreamBuilder<ProduitsRecord>(
                                                                                                                                          stream: ProduitsRecord.getDocument(rowPanierRecord.prodRef!),
                                                                                                                                          builder: (context, snapshot) {
                                                                                                                                            // Customize what your widget looks like when it's loading.
                                                                                                                                            if (!snapshot.hasData) {
                                                                                                                                              return Center(
                                                                                                                                                child: SizedBox(
                                                                                                                                                  width: 20,
                                                                                                                                                  height: 20,
                                                                                                                                                  child: SpinKitPulse(
                                                                                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                                                    size: 20,
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              );
                                                                                                                                            }
                                                                                                                                            final rowProduitsRecord = snapshot.data!;
                                                                                                                                            return Row(
                                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                              children: [
                                                                                                                                                Padding(
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                                                                                                                                                  child: Text(
                                                                                                                                                    'Quantité',
                                                                                                                                                    textAlign: TextAlign.center,
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                          fontFamily: 'sf pro text',
                                                                                                                                                          fontSize: 18,
                                                                                                                                                          useGoogleFonts: false,
                                                                                                                                                        ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                                Padding(
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                                                                                                                                                  child: Text(
                                                                                                                                                    rowPanierRecord.qty!.toString(),
                                                                                                                                                    textAlign: TextAlign.center,
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                          fontFamily: 'sf pro text',
                                                                                                                                                          fontSize: 18,
                                                                                                                                                          useGoogleFonts: false,
                                                                                                                                                        ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ],
                                                                                                                                            );
                                                                                                                                          },
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      Row(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                        children: [
                                                                                                                                          Expanded(
                                                                                                                                            child: Padding(
                                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
                                                                                                                                              child: StreamBuilder<ProduitsRecord>(
                                                                                                                                                stream: ProduitsRecord.getDocument(rowPanierRecord.prodRef!),
                                                                                                                                                builder: (context, snapshot) {
                                                                                                                                                  // Customize what your widget looks like when it's loading.
                                                                                                                                                  if (!snapshot.hasData) {
                                                                                                                                                    return Center(
                                                                                                                                                      child: SizedBox(
                                                                                                                                                        width: 20,
                                                                                                                                                        height: 20,
                                                                                                                                                        child: SpinKitPulse(
                                                                                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                                                          size: 20,
                                                                                                                                                        ),
                                                                                                                                                      ),
                                                                                                                                                    );
                                                                                                                                                  }
                                                                                                                                                  final textProduitsRecord = snapshot.data!;
                                                                                                                                                  return Text(
                                                                                                                                                    rowPanierRecord.type!,
                                                                                                                                                    textAlign: TextAlign.start,
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                          fontFamily: 'sf pro text',
                                                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                          fontSize: 13,
                                                                                                                                                          fontWeight: FontWeight.bold,
                                                                                                                                                          useGoogleFonts: false,
                                                                                                                                                        ),
                                                                                                                                                  );
                                                                                                                                                },
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                          Expanded(
                                                                                                                                            child: Padding(
                                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                                                              child: StreamBuilder<ProduitsRecord>(
                                                                                                                                                stream: ProduitsRecord.getDocument(rowPanierRecord.prodRef!),
                                                                                                                                                builder: (context, snapshot) {
                                                                                                                                                  // Customize what your widget looks like when it's loading.
                                                                                                                                                  if (!snapshot.hasData) {
                                                                                                                                                    return Center(
                                                                                                                                                      child: SizedBox(
                                                                                                                                                        width: 20,
                                                                                                                                                        height: 20,
                                                                                                                                                        child: SpinKitPulse(
                                                                                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                                                          size: 20,
                                                                                                                                                        ),
                                                                                                                                                      ),
                                                                                                                                                    );
                                                                                                                                                  }
                                                                                                                                                  final textProduitsRecord = snapshot.data!;
                                                                                                                                                  return Text(
                                                                                                                                                    '${functions.reduce(() {
                                                                                                                                                      if (rowPanierRecord.type == 'simple') {
                                                                                                                                                        return functions.multippl(textProduitsRecord.prix!, rowPanierRecord.qty!);
                                                                                                                                                      } else if (rowPanierRecord.type == 'plat complet') {
                                                                                                                                                        return functions.multippl(textProduitsRecord.prixComplet!, rowPanierRecord.qty!);
                                                                                                                                                      } else {
                                                                                                                                                        return functions.multippl(textProduitsRecord.prixDemi!, rowPanierRecord.qty!);
                                                                                                                                                      }
                                                                                                                                                    }(), textProduitsRecord.pourcentage!).toString()} FCFA',
                                                                                                                                                    textAlign: TextAlign.end,
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                          fontFamily: 'sf pro text',
                                                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                          fontSize: 18,
                                                                                                                                                          fontWeight: FontWeight.bold,
                                                                                                                                                          useGoogleFonts: false,
                                                                                                                                                        ),
                                                                                                                                                  );
                                                                                                                                                },
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ],
                                                                                                                                      ),
                                                                                                                                      Padding(
                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 10),
                                                                                                                                        child: Container(
                                                                                                                                          width: double.infinity,
                                                                                                                                          height: 1,
                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                );
                                                                                                              },
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    }),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(30, 0, 20, 0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
                                                                                                child: Text(
                                                                                                  'Sous Total',
                                                                                                  textAlign: TextAlign.start,
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'sf pro text',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 16,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                        useGoogleFonts: false,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                child: Text(
                                                                                                  '${functions.subtotal(containerPanierRecordList.map((e) => e.mt).withoutNulls.toList()).toString()} FCFA',
                                                                                                  textAlign: TextAlign.end,
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'sf pro text',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 18,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                        useGoogleFonts: false,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(30, 10, 20, 0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
                                                                                                child: Text(
                                                                                                  'Jour de livraison',
                                                                                                  textAlign: TextAlign.start,
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'sf pro text',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 16,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                        useGoogleFonts: false,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                child: StreamBuilder<PrecommandeRecord>(
                                                                                                  stream: PrecommandeRecord.getDocument(widget.refComm!),
                                                                                                  builder: (context, snapshot) {
                                                                                                    // Customize what your widget looks like when it's loading.
                                                                                                    if (!snapshot.hasData) {
                                                                                                      return Center(
                                                                                                        child: SizedBox(
                                                                                                          width: 20,
                                                                                                          height: 20,
                                                                                                          child: SpinKitPulse(
                                                                                                            color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                            size: 20,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    }
                                                                                                    final textPrecommandeRecord = snapshot.data!;
                                                                                                    return Text(
                                                                                                      dateTimeFormat(
                                                                                                        'd/M H:mm',
                                                                                                        textPrecommandeRecord.date!,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      ),
                                                                                                      textAlign: TextAlign.end,
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                            fontFamily: 'sf pro text',
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontSize: 18,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            useGoogleFonts: false,
                                                                                                          ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(30, 10, 20, 0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
                                                                                                child: Text(
                                                                                                  'Frais Livraison',
                                                                                                  textAlign: TextAlign.start,
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'sf pro text',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 16,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                        useGoogleFonts: false,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                child: StreamBuilder<List<FraisLivraisonRecord>>(
                                                                                                  stream: queryFraisLivraisonRecord(
                                                                                                    singleRecord: true,
                                                                                                  ),
                                                                                                  builder: (context, snapshot) {
                                                                                                    // Customize what your widget looks like when it's loading.
                                                                                                    if (!snapshot.hasData) {
                                                                                                      return Center(
                                                                                                        child: SizedBox(
                                                                                                          width: 20,
                                                                                                          height: 20,
                                                                                                          child: SpinKitPulse(
                                                                                                            color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                            size: 20,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    }
                                                                                                    List<FraisLivraisonRecord> textFraisLivraisonRecordList = snapshot.data!;
                                                                                                    final textFraisLivraisonRecord = textFraisLivraisonRecordList.isNotEmpty ? textFraisLivraisonRecordList.first : null;
                                                                                                    return Text(
                                                                                                      '${functions.livreSup(containerPanierRecordList.length, textFraisLivraisonRecord!.nom!, stackUsersRecord.abonnLivraison!).toString()} FCFA',
                                                                                                      textAlign: TextAlign.end,
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                            fontFamily: 'sf pro text',
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontSize: 18,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            useGoogleFonts: false,
                                                                                                          ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(30, 10, 20, 0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
                                                                                                child: Text(
                                                                                                  'Total',
                                                                                                  textAlign: TextAlign.start,
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'sf pro text',
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 28,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                        useGoogleFonts: false,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                child: StreamBuilder<List<FraisLivraisonRecord>>(
                                                                                                  stream: queryFraisLivraisonRecord(
                                                                                                    singleRecord: true,
                                                                                                  ),
                                                                                                  builder: (context, snapshot) {
                                                                                                    // Customize what your widget looks like when it's loading.
                                                                                                    if (!snapshot.hasData) {
                                                                                                      return Center(
                                                                                                        child: SizedBox(
                                                                                                          width: 20,
                                                                                                          height: 20,
                                                                                                          child: SpinKitPulse(
                                                                                                            color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                            size: 20,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    }
                                                                                                    List<FraisLivraisonRecord> textFraisLivraisonRecordList = snapshot.data!;
                                                                                                    final textFraisLivraisonRecord = textFraisLivraisonRecordList.isNotEmpty ? textFraisLivraisonRecordList.first : null;
                                                                                                    return Text(
                                                                                                      '${functions.ttc(functions.subtotal(containerPanierRecordList.map((e) => e.mt).withoutNulls.toList()), functions.livreSup(containerPanierRecordList.length, textFraisLivraisonRecord!.nom!, stackUsersRecord.abonnLivraison!)).toString()} FCFA',
                                                                                                      textAlign: TextAlign.end,
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                            fontFamily: 'sf pro text',
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontSize: 22,
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            useGoogleFonts: false,
                                                                                                          ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Form(
                                                                                        key: formKey2,
                                                                                        autovalidateMode: AutovalidateMode.disabled,
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(30, 0, 20, 0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                                                                                      child: FlutterFlowPlacePicker(
                                                                                                        iOSGoogleMapsApiKey: 'AIzaSyCRGKk3dJAAsplwPXQ2Vnnlg07i28ERsb8',
                                                                                                        androidGoogleMapsApiKey: 'AIzaSyBssFwtKUm1SeYwXoX2mcHCqrGez2r6eP4',
                                                                                                        webGoogleMapsApiKey: 'AIzaSyB5sjnjOQ2_0K76Dm8zJRa6N5KQ1sCeuJI',
                                                                                                        onSelect: (place) async {
                                                                                                          setState(() => placePickerValue = place);
                                                                                                        },
                                                                                                        defaultText: 'Choisir une destination',
                                                                                                        icon: Icon(
                                                                                                          Icons.place,
                                                                                                          color: Colors.white,
                                                                                                          size: 16,
                                                                                                        ),
                                                                                                        buttonOptions: FFButtonOptions(
                                                                                                          width: 200,
                                                                                                          height: 40,
                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                          textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                                fontFamily: 'sf pro text',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                useGoogleFonts: false,
                                                                                                              ),
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            width: 2,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(12),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            if (placePickerValue != null)
                                                                                              StreamBuilder<UsersRecord>(
                                                                                                stream: UsersRecord.getDocument(currentUserReference!),
                                                                                                builder: (context, snapshot) {
                                                                                                  // Customize what your widget looks like when it's loading.
                                                                                                  if (!snapshot.hasData) {
                                                                                                    return Center(
                                                                                                      child: SizedBox(
                                                                                                        width: 20,
                                                                                                        height: 20,
                                                                                                        child: SpinKitPulse(
                                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                          size: 20,
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  }
                                                                                                  final columnUsersRecord = snapshot.data!;
                                                                                                  return Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(30, 16, 20, 0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Expanded(
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                                                child: TextFormField(
                                                                                                                  controller: textController5,
                                                                                                                  onFieldSubmitted: (_) async {
                                                                                                                    FFAppState().update(() {
                                                                                                                      FFAppState().indication = textController5!.text;
                                                                                                                    });
                                                                                                                  },
                                                                                                                  autofocus: true,
                                                                                                                  obscureText: false,
                                                                                                                  decoration: InputDecoration(
                                                                                                                    hintText: 'Courte indication',
                                                                                                                    hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                                          fontFamily: 'sf pro text',
                                                                                                                          fontSize: 16,
                                                                                                                          useGoogleFonts: false,
                                                                                                                        ),
                                                                                                                    enabledBorder: OutlineInputBorder(
                                                                                                                      borderSide: BorderSide(
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        width: 2,
                                                                                                                      ),
                                                                                                                      borderRadius: BorderRadius.circular(20),
                                                                                                                    ),
                                                                                                                    focusedBorder: OutlineInputBorder(
                                                                                                                      borderSide: BorderSide(
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        width: 2,
                                                                                                                      ),
                                                                                                                      borderRadius: BorderRadius.circular(20),
                                                                                                                    ),
                                                                                                                    errorBorder: OutlineInputBorder(
                                                                                                                      borderSide: BorderSide(
                                                                                                                        color: Color(0x00000000),
                                                                                                                        width: 2,
                                                                                                                      ),
                                                                                                                      borderRadius: BorderRadius.circular(20),
                                                                                                                    ),
                                                                                                                    focusedErrorBorder: OutlineInputBorder(
                                                                                                                      borderSide: BorderSide(
                                                                                                                        color: Color(0x00000000),
                                                                                                                        width: 2,
                                                                                                                      ),
                                                                                                                      borderRadius: BorderRadius.circular(20),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                        fontFamily: 'sf pro text',
                                                                                                                        fontSize: 18,
                                                                                                                        useGoogleFonts: false,
                                                                                                                        lineHeight: 2,
                                                                                                                      ),
                                                                                                                  maxLines: 5,
                                                                                                                  validator: (val) {
                                                                                                                    if (val == null || val.isEmpty) {
                                                                                                                      return 'Field is required';
                                                                                                                    }

                                                                                                                    return null;
                                                                                                                  },
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(30, 16, 20, 0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            FlutterFlowDropDown<String>(
                                                                                                              initialOption: dropDownValue1 ??= '+229',
                                                                                                              options: ['+229'],
                                                                                                              onChanged: (val) => setState(() => dropDownValue1 = val),
                                                                                                              width: 120,
                                                                                                              height: 60,
                                                                                                              textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                    fontFamily: 'sf pro text',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 24,
                                                                                                                    useGoogleFonts: false,
                                                                                                                  ),
                                                                                                              hintText: 'Votre Opérateur Réseau',
                                                                                                              icon: Icon(
                                                                                                                Icons.arrow_drop_down,
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                size: 30,
                                                                                                              ),
                                                                                                              fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                              elevation: 2,
                                                                                                              borderColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                              borderWidth: 2,
                                                                                                              borderRadius: 10,
                                                                                                              margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                                                                                                              hidesUnderline: true,
                                                                                                            ),
                                                                                                            Expanded(
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                                                child: TextFormField(
                                                                                                                  controller: textController6,
                                                                                                                  autofocus: true,
                                                                                                                  obscureText: false,
                                                                                                                  decoration: InputDecoration(
                                                                                                                    hintText: 'Numéro MOMO',
                                                                                                                    hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                                          fontFamily: 'sf pro text',
                                                                                                                          fontSize: 16,
                                                                                                                          useGoogleFonts: false,
                                                                                                                        ),
                                                                                                                    enabledBorder: UnderlineInputBorder(
                                                                                                                      borderSide: BorderSide(
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        width: 2,
                                                                                                                      ),
                                                                                                                      borderRadius: const BorderRadius.only(
                                                                                                                        topLeft: Radius.circular(4.0),
                                                                                                                        topRight: Radius.circular(4.0),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    focusedBorder: UnderlineInputBorder(
                                                                                                                      borderSide: BorderSide(
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        width: 2,
                                                                                                                      ),
                                                                                                                      borderRadius: const BorderRadius.only(
                                                                                                                        topLeft: Radius.circular(4.0),
                                                                                                                        topRight: Radius.circular(4.0),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    errorBorder: UnderlineInputBorder(
                                                                                                                      borderSide: BorderSide(
                                                                                                                        color: Color(0x00000000),
                                                                                                                        width: 2,
                                                                                                                      ),
                                                                                                                      borderRadius: const BorderRadius.only(
                                                                                                                        topLeft: Radius.circular(4.0),
                                                                                                                        topRight: Radius.circular(4.0),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    focusedErrorBorder: UnderlineInputBorder(
                                                                                                                      borderSide: BorderSide(
                                                                                                                        color: Color(0x00000000),
                                                                                                                        width: 2,
                                                                                                                      ),
                                                                                                                      borderRadius: const BorderRadius.only(
                                                                                                                        topLeft: Radius.circular(4.0),
                                                                                                                        topRight: Radius.circular(4.0),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                        fontFamily: 'sf pro text',
                                                                                                                        fontSize: 18,
                                                                                                                        useGoogleFonts: false,
                                                                                                                        lineHeight: 2,
                                                                                                                      ),
                                                                                                                  validator: (val) {
                                                                                                                    if (val == null || val.isEmpty) {
                                                                                                                      return 'Field is required';
                                                                                                                    }

                                                                                                                    return null;
                                                                                                                  },
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(30, 16, 20, 0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Expanded(
                                                                                                              child: FlutterFlowDropDown<String>(
                                                                                                                initialOption: reseauValue ??= valueOrDefault<String>(
                                                                                                                  FFAppState().reseau,
                                                                                                                  'mtn',
                                                                                                                ),
                                                                                                                options: ['mtn', 'moov'],
                                                                                                                onChanged: (val) => setState(() => reseauValue = val),
                                                                                                                width: 180,
                                                                                                                height: 60,
                                                                                                                textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                      fontFamily: 'sf pro text',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 24,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                                hintText: 'Votre Opérateur Réseau',
                                                                                                                icon: Icon(
                                                                                                                  Icons.arrow_drop_down,
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  size: 30,
                                                                                                                ),
                                                                                                                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                elevation: 2,
                                                                                                                borderColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                borderWidth: 2,
                                                                                                                borderRadius: 10,
                                                                                                                margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                                                                                                                hidesUnderline: true,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(30, 16, 20, 0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            FlutterFlowDropDown<String>(
                                                                                                              initialOption: dropDownValue2 ??= '+229',
                                                                                                              options: ['+229'],
                                                                                                              onChanged: (val) => setState(() => dropDownValue2 = val),
                                                                                                              width: 120,
                                                                                                              height: 60,
                                                                                                              textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                    fontFamily: 'sf pro text',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    fontSize: 24,
                                                                                                                    useGoogleFonts: false,
                                                                                                                  ),
                                                                                                              hintText: 'Votre Opérateur Réseau',
                                                                                                              icon: Icon(
                                                                                                                Icons.arrow_drop_down,
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                size: 30,
                                                                                                              ),
                                                                                                              fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                              elevation: 2,
                                                                                                              borderColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                              borderWidth: 2,
                                                                                                              borderRadius: 10,
                                                                                                              margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                                                                                                              hidesUnderline: true,
                                                                                                            ),
                                                                                                            Expanded(
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                                                child: TextFormField(
                                                                                                                  controller: textController7,
                                                                                                                  autofocus: true,
                                                                                                                  obscureText: false,
                                                                                                                  decoration: InputDecoration(
                                                                                                                    hintText: 'Numéro  Joignable',
                                                                                                                    hintStyle: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                                          fontFamily: 'sf pro text',
                                                                                                                          fontSize: 16,
                                                                                                                          useGoogleFonts: false,
                                                                                                                        ),
                                                                                                                    enabledBorder: UnderlineInputBorder(
                                                                                                                      borderSide: BorderSide(
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        width: 2,
                                                                                                                      ),
                                                                                                                      borderRadius: const BorderRadius.only(
                                                                                                                        topLeft: Radius.circular(4.0),
                                                                                                                        topRight: Radius.circular(4.0),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    focusedBorder: UnderlineInputBorder(
                                                                                                                      borderSide: BorderSide(
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        width: 2,
                                                                                                                      ),
                                                                                                                      borderRadius: const BorderRadius.only(
                                                                                                                        topLeft: Radius.circular(4.0),
                                                                                                                        topRight: Radius.circular(4.0),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    errorBorder: UnderlineInputBorder(
                                                                                                                      borderSide: BorderSide(
                                                                                                                        color: Color(0x00000000),
                                                                                                                        width: 2,
                                                                                                                      ),
                                                                                                                      borderRadius: const BorderRadius.only(
                                                                                                                        topLeft: Radius.circular(4.0),
                                                                                                                        topRight: Radius.circular(4.0),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    focusedErrorBorder: UnderlineInputBorder(
                                                                                                                      borderSide: BorderSide(
                                                                                                                        color: Color(0x00000000),
                                                                                                                        width: 2,
                                                                                                                      ),
                                                                                                                      borderRadius: const BorderRadius.only(
                                                                                                                        topLeft: Radius.circular(4.0),
                                                                                                                        topRight: Radius.circular(4.0),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                        fontFamily: 'sf pro text',
                                                                                                                        fontSize: 18,
                                                                                                                        useGoogleFonts: false,
                                                                                                                        lineHeight: 2,
                                                                                                                      ),
                                                                                                                  validator: (val) {
                                                                                                                    if (val == null || val.isEmpty) {
                                                                                                                      return 'Field is required';
                                                                                                                    }

                                                                                                                    return null;
                                                                                                                  },
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(30, 0, 20, 0),
                                                                                                        child: StreamBuilder<List<FraisLivraisonRecord>>(
                                                                                                          stream: queryFraisLivraisonRecord(
                                                                                                            singleRecord: true,
                                                                                                          ),
                                                                                                          builder: (context, snapshot) {
                                                                                                            // Customize what your widget looks like when it's loading.
                                                                                                            if (!snapshot.hasData) {
                                                                                                              return Center(
                                                                                                                child: SizedBox(
                                                                                                                  width: 20,
                                                                                                                  height: 20,
                                                                                                                  child: SpinKitPulse(
                                                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                    size: 20,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            }
                                                                                                            List<FraisLivraisonRecord> rowFraisLivraisonRecordList = snapshot.data!;
                                                                                                            final rowFraisLivraisonRecord = rowFraisLivraisonRecordList.isNotEmpty ? rowFraisLivraisonRecordList.first : null;
                                                                                                            return Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Expanded(
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                                                                                                    child: StreamBuilder<PrecommandeRecord>(
                                                                                                                      stream: PrecommandeRecord.getDocument(widget.refComm!),
                                                                                                                      builder: (context, snapshot) {
                                                                                                                        // Customize what your widget looks like when it's loading.
                                                                                                                        if (!snapshot.hasData) {
                                                                                                                          return Center(
                                                                                                                            child: SizedBox(
                                                                                                                              width: 20,
                                                                                                                              height: 20,
                                                                                                                              child: SpinKitPulse(
                                                                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                                size: 20,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          );
                                                                                                                        }
                                                                                                                        final button111PrecommandeRecord = snapshot.data!;
                                                                                                                        return FFButtonWidget(
                                                                                                                          onPressed: () async {
                                                                                                                            currentUserLocationValue = await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
                                                                                                                            if (formKey2.currentState == null || !formKey2.currentState!.validate()) {
                                                                                                                              return;
                                                                                                                            }

                                                                                                                            if (dropDownValue1 == null) {
                                                                                                                              return;
                                                                                                                            }
                                                                                                                            if (reseauValue == null) {
                                                                                                                              return;
                                                                                                                            }
                                                                                                                            if (dropDownValue2 == null) {
                                                                                                                              return;
                                                                                                                            }

                                                                                                                            if (placePickerValue == FFPlace()) {
                                                                                                                              return;
                                                                                                                            }

                                                                                                                            apiResulty73 = await TransactionGenererCall.call(
                                                                                                                              description: button111PrecommandeRecord.nom,
                                                                                                                              amount: functions.ttc(functions.subtotal(containerPanierRecordList.map((e) => e.mt).withoutNulls.toList()), functions.livreSup(containerPanierRecordList.length, rowFraisLivraisonRecord!.nom!, columnUsersRecord.abonnLivraison!)).toString(),
                                                                                                                              currency: 'XOF',
                                                                                                                              callbackUrl: 'https://maplateforme.com/callback',
                                                                                                                              firstname: columnUsersRecord.prenom,
                                                                                                                              lastname: columnUsersRecord.nom,
                                                                                                                              email: currentUserEmail,
                                                                                                                              number: functions.phone(dropDownValue1!, textController6!.text),
                                                                                                                              country: 'bj',
                                                                                                                            );
                                                                                                                            if (!(apiResulty73?.succeeded ?? true)) {
                                                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                                SnackBar(
                                                                                                                                  content: Text(
                                                                                                                                    'Vérifiez votre numéro momo ou fonds insuffisants',
                                                                                                                                    style: TextStyle(
                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  duration: Duration(milliseconds: 4000),
                                                                                                                                  backgroundColor: FlutterFlowTheme.of(context).tertiary400,
                                                                                                                                ),
                                                                                                                              );
                                                                                                                            }
                                                                                                                            apiResultldm = await TransactionsTokenCall.call(
                                                                                                                              id: getJsonField(
                                                                                                                                (apiResulty73?.jsonBody ?? ''),
                                                                                                                                r'''$..id''',
                                                                                                                              ).toString(),
                                                                                                                            );
                                                                                                                            apiResultyz8 = await PaiementSansRediCall.call(
                                                                                                                              token: getJsonField(
                                                                                                                                (apiResultldm?.jsonBody ?? ''),
                                                                                                                                r'''$.token''',
                                                                                                                              ).toString(),
                                                                                                                              moyensPaie: reseauValue,
                                                                                                                            );
                                                                                                                            apiResult0fd = await StatutCall.call(
                                                                                                                              id: getJsonField(
                                                                                                                                (apiResulty73?.jsonBody ?? ''),
                                                                                                                                r'''$..id''',
                                                                                                                              ).toString(),
                                                                                                                            );
                                                                                                                            if (getJsonField(
                                                                                                                                  (apiResult0fd?.jsonBody ?? ''),
                                                                                                                                  r'''$..status''',
                                                                                                                                ) ==
                                                                                                                                getJsonField(
                                                                                                                                  FFAppState().statuspaiement,
                                                                                                                                  r'''$..status''',
                                                                                                                                )) {
                                                                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                                SnackBar(
                                                                                                                                  content: Text(
                                                                                                                                    'Payé avecsuccès',
                                                                                                                                    style: TextStyle(
                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  duration: Duration(milliseconds: 4000),
                                                                                                                                  backgroundColor: FlutterFlowTheme.of(context).tertiary400,
                                                                                                                                ),
                                                                                                                              );

                                                                                                                              final precommandeUpdateData = createPrecommandeRecordData(
                                                                                                                                statut: 'Payé',
                                                                                                                                totalpaye: functions.ttc(functions.subtotal(containerPanierRecordList.map((e) => e.mt).withoutNulls.toList()), functions.livreSup(containerPanierRecordList.length, rowFraisLivraisonRecord!.nom!, columnUsersRecord.abonnLivraison!)),
                                                                                                                                datepay: getCurrentTimestamp,
                                                                                                                                numero: functions.phone(dropDownValue2!, textController7!.text),
                                                                                                                                lieu: placePickerValue.name,
                                                                                                                                e1: true,
                                                                                                                                e2: false,
                                                                                                                                e3: false,
                                                                                                                                e4: false,
                                                                                                                                e5: false,
                                                                                                                                indication: textController5!.text,
                                                                                                                                livrer: false,
                                                                                                                                attribution: false,
                                                                                                                                aboLivre: false,
                                                                                                                                lieu2: placePickerValue.latLng,
                                                                                                                                positionClient: currentUserLocationValue,
                                                                                                                              );
                                                                                                                              await widget.refComm!.update(precommandeUpdateData);
                                                                                                                              FFAppState().update(() {
                                                                                                                                FFAppState().commande = true;
                                                                                                                                FFAppState().paiementEtape = false;
                                                                                                                              });
                                                                                                                              FFAppState().update(() {
                                                                                                                                FFAppState().panieRef = [];
                                                                                                                              });
                                                                                                                              FFAppState().update(() {
                                                                                                                                FFAppState().indication = textController5!.text;
                                                                                                                                FFAppState().momo = textController6!.text;
                                                                                                                                FFAppState().reseau = reseauValue!;
                                                                                                                                FFAppState().joignable = textController7!.text;
                                                                                                                              });
                                                                                                                              FFAppState().update(() {
                                                                                                                                FFAppState().tabSimple = true;
                                                                                                                              });

                                                                                                                              context.goNamed('cart2');
                                                                                                                            }

                                                                                                                            setState(() {});
                                                                                                                          },
                                                                                                                          text: 'Payer Maintenant',
                                                                                                                          options: FFButtonOptions(
                                                                                                                            width: 130,
                                                                                                                            height: 50,
                                                                                                                            color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                            textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                                                  fontFamily: 'sf pro text',
                                                                                                                                  color: Colors.white,
                                                                                                                                  fontSize: 18,
                                                                                                                                  useGoogleFonts: false,
                                                                                                                                ),
                                                                                                                            borderSide: BorderSide(
                                                                                                                              color: Colors.transparent,
                                                                                                                              width: 1,
                                                                                                                            ),
                                                                                                                            borderRadius: BorderRadius.circular(8),
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      },
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            );
                                                                                                          },
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  width: 100,
                                                                  height: MediaQuery.of(context)
                                                                          .size
                                                                          .height *
                                                                      0.97,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x00272B50),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            12,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize.max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment.start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              20,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize: MainAxisSize.max,
                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                            children: [
                                                                              StreamBuilder<List<BanniereRecord>>(
                                                                                stream: queryBanniereRecord(
                                                                                  queryBuilder: (banniereRecord) => banniereRecord.orderBy('priorite', descending: true),
                                                                                  singleRecord: true,
                                                                                ),
                                                                                builder: (context, snapshot) {
                                                                                  // Customize what your widget looks like when it's loading.
                                                                                  if (!snapshot.hasData) {
                                                                                    return Center(
                                                                                      child: SizedBox(
                                                                                        width: 20,
                                                                                        height: 20,
                                                                                        child: SpinKitPulse(
                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                          size: 20,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                  List<BanniereRecord> containerBanniereRecordList = snapshot.data!;
                                                                                  // Return an empty Container when the item does not exist.
                                                                                  if (snapshot.data!.isEmpty) {
                                                                                    return Container();
                                                                                  }
                                                                                  final containerBanniereRecord = containerBanniereRecordList.isNotEmpty ? containerBanniereRecordList.first : null;
                                                                                  return InkWell(
                                                                                    onTap: () async {
                                                                                      FFAppState().update(() {
                                                                                        FFAppState().prixDefaut = true;
                                                                                        FFAppState().complet = false;
                                                                                      });
                                                                                      FFAppState().update(() {
                                                                                        FFAppState().refFav = null;
                                                                                        FFAppState().qty = 1;
                                                                                      });

                                                                                      final produitsUpdateData = {
                                                                                        'vue': FieldValue.increment(1),
                                                                                      };
                                                                                      await containerBanniereRecord!.lien!.update(produitsUpdateData);
                                                                                      await showModalBottomSheet(
                                                                                        isScrollControlled: true,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        context: context,
                                                                                        builder: (context) {
                                                                                          return Padding(
                                                                                            padding: MediaQuery.of(context).viewInsets,
                                                                                            child: Container(
                                                                                              height: MediaQuery.of(context).size.height * 1,
                                                                                              child: DetailWidget(
                                                                                                prodRef: containerBanniereRecord!.lien,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => setState(() {}));
                                                                                    },
                                                                                    child: Container(
                                                                                      width: 180,
                                                                                      height: 100,
                                                                                      constraints: BoxConstraints(
                                                                                        maxWidth: 300,
                                                                                        maxHeight: 140,
                                                                                      ),
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        image: DecorationImage(
                                                                                          fit: BoxFit.fill,
                                                                                          image: Image.network(
                                                                                            containerBanniereRecord!.img!,
                                                                                          ).image,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(20),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              30,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize: MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                                                child: SelectionArea(
                                                                                    child: Text(
                                                                                  'Pour Vous',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'sf pro text',
                                                                                        fontSize: 16,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                )),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 100),
                                                                            child: StreamBuilder<List<ProduitsRecord>>(
                                                                              stream: queryProduitsRecord(
                                                                                queryBuilder: (produitsRecord) => produitsRecord.orderBy('vue', descending: true),
                                                                                limit: 10,
                                                                              ),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 20,
                                                                                      height: 20,
                                                                                      child: SpinKitPulse(
                                                                                        color: FlutterFlowTheme.of(context).primaryColor,
                                                                                        size: 20,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                List<ProduitsRecord> columnProduitsRecordList = snapshot.data!;
                                                                                return SingleChildScrollView(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: List.generate(columnProduitsRecordList.length, (columnIndex) {
                                                                                      final columnProduitsRecord = columnProduitsRecordList[columnIndex];
                                                                                      return Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                                        child: StreamBuilder<ProduitsRecord>(
                                                                                          stream: ProduitsRecord.getDocument(columnProduitsRecord.reference),
                                                                                          builder: (context, snapshot) {
                                                                                            // Customize what your widget looks like when it's loading.
                                                                                            if (!snapshot.hasData) {
                                                                                              return Center(
                                                                                                child: SizedBox(
                                                                                                  width: 20,
                                                                                                  height: 20,
                                                                                                  child: SpinKitPulse(
                                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                    size: 20,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }
                                                                                            final containerProduitsRecord = snapshot.data!;
                                                                                            return Container(
                                                                                              width: 180,
                                                                                              height: 230,
                                                                                              constraints: BoxConstraints(
                                                                                                maxWidth: 300,
                                                                                                maxHeight: 300,
                                                                                              ),
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                borderRadius: BorderRadius.circular(15),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(9, 9, 9, 9),
                                                                                                child: InkWell(
                                                                                                  onTap: () async {
                                                                                                    FFAppState().update(() {
                                                                                                      FFAppState().complet = false;
                                                                                                      FFAppState().refFav = null;
                                                                                                    });
                                                                                                    FFAppState().update(() {
                                                                                                      FFAppState().qty = 1;
                                                                                                    });

                                                                                                    final produitsUpdateData = {
                                                                                                      'vue': FieldValue.increment(1),
                                                                                                    };
                                                                                                    await containerProduitsRecord.reference.update(produitsUpdateData);
                                                                                                    await showModalBottomSheet(
                                                                                                      isScrollControlled: true,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      context: context,
                                                                                                      builder: (context) {
                                                                                                        return Padding(
                                                                                                          padding: MediaQuery.of(context).viewInsets,
                                                                                                          child: Container(
                                                                                                            height: MediaQuery.of(context).size.height * 1,
                                                                                                            child: DetailWidget(
                                                                                                              prodRef: containerProduitsRecord.reference,
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ).then((value) => setState(() {}));
                                                                                                  },
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: double.infinity,
                                                                                                        height: MediaQuery.of(context).size.height * 0.18,
                                                                                                        constraints: BoxConstraints(
                                                                                                          maxHeight: 120,
                                                                                                        ),
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          image: DecorationImage(
                                                                                                            fit: BoxFit.cover,
                                                                                                            image: Image.network(
                                                                                                              containerProduitsRecord.image!,
                                                                                                            ).image,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(15),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Expanded(
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Container(
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: Color(0x00FFFFFF),
                                                                                                                  ),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Expanded(
                                                                                                                        flex: 2,
                                                                                                                        child: Text(
                                                                                                                          containerProduitsRecord.nom!,
                                                                                                                          maxLines: 2,
                                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                fontFamily: 'sf pro text',
                                                                                                                                fontSize: 14,
                                                                                                                                useGoogleFonts: false,
                                                                                                                              ),
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
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            '${dateTimeFormat(
                                                                                                              'Hm',
                                                                                                              containerProduitsRecord.ouv,
                                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                                            )} - ${dateTimeFormat(
                                                                                                              'Hm',
                                                                                                              containerProduitsRecord.clo,
                                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                                            )}',
                                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                  fontFamily: 'sf pro text',
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  fontSize: 12,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                containerProduitsRecord.moyenne!.toString(),
                                                                                                                style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                                                                                                                child: Icon(
                                                                                                                  Icons.star_rate,
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  size: 20,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                          Container(
                                                                                                            constraints: BoxConstraints(
                                                                                                              maxWidth: 140,
                                                                                                            ),
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                              borderRadius: BorderRadius.circular(5),
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                                              child: Text(
                                                                                                                () {
                                                                                                                  if (containerProduitsRecord.multi == false) {
                                                                                                                    return '${functions.multippl(containerProduitsRecord.prix!, FFAppState().qty).toString()} FCFA';
                                                                                                                  } else if ((containerProduitsRecord.multi == true) && (FFAppState().prixDefaut == false)) {
                                                                                                                    return '${functions.multippl(containerProduitsRecord.prixComplet!, FFAppState().qty).toString()} FCFA';
                                                                                                                  } else {
                                                                                                                    return '${functions.multippl(containerProduitsRecord.prixDemi!, FFAppState().qty).toString()} FCFA';
                                                                                                                  }
                                                                                                                }(),
                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                      fontFamily: 'sf pro text',
                                                                                                                      color: Colors.white,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      );
                                                                                    }),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
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
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
