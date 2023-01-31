import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/detail_widget.dart';
import '../components/uuuiii_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:touch_mouse_behavior/touch_mouse_behavior.dart';


class AllHistoriqueLivraisonWidget extends StatefulWidget {
  const AllHistoriqueLivraisonWidget({Key? key}) : super(key: key);

  @override
  _AllHistoriqueLivraisonWidgetState createState() =>
      _AllHistoriqueLivraisonWidgetState();
}

class _AllHistoriqueLivraisonWidgetState
    extends State<AllHistoriqueLivraisonWidget> {
  List<ProduitsRecord>? algoliaSearchResults = [];
  TextEditingController? searchField232Controller;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'allHistoriqueLivraison'});
    searchField232Controller = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    searchField232Controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: TouchMouseScrollable(
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Visibility(
              visible:
                  valueOrDefault<bool>(currentUserDocument?.approuv, false) ==
                      true,
              child: AuthUserStreamWidget(
                builder: (context) => Stack(
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Align(
                        alignment: AlignmentDirectional(0, -5.65),
                        child: SingleChildScrollView(
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
                                        Icons.arrow_back_ios_sharp,
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
                                        'Historique',
                                        style:
                                            FlutterFlowTheme.of(context).title1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0x00272B50),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 10, 0),
                                        child: Container(
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  1,
                                          decoration: BoxDecoration(
                                            color: Color(0x00272B50),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0),
                                              bottomRight: Radius.circular(0),
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30),
                                            ),
                                          ),
                                          child: DefaultTabController(
                                            length: 4,
                                            initialIndex: min(
                                                valueOrDefault<int>(
                                                  () {
                                                    if (FFAppState().tabSimple ==
                                                        true) {
                                                      return 1;
                                                    } else if (FFAppState()
                                                            .tabAbo ==
                                                        true) {
                                                      return 2;
                                                    } else if (FFAppState()
                                                            .tabR ==
                                                        true) {
                                                      return 3;
                                                    } else {
                                                      return 0;
                                                    }
                                                  }(),
                                                  0,
                                                ),
                                                3),
                                            child: Column(
                                              children: [
                                                TabBar(
                                                  isScrollable: true,
                                                  labelColor:
                                                      FlutterFlowTheme.of(context)
                                                          .primaryColor,
                                                  unselectedLabelColor:
                                                      FlutterFlowTheme.of(context)
                                                          .secondaryText,
                                                  labelStyle:
                                                      FlutterFlowTheme.of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'sf pro text',
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts: false,
                                                          ),
                                                  indicatorColor:
                                                      FlutterFlowTheme.of(context)
                                                          .primaryColor,
                                                  tabs: [
                                                    Tab(
                                                      text: 'Livrés',
                                                    ),
                                                    Tab(
                                                      text:
                                                          'En attente de livraison',
                                                    ),
                                                    Tab(
                                                      text: 'Payées',
                                                    ),
                                                    Tab(
                                                      text:
                                                          'En attente de paiement',
                                                    ),
                                                  ],
                                                ),
                                                Expanded(
                                                  child: TabBarView(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 20, 0, 5),
                                                        child: StreamBuilder<
                                                            List<
                                                                PrecommandeRecord>>(
                                                          stream:
                                                              queryPrecommandeRecord(
                                                            queryBuilder:
                                                                (precommandeRecord) =>
                                                                    precommandeRecord.where(
                                                                        'livrer',
                                                                        isEqualTo:
                                                                            true),
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
                                                            List<PrecommandeRecord>
                                                                columnPrecommandeRecordList =
                                                                snapshot.data!;
                                                            if (columnPrecommandeRecordList
                                                                .isEmpty) {
                                                              return Container(
                                                                width: 300,
                                                                child:
                                                                    UuuiiiWidget(),
                                                              );
                                                            }
                                                            return SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: List.generate(
                                                                    columnPrecommandeRecordList
                                                                        .length,
                                                                    (columnIndex) {
                                                                  final columnPrecommandeRecord =
                                                                      columnPrecommandeRecordList[
                                                                          columnIndex];
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            20),
                                                                    child: StreamBuilder<
                                                                        PrecommandeRecord>(
                                                                      stream: PrecommandeRecord.getDocument(
                                                                          columnPrecommandeRecord
                                                                              .reference),
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
                                                                        final columnPrecommandeRecord =
                                                                            snapshot
                                                                                .data!;
                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                                                  0,
                                                                                  0,
                                                                                  0,
                                                                                  18),
                                                                              child:
                                                                                  StreamBuilder<List<PanierRecord>>(
                                                                                stream: queryPanierRecord(
                                                                                  parent: columnPrecommandeRecord.refcli,
                                                                                  queryBuilder: (panierRecord) => panierRecord.whereIn('ref', columnPrecommandeRecord.listecom!.toList()),
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
                                                                                  List<PanierRecord> containerPanierRecordList = snapshot.data!;
                                                                                  // Return an empty Container when the item does not exist.
                                                                                  if (snapshot.data!.isEmpty) {
                                                                                    return Container();
                                                                                  }
                                                                                  final containerPanierRecord = containerPanierRecordList.isNotEmpty ? containerPanierRecordList.first : null;
                                                                                  return Container(
                                                                                    width: MediaQuery.of(context).size.width,
                                                                                    height: 130,
                                                                                    constraints: BoxConstraints(
                                                                                      maxWidth: 400,
                                                                                    ),
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.circular(15),
                                                                                    ),
                                                                                    child: StreamBuilder<PrecommandeRecord>(
                                                                                      stream: PrecommandeRecord.getDocument(columnPrecommandeRecord.reference),
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
                                                                                        final rowPrecommandeRecord = snapshot.data!;
                                                                                        return Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: StreamBuilder<ProduitsRecord>(
                                                                                                stream: ProduitsRecord.getDocument(containerPanierRecord!.prodRef!),
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
                                                                                                    height: MediaQuery.of(context).size.height * 1,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Color(0x00FFFFFF),
                                                                                                      image: DecorationImage(
                                                                                                        fit: BoxFit.cover,
                                                                                                        image: Image.network(
                                                                                                          containerProduitsRecord.image!,
                                                                                                        ).image,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(20),
                                                                                                    ),
                                                                                                    child: Container(
                                                                                                      width: 100,
                                                                                                      height: 100,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).customColor2,
                                                                                                        borderRadius: BorderRadius.circular(20),
                                                                                                      ),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                                                                                                              child: Container(
                                                                                                                width: MediaQuery.of(context).size.width * 0.5,
                                                                                                                height: double.infinity,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: Color(0x00FFFFFF),
                                                                                                                ),
                                                                                                                child: InkWell(
                                                                                                                  onTap: () async {
                                                                                                                    context.pushNamed(
                                                                                                                      'Tracking',
                                                                                                                      queryParams: {
                                                                                                                        'refTrack': serializeParam(
                                                                                                                          rowPrecommandeRecord.reference,
                                                                                                                          ParamType.DocumentReference,
                                                                                                                        ),
                                                                                                                      }.withoutNulls,
                                                                                                                    );
                                                                                                                  },
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
                                                                                                                              rowPrecommandeRecord.nom!,
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
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                        children: [
                                                                                                                          Expanded(
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
                                                                                                                              child: Text(
                                                                                                                                'client',
                                                                                                                                textAlign: TextAlign.start,
                                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                      fontFamily: 'sf pro text',
                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                      fontSize: 13,
                                                                                                                                      fontWeight: FontWeight.bold,
                                                                                                                                      useGoogleFonts: false,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Expanded(
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                                              child: StreamBuilder<UsersRecord>(
                                                                                                                                stream: UsersRecord.getDocument(rowPrecommandeRecord.refcli!),
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
                                                                                                                                  final textUsersRecord = snapshot.data!;
                                                                                                                                  return Text(
                                                                                                                                    textUsersRecord.displayName!,
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
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                        children: [
                                                                                                                          Expanded(
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
                                                                                                                              child: Text(
                                                                                                                                'Heure livraison',
                                                                                                                                textAlign: TextAlign.start,
                                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                      fontFamily: 'sf pro text',
                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                      fontSize: 13,
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
                                                                                                                                dateTimeFormat(
                                                                                                                                  'd/M H:mm',
                                                                                                                                  rowPrecommandeRecord.heurelivre!,
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
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                            StreamBuilder<
                                                                                PrecommandeRecord>(
                                                                              stream:
                                                                                  PrecommandeRecord.getDocument(columnPrecommandeRecord.reference),
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
                                                                                final buttonPrecommandeRecord = snapshot.data!;
                                                                                return FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    context.pushNamed(
                                                                                      'listePanier',
                                                                                      queryParams: {
                                                                                        'refPanier': serializeParam(
                                                                                          buttonPrecommandeRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  text: 'Voir le contenu',
                                                                                  options: FFButtonOptions(
                                                                                    width: double.infinity,
                                                                                    height: 40,
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                          fontFamily: 'sf pro text',
                                                                                          color: Colors.white,
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
                                                                          ],
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 20, 0, 5),
                                                        child: StreamBuilder<
                                                            List<
                                                                PrecommandeRecord>>(
                                                          stream:
                                                              queryPrecommandeRecord(
                                                            queryBuilder:
                                                                (precommandeRecord) =>
                                                                    precommandeRecord.where(
                                                                        'livrer',
                                                                        isEqualTo:
                                                                            false),
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
                                                            List<PrecommandeRecord>
                                                                columnPrecommandeRecordList =
                                                                snapshot.data!;
                                                            if (columnPrecommandeRecordList
                                                                .isEmpty) {
                                                              return Container(
                                                                width: 300,
                                                                child:
                                                                    UuuiiiWidget(),
                                                              );
                                                            }
                                                            return SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: List.generate(
                                                                    columnPrecommandeRecordList
                                                                        .length,
                                                                    (columnIndex) {
                                                                  final columnPrecommandeRecord =
                                                                      columnPrecommandeRecordList[
                                                                          columnIndex];
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            20),
                                                                    child: StreamBuilder<
                                                                        PrecommandeRecord>(
                                                                      stream: PrecommandeRecord.getDocument(
                                                                          columnPrecommandeRecord
                                                                              .reference),
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
                                                                        final columnPrecommandeRecord =
                                                                            snapshot
                                                                                .data!;
                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                                                  0,
                                                                                  0,
                                                                                  0,
                                                                                  18),
                                                                              child:
                                                                                  StreamBuilder<List<PanierRecord>>(
                                                                                stream: queryPanierRecord(
                                                                                  parent: columnPrecommandeRecord.refcli,
                                                                                  queryBuilder: (panierRecord) => panierRecord.whereIn('ref', columnPrecommandeRecord.listecom!.toList()),
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
                                                                                  List<PanierRecord> containerPanierRecordList = snapshot.data!;
                                                                                  // Return an empty Container when the item does not exist.
                                                                                  if (snapshot.data!.isEmpty) {
                                                                                    return Container();
                                                                                  }
                                                                                  final containerPanierRecord = containerPanierRecordList.isNotEmpty ? containerPanierRecordList.first : null;
                                                                                  return Container(
                                                                                    width: MediaQuery.of(context).size.width,
                                                                                    height: 130,
                                                                                    constraints: BoxConstraints(
                                                                                      maxWidth: 400,
                                                                                    ),
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.circular(15),
                                                                                    ),
                                                                                    child: StreamBuilder<PrecommandeRecord>(
                                                                                      stream: PrecommandeRecord.getDocument(columnPrecommandeRecord.reference),
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
                                                                                        final rowPrecommandeRecord = snapshot.data!;
                                                                                        return Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: StreamBuilder<ProduitsRecord>(
                                                                                                stream: ProduitsRecord.getDocument(containerPanierRecord!.prodRef!),
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
                                                                                                    height: MediaQuery.of(context).size.height * 1,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Color(0x00FFFFFF),
                                                                                                      image: DecorationImage(
                                                                                                        fit: BoxFit.cover,
                                                                                                        image: Image.network(
                                                                                                          containerProduitsRecord.image!,
                                                                                                        ).image,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(20),
                                                                                                    ),
                                                                                                    child: Container(
                                                                                                      width: 100,
                                                                                                      height: 100,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).customColor2,
                                                                                                        borderRadius: BorderRadius.circular(20),
                                                                                                      ),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                                                                                                              child: Container(
                                                                                                                width: MediaQuery.of(context).size.width * 0.5,
                                                                                                                height: double.infinity,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: Color(0x00FFFFFF),
                                                                                                                ),
                                                                                                                child: InkWell(
                                                                                                                  onTap: () async {
                                                                                                                    context.pushNamed(
                                                                                                                      'Tracking',
                                                                                                                      queryParams: {
                                                                                                                        'refTrack': serializeParam(
                                                                                                                          rowPrecommandeRecord.reference,
                                                                                                                          ParamType.DocumentReference,
                                                                                                                        ),
                                                                                                                      }.withoutNulls,
                                                                                                                    );
                                                                                                                  },
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
                                                                                                                              rowPrecommandeRecord.nom!,
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
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                        children: [
                                                                                                                          Expanded(
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
                                                                                                                              child: Text(
                                                                                                                                'client',
                                                                                                                                textAlign: TextAlign.start,
                                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                      fontFamily: 'sf pro text',
                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                      fontSize: 13,
                                                                                                                                      fontWeight: FontWeight.bold,
                                                                                                                                      useGoogleFonts: false,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Expanded(
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                                              child: StreamBuilder<UsersRecord>(
                                                                                                                                stream: UsersRecord.getDocument(rowPrecommandeRecord.refcli!),
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
                                                                                                                                  final textUsersRecord = snapshot.data!;
                                                                                                                                  return Text(
                                                                                                                                    textUsersRecord.displayName!,
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
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                        children: [
                                                                                                                          Expanded(
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
                                                                                                                              child: Text(
                                                                                                                                'Destination',
                                                                                                                                textAlign: TextAlign.start,
                                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                      fontFamily: 'sf pro text',
                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                      fontSize: 13,
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
                                                                                                                                rowPrecommandeRecord.lieu!,
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
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                            StreamBuilder<
                                                                                PrecommandeRecord>(
                                                                              stream:
                                                                                  PrecommandeRecord.getDocument(columnPrecommandeRecord.reference),
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
                                                                                final buttonPrecommandeRecord = snapshot.data!;
                                                                                return FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    context.pushNamed(
                                                                                      'listePanier',
                                                                                      queryParams: {
                                                                                        'refPanier': serializeParam(
                                                                                          buttonPrecommandeRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  text: 'Voir le contenu',
                                                                                  options: FFButtonOptions(
                                                                                    width: double.infinity,
                                                                                    height: 40,
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                          fontFamily: 'sf pro text',
                                                                                          color: Colors.white,
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
                                                                          ],
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 20, 0, 5),
                                                        child: StreamBuilder<
                                                            List<
                                                                CommandesRecord>>(
                                                          stream:
                                                              queryCommandesRecord(
                                                            parent:
                                                                currentUserReference,
                                                            queryBuilder:
                                                                (commandesRecord) =>
                                                                    commandesRecord.where(
                                                                        'paye',
                                                                        isEqualTo:
                                                                            true),
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
                                                            List<CommandesRecord>
                                                                columnCommandesRecordList =
                                                                snapshot.data!;
                                                            if (columnCommandesRecordList
                                                                .isEmpty) {
                                                              return Container(
                                                                width: 300,
                                                                child:
                                                                    UuuiiiWidget(),
                                                              );
                                                            }
                                                            return SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: List.generate(
                                                                    columnCommandesRecordList
                                                                        .length,
                                                                    (columnIndex) {
                                                                  final columnCommandesRecord =
                                                                      columnCommandesRecordList[
                                                                          columnIndex];
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            20),
                                                                    child: StreamBuilder<
                                                                        CommandesRecord>(
                                                                      stream: CommandesRecord.getDocument(
                                                                          columnCommandesRecord
                                                                              .reference),
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
                                                                        final columnCommandesRecord =
                                                                            snapshot
                                                                                .data!;
                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                                                  0,
                                                                                  0,
                                                                                  0,
                                                                                  18),
                                                                              child:
                                                                                  Container(
                                                                                width: MediaQuery.of(context).size.width,
                                                                                height: 130,
                                                                                constraints: BoxConstraints(
                                                                                  maxWidth: 400,
                                                                                ),
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(15),
                                                                                ),
                                                                                child: StreamBuilder<PrecommandeRecord>(
                                                                                  stream: PrecommandeRecord.getDocument(columnCommandesRecord.ref!),
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
                                                                                    final rowPrecommandeRecord = snapshot.data!;
                                                                                    return Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Container(
                                                                                            height: MediaQuery.of(context).size.height * 1,
                                                                                            decoration: BoxDecoration(
                                                                                              image: DecorationImage(
                                                                                                fit: BoxFit.cover,
                                                                                                image: Image.network(
                                                                                                  '',
                                                                                                ).image,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(20),
                                                                                            ),
                                                                                            child: StreamBuilder<List<PanierRecord>>(
                                                                                              stream: queryPanierRecord(
                                                                                                parent: columnCommandesRecord.client,
                                                                                                queryBuilder: (panierRecord) => panierRecord.whereIn('ref', rowPrecommandeRecord.listecom!.toList()),
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
                                                                                                List<PanierRecord> containerPanierRecordList = snapshot.data!;
                                                                                                // Return an empty Container when the item does not exist.
                                                                                                if (snapshot.data!.isEmpty) {
                                                                                                  return Container();
                                                                                                }
                                                                                                final containerPanierRecord = containerPanierRecordList.isNotEmpty ? containerPanierRecordList.first : null;
                                                                                                return Container(
                                                                                                  width: 100,
                                                                                                  height: 100,
                                                                                                  decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(20),
                                                                                                  ),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                                                                                                          child: StreamBuilder<ProduitsRecord>(
                                                                                                            stream: ProduitsRecord.getDocument(containerPanierRecord!.prodRef!),
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
                                                                                                              return Material(
                                                                                                                color: Colors.transparent,
                                                                                                                elevation: 2,
                                                                                                                shape: RoundedRectangleBorder(
                                                                                                                  borderRadius: BorderRadius.circular(20),
                                                                                                                ),
                                                                                                                child: Container(
                                                                                                                  width: MediaQuery.of(context).size.width * 0.5,
                                                                                                                  height: double.infinity,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: Color(0x00FFFFFF),
                                                                                                                    image: DecorationImage(
                                                                                                                      fit: BoxFit.cover,
                                                                                                                      image: Image.network(
                                                                                                                        containerProduitsRecord.image!,
                                                                                                                      ).image,
                                                                                                                    ),
                                                                                                                    borderRadius: BorderRadius.circular(20),
                                                                                                                  ),
                                                                                                                  child: Container(
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: Color(0xA0FFFFFF),
                                                                                                                    ),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                                                                                                      child: InkWell(
                                                                                                                        onTap: () async {
                                                                                                                          context.pushNamed(
                                                                                                                            'Tracking',
                                                                                                                            queryParams: {
                                                                                                                              'refTrack': serializeParam(
                                                                                                                                rowPrecommandeRecord.reference,
                                                                                                                                ParamType.DocumentReference,
                                                                                                                              ),
                                                                                                                            }.withoutNulls,
                                                                                                                          );
                                                                                                                        },
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
                                                                                                                                    rowPrecommandeRecord.nom!,
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
                                                                                                                            Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                              children: [
                                                                                                                                Expanded(
                                                                                                                                  child: Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
                                                                                                                                    child: Text(
                                                                                                                                      'client',
                                                                                                                                      textAlign: TextAlign.start,
                                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                            fontFamily: 'sf pro text',
                                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                            fontSize: 13,
                                                                                                                                            fontWeight: FontWeight.bold,
                                                                                                                                            useGoogleFonts: false,
                                                                                                                                          ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                                Expanded(
                                                                                                                                  child: Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                                                    child: StreamBuilder<UsersRecord>(
                                                                                                                                      stream: UsersRecord.getDocument(rowPrecommandeRecord.refcli!),
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
                                                                                                                                        final textUsersRecord = snapshot.data!;
                                                                                                                                        return Text(
                                                                                                                                          textUsersRecord.displayName!,
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
                                                                                                                            Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                              children: [
                                                                                                                                Expanded(
                                                                                                                                  child: Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
                                                                                                                                    child: Text(
                                                                                                                                      'Heure livraison',
                                                                                                                                      textAlign: TextAlign.start,
                                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                            fontFamily: 'sf pro text',
                                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                            fontSize: 13,
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
                                                                                                                                      dateTimeFormat(
                                                                                                                                        'd/M H:mm',
                                                                                                                                        rowPrecommandeRecord.heurelivre!,
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
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
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
                                                                            ),
                                                                            StreamBuilder<
                                                                                PrecommandeRecord>(
                                                                              stream:
                                                                                  PrecommandeRecord.getDocument(columnCommandesRecord.ref!),
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
                                                                                final buttonPrecommandeRecord = snapshot.data!;
                                                                                return FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    context.pushNamed(
                                                                                      'listePanier',
                                                                                      queryParams: {
                                                                                        'refPanier': serializeParam(
                                                                                          buttonPrecommandeRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  text: 'Voir le contenu',
                                                                                  options: FFButtonOptions(
                                                                                    width: double.infinity,
                                                                                    height: 40,
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                          fontFamily: 'sf pro text',
                                                                                          color: Colors.white,
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
                                                                          ],
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
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 20, 0, 5),
                                                        child: StreamBuilder<
                                                            List<
                                                                CommandesRecord>>(
                                                          stream:
                                                              queryCommandesRecord(
                                                            parent:
                                                                currentUserReference,
                                                            queryBuilder:
                                                                (commandesRecord) =>
                                                                    commandesRecord.where(
                                                                        'paye',
                                                                        isEqualTo:
                                                                            false),
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
                                                            List<CommandesRecord>
                                                                columnCommandesRecordList =
                                                                snapshot.data!;
                                                            if (columnCommandesRecordList
                                                                .isEmpty) {
                                                              return Container(
                                                                width: 300,
                                                                child:
                                                                    UuuiiiWidget(),
                                                              );
                                                            }
                                                            return SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: List.generate(
                                                                    columnCommandesRecordList
                                                                        .length,
                                                                    (columnIndex) {
                                                                  final columnCommandesRecord =
                                                                      columnCommandesRecordList[
                                                                          columnIndex];
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            0,
                                                                            20),
                                                                    child: StreamBuilder<
                                                                        CommandesRecord>(
                                                                      stream: CommandesRecord.getDocument(
                                                                          columnCommandesRecord
                                                                              .reference),
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
                                                                        final columnCommandesRecord =
                                                                            snapshot
                                                                                .data!;
                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                                                  0,
                                                                                  0,
                                                                                  0,
                                                                                  18),
                                                                              child:
                                                                                  Container(
                                                                                width: MediaQuery.of(context).size.width,
                                                                                height: 130,
                                                                                constraints: BoxConstraints(
                                                                                  maxWidth: 400,
                                                                                ),
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(15),
                                                                                ),
                                                                                child: StreamBuilder<PrecommandeRecord>(
                                                                                  stream: PrecommandeRecord.getDocument(columnCommandesRecord.ref!),
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
                                                                                    final rowPrecommandeRecord = snapshot.data!;
                                                                                    return Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Container(
                                                                                            height: MediaQuery.of(context).size.height * 1,
                                                                                            decoration: BoxDecoration(
                                                                                              image: DecorationImage(
                                                                                                fit: BoxFit.cover,
                                                                                                image: Image.network(
                                                                                                  '',
                                                                                                ).image,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(20),
                                                                                            ),
                                                                                            child: StreamBuilder<List<PanierRecord>>(
                                                                                              stream: queryPanierRecord(
                                                                                                parent: columnCommandesRecord.client,
                                                                                                queryBuilder: (panierRecord) => panierRecord.whereIn('ref', rowPrecommandeRecord.listecom!.toList()),
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
                                                                                                List<PanierRecord> containerPanierRecordList = snapshot.data!;
                                                                                                // Return an empty Container when the item does not exist.
                                                                                                if (snapshot.data!.isEmpty) {
                                                                                                  return Container();
                                                                                                }
                                                                                                final containerPanierRecord = containerPanierRecordList.isNotEmpty ? containerPanierRecordList.first : null;
                                                                                                return Container(
                                                                                                  width: 100,
                                                                                                  height: 100,
                                                                                                  decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(20),
                                                                                                  ),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                                                                                                          child: StreamBuilder<ProduitsRecord>(
                                                                                                            stream: ProduitsRecord.getDocument(containerPanierRecord!.prodRef!),
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
                                                                                                              return Material(
                                                                                                                color: Colors.transparent,
                                                                                                                elevation: 2,
                                                                                                                shape: RoundedRectangleBorder(
                                                                                                                  borderRadius: BorderRadius.circular(20),
                                                                                                                ),
                                                                                                                child: Container(
                                                                                                                  width: MediaQuery.of(context).size.width * 0.5,
                                                                                                                  height: double.infinity,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: Color(0x00FFFFFF),
                                                                                                                    image: DecorationImage(
                                                                                                                      fit: BoxFit.cover,
                                                                                                                      image: Image.network(
                                                                                                                        containerProduitsRecord.image!,
                                                                                                                      ).image,
                                                                                                                    ),
                                                                                                                    borderRadius: BorderRadius.circular(20),
                                                                                                                  ),
                                                                                                                  child: Container(
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: Color(0xA0FFFFFF),
                                                                                                                    ),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                                                                                                      child: InkWell(
                                                                                                                        onTap: () async {
                                                                                                                          context.pushNamed(
                                                                                                                            'Tracking',
                                                                                                                            queryParams: {
                                                                                                                              'refTrack': serializeParam(
                                                                                                                                rowPrecommandeRecord.reference,
                                                                                                                                ParamType.DocumentReference,
                                                                                                                              ),
                                                                                                                            }.withoutNulls,
                                                                                                                          );
                                                                                                                        },
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
                                                                                                                                    rowPrecommandeRecord.nom!,
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
                                                                                                                            Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                              children: [
                                                                                                                                Expanded(
                                                                                                                                  child: Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
                                                                                                                                    child: Text(
                                                                                                                                      'client',
                                                                                                                                      textAlign: TextAlign.start,
                                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                            fontFamily: 'sf pro text',
                                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                            fontSize: 13,
                                                                                                                                            fontWeight: FontWeight.bold,
                                                                                                                                            useGoogleFonts: false,
                                                                                                                                          ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                                Expanded(
                                                                                                                                  child: Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                                                    child: StreamBuilder<UsersRecord>(
                                                                                                                                      stream: UsersRecord.getDocument(rowPrecommandeRecord.refcli!),
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
                                                                                                                                        final textUsersRecord = snapshot.data!;
                                                                                                                                        return Text(
                                                                                                                                          textUsersRecord.displayName!,
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
                                                                                                                            Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                              children: [
                                                                                                                                Expanded(
                                                                                                                                  child: Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
                                                                                                                                    child: Text(
                                                                                                                                      'Heure livraison',
                                                                                                                                      textAlign: TextAlign.start,
                                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                            fontFamily: 'sf pro text',
                                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                            fontSize: 13,
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
                                                                                                                                      dateTimeFormat(
                                                                                                                                        'd/M H:mm',
                                                                                                                                        rowPrecommandeRecord.heurelivre!,
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
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
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
                                                                            ),
                                                                            StreamBuilder<
                                                                                PrecommandeRecord>(
                                                                              stream:
                                                                                  PrecommandeRecord.getDocument(columnCommandesRecord.ref!),
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
                                                                                final buttonPrecommandeRecord = snapshot.data!;
                                                                                return FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    context.pushNamed(
                                                                                      'listePanier',
                                                                                      queryParams: {
                                                                                        'refPanier': serializeParam(
                                                                                          buttonPrecommandeRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  text: 'Voir le contenu',
                                                                                  options: FFButtonOptions(
                                                                                    width: double.infinity,
                                                                                    height: 40,
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                          fontFamily: 'sf pro text',
                                                                                          color: Colors.white,
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
                                                                          ],
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
                                                    ],
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
                            ],
                          ),
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
                            color:
                                FlutterFlowTheme.of(context).secondaryBackground,
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
                                        width: MediaQuery.of(context).size.width *
                                            0.19,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                1,
                                        decoration: BoxDecoration(
                                          color: Color(0x00272B50),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsetsDirectional.fromSTEB(
                                                      0, 40, 0, 0),
                                              child: StreamBuilder<UsersRecord>(
                                                stream: UsersRecord.getDocument(
                                                    currentUserReference!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 20,
                                                        height: 20,
                                                        child: SpinKitPulse(
                                                          color:
                                                              FlutterFlowTheme.of(
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
                                                      Container(
                                                        width: 60,
                                                        height: 60,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          columnUsersRecord
                                                              .photoUrl!,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 15, 0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
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
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 15),
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
                                                              child: Container(
                                                                width: 100,
                                                                height: 30,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0x00FC6A57),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50),
                                                                ),
                                                                child: InkWell(
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
                                                                            Colors
                                                                                .transparent,
                                                                        borderRadius:
                                                                            50,
                                                                        borderWidth:
                                                                            1,
                                                                        buttonSize:
                                                                            30,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context)
                                                                                .primaryBackground,
                                                                        icon:
                                                                            Icon(
                                                                          FFIcons
                                                                              .kfiRrHome,
                                                                          color: FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                          size:
                                                                              15,
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
                                                              .fromSTEB(
                                                                  0, 0, 0, 15),
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
                                                              child: Container(
                                                                width: 100,
                                                                height: 30,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0x00FC6A57),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50),
                                                                ),
                                                                child: InkWell(
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
                                                                            Colors
                                                                                .transparent,
                                                                        borderRadius:
                                                                            50,
                                                                        borderWidth:
                                                                            1,
                                                                        buttonSize:
                                                                            30,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context)
                                                                                .primaryBackground,
                                                                        icon:
                                                                            Icon(
                                                                          FFIcons
                                                                              .kfiRrHeart,
                                                                          color: FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                          size:
                                                                              15,
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
                                                              .fromSTEB(
                                                                  0, 0, 0, 15),
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
                                                              child: Container(
                                                                width: 100,
                                                                height: 30,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0x00FC6A57),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50),
                                                                ),
                                                                child: InkWell(
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
                                                                            Colors
                                                                                .transparent,
                                                                        borderRadius:
                                                                            50,
                                                                        borderWidth:
                                                                            1,
                                                                        buttonSize:
                                                                            30,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context)
                                                                                .primaryBackground,
                                                                        icon:
                                                                            Icon(
                                                                          FFIcons
                                                                              .kfiRrApps,
                                                                          color: FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                          size:
                                                                              15,
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
                                                              .fromSTEB(
                                                                  0, 0, 0, 15),
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
                                                              child: Container(
                                                                width: 150,
                                                                height: 30,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50),
                                                                  shape: BoxShape
                                                                      .rectangle,
                                                                ),
                                                                child: InkWell(
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
                                                                            Colors
                                                                                .transparent,
                                                                        borderRadius:
                                                                            30,
                                                                        borderWidth:
                                                                            1,
                                                                        buttonSize:
                                                                            30,
                                                                        fillColor:
                                                                            Color(
                                                                                0xFFCC4433),
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .shopping_basket_outlined,
                                                                          color: Colors
                                                                              .white,
                                                                          size:
                                                                              15,
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
                                                              .fromSTEB(
                                                                  0, 0, 0, 15),
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
                                                              child: Container(
                                                                width: 100,
                                                                height: 30,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0x00FC6A57),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50),
                                                                ),
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                            'user');
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors
                                                                                .transparent,
                                                                        borderRadius:
                                                                            50,
                                                                        borderWidth:
                                                                            1,
                                                                        buttonSize:
                                                                            30,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context)
                                                                                .primaryBackground,
                                                                        icon:
                                                                            Icon(
                                                                          FFIcons
                                                                              .kfiRrUser,
                                                                          color: FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                          size:
                                                                              15,
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
                                                              .fromSTEB(
                                                                  0, 40, 0, 0),
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
                                          height:
                                              MediaQuery.of(context).size.height *
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
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.55,
                                                      decoration: BoxDecoration(
                                                        color: Color(0x00272B50),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20, 16,
                                                                    20, 0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
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
                                                              child: Container(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.25,
                                                                height: 40,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth: 500,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0x00272B50),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
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
                                                                        term: searchField232Controller!
                                                                            .text,
                                                                      )
                                                                          .then((r) =>
                                                                              algoliaSearchResults =
                                                                                  r)
                                                                          .onError((_,
                                                                                  __) =>
                                                                              algoliaSearchResults =
                                                                                  [])
                                                                          .whenComplete(() =>
                                                                              setState(() {}));
                                                                    },
                                                                  ),
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2,
                                                                    hintText:
                                                                        'Recherchez un plat ici',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lexend Deca',
                                                                          color: FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width: 0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              29),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width: 0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              29),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width: 0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              29),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width: 0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              29),
                                                                    ),
                                                                    filled: true,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    contentPadding:
                                                                        EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                                14,
                                                                                24,
                                                                                14,
                                                                                24),
                                                                    prefixIcon:
                                                                        Icon(
                                                                      FFIcons
                                                                          .ksearchFael,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                    ),
                                                                    suffixIcon: searchField232Controller!
                                                                            .text
                                                                            .isNotEmpty
                                                                        ? InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              searchField232Controller?.clear();
                                                                              setState(() =>
                                                                                  algoliaSearchResults = null);
                                                                              await ProduitsRecord
                                                                                  .search(
                                                                                term: searchField232Controller!.text,
                                                                              ).then((r) => algoliaSearchResults = r).onError((_, __) => algoliaSearchResults = []).whenComplete(() =>
                                                                                  setState(() {}));
      
                                                                              setState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.clear,
                                                                              color:
                                                                                  Color(0xFF757575),
                                                                              size:
                                                                                  22,
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
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            8,
                                                                            0,
                                                                            0),
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width: MediaQuery.of(context)
                                                                                .size
                                                                                .width *
                                                                            0.55,
                                                                        height:
                                                                            MediaQuery.of(context).size.height *
                                                                                1,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: Color(
                                                                              0x00FFFFFF),
                                                                          borderRadius:
                                                                              BorderRadius.circular(15),
                                                                        ),
                                                                        child: FutureBuilder<
                                                                            List<
                                                                                ProduitsRecord>>(
                                                                          future:
                                                                              ProduitsRecord.search(
                                                                            term:
                                                                                searchField232Controller!.text,
                                                                          ),
                                                                          builder:
                                                                              (context,
                                                                                  snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot
                                                                                .hasData) {
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
                                                                            List<ProduitsRecord>
                                                                                columnProduitsRecordList =
                                                                                snapshot.data!;
                                                                            // Customize what your widget looks like with no search results.
                                                                            if (snapshot
                                                                                .data!
                                                                                .isEmpty) {
                                                                              return Container(
                                                                                height: 100,
                                                                                child: Center(
                                                                                  child: Text('No results.'),
                                                                                ),
                                                                              );
                                                                            }
                                                                            return Column(
                                                                              mainAxisSize:
                                                                                  MainAxisSize.max,
                                                                              crossAxisAlignment:
                                                                                  CrossAxisAlignment.start,
                                                                              children:
                                                                                  List.generate(columnProduitsRecordList.length, (columnIndex) {
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
                                                              .fromSTEB(
                                                                  0, 16, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment.end,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(10,
                                                                        0, 10, 0),
                                                            child: Container(
                                                              width: 140,
                                                              height: 40,
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxWidth: 160,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme
                                                                        .of(context)
                                                                    .tertiary400,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50),
                                                              ),
                                                              child: InkWell(
                                                                onTap: () async {
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
                                                                          Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          50,
                                                                      borderWidth:
                                                                          1,
                                                                      buttonSize:
                                                                          40,
                                                                      fillColor:
                                                                          Color(
                                                                              0xFF109C89),
                                                                      icon: Icon(
                                                                        Icons
                                                                            .logout,
                                                                        color: Colors
                                                                            .white,
                                                                        size: 20,
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
                                                                        padding: EdgeInsetsDirectional
                                                                            .fromSTEB(
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
                                                                              child:
                                                                                  InkWell(
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
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: 100,
                                                        height:
                                                            MediaQuery.of(context)
                                                                    .size
                                                                    .height *
                                                                0.97,
                                                        decoration: BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    60),
                                                            topRight:
                                                                Radius.circular(
                                                                    0),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0, 40,
                                                                      0, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize.max,
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
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0,
                                                                          -5.65),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    child: Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              24,
                                                                              0,
                                                                              8),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(24, 20, 0, 0),
                                                                                child: Text(
                                                                                  'Historique',
                                                                                  style: FlutterFlowTheme.of(context).title1,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              20,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                width: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0x00272B50),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                                                                                  child: Container(
                                                                                    height: MediaQuery.of(context).size.height * 1,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Color(0x00272B50),
                                                                                      borderRadius: BorderRadius.only(
                                                                                        bottomLeft: Radius.circular(0),
                                                                                        bottomRight: Radius.circular(0),
                                                                                        topLeft: Radius.circular(30),
                                                                                        topRight: Radius.circular(30),
                                                                                      ),
                                                                                    ),
                                                                                    child: DefaultTabController(
                                                                                      length: 4,
                                                                                      initialIndex: min(
                                                                                          valueOrDefault<int>(
                                                                                            () {
                                                                                              if (FFAppState().tabSimple == true) {
                                                                                                return 1;
                                                                                              } else if (FFAppState().tabAbo == true) {
                                                                                                return 2;
                                                                                              } else if (FFAppState().tabR == true) {
                                                                                                return 3;
                                                                                              } else {
                                                                                                return 0;
                                                                                              }
                                                                                            }(),
                                                                                            0,
                                                                                          ),
                                                                                          3),
                                                                                      child: Column(
                                                                                        children: [
                                                                                          TabBar(
                                                                                            isScrollable: true,
                                                                                            labelColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                            unselectedLabelColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                            labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'sf pro text',
                                                                                                  fontSize: 16,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  useGoogleFonts: false,
                                                                                                ),
                                                                                            indicatorColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                            tabs: [
                                                                                              Tab(
                                                                                                text: 'Livrés',
                                                                                              ),
                                                                                              Tab(
                                                                                                text: 'En attente de livraison',
                                                                                              ),
                                                                                              Tab(
                                                                                                text: 'Payées',
                                                                                              ),
                                                                                              Tab(
                                                                                                text: 'En attente de paiement',
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Expanded(
                                                                                            child: TabBarView(
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 5),
                                                                                                  child: StreamBuilder<List<PrecommandeRecord>>(
                                                                                                    stream: queryPrecommandeRecord(
                                                                                                      queryBuilder: (precommandeRecord) => precommandeRecord.where('livrer', isEqualTo: true).where('livreur', isEqualTo: currentUserReference),
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
                                                                                                      List<PrecommandeRecord> columnPrecommandeRecordList = snapshot.data!;
                                                                                                      if (columnPrecommandeRecordList.isEmpty) {
                                                                                                        return Container(
                                                                                                          width: 300,
                                                                                                          child: UuuiiiWidget(),
                                                                                                        );
                                                                                                      }
                                                                                                      return SingleChildScrollView(
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                                          children: List.generate(columnPrecommandeRecordList.length, (columnIndex) {
                                                                                                            final columnPrecommandeRecord = columnPrecommandeRecordList[columnIndex];
                                                                                                            return Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                                                                                              child: StreamBuilder<PrecommandeRecord>(
                                                                                                                stream: PrecommandeRecord.getDocument(columnPrecommandeRecord.reference),
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
                                                                                                                  final columnPrecommandeRecord = snapshot.data!;
                                                                                                                  return Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 18),
                                                                                                                        child: StreamBuilder<List<PanierRecord>>(
                                                                                                                          stream: queryPanierRecord(
                                                                                                                            parent: columnPrecommandeRecord.refcli,
                                                                                                                            queryBuilder: (panierRecord) => panierRecord.whereIn('ref', columnPrecommandeRecord.listecom!.toList()),
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
                                                                                                                            List<PanierRecord> containerPanierRecordList = snapshot.data!;
                                                                                                                            // Return an empty Container when the item does not exist.
                                                                                                                            if (snapshot.data!.isEmpty) {
                                                                                                                              return Container();
                                                                                                                            }
                                                                                                                            final containerPanierRecord = containerPanierRecordList.isNotEmpty ? containerPanierRecordList.first : null;
                                                                                                                            return Container(
                                                                                                                              width: MediaQuery.of(context).size.width,
                                                                                                                              height: 130,
                                                                                                                              constraints: BoxConstraints(
                                                                                                                                maxWidth: 400,
                                                                                                                              ),
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                borderRadius: BorderRadius.circular(15),
                                                                                                                              ),
                                                                                                                              child: StreamBuilder<PrecommandeRecord>(
                                                                                                                                stream: PrecommandeRecord.getDocument(columnPrecommandeRecord.reference),
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
                                                                                                                                  final rowPrecommandeRecord = snapshot.data!;
                                                                                                                                  return Row(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    children: [
                                                                                                                                      Expanded(
                                                                                                                                        child: StreamBuilder<ProduitsRecord>(
                                                                                                                                          stream: ProduitsRecord.getDocument(containerPanierRecord!.prodRef!),
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
                                                                                                                                              height: MediaQuery.of(context).size.height * 1,
                                                                                                                                              decoration: BoxDecoration(
                                                                                                                                                color: Color(0x00FFFFFF),
                                                                                                                                                image: DecorationImage(
                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                  image: Image.network(
                                                                                                                                                    containerProduitsRecord.image!,
                                                                                                                                                  ).image,
                                                                                                                                                ),
                                                                                                                                                borderRadius: BorderRadius.circular(20),
                                                                                                                                              ),
                                                                                                                                              child: Container(
                                                                                                                                                width: 100,
                                                                                                                                                height: 100,
                                                                                                                                                decoration: BoxDecoration(
                                                                                                                                                  color: FlutterFlowTheme.of(context).customColor2,
                                                                                                                                                  borderRadius: BorderRadius.circular(20),
                                                                                                                                                ),
                                                                                                                                                child: Row(
                                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                                  children: [
                                                                                                                                                    Expanded(
                                                                                                                                                      child: Padding(
                                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                                                                                                                                                        child: Container(
                                                                                                                                                          width: MediaQuery.of(context).size.width * 0.5,
                                                                                                                                                          height: double.infinity,
                                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                                            color: Color(0x00FFFFFF),
                                                                                                                                                          ),
                                                                                                                                                          child: InkWell(
                                                                                                                                                            onTap: () async {
                                                                                                                                                              context.pushNamed(
                                                                                                                                                                'Tracking',
                                                                                                                                                                queryParams: {
                                                                                                                                                                  'refTrack': serializeParam(
                                                                                                                                                                    rowPrecommandeRecord.reference,
                                                                                                                                                                    ParamType.DocumentReference,
                                                                                                                                                                  ),
                                                                                                                                                                }.withoutNulls,
                                                                                                                                                              );
                                                                                                                                                            },
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
                                                                                                                                                                        rowPrecommandeRecord.nom!,
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
                                                                                                                                                                Row(
                                                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                                                  children: [
                                                                                                                                                                    Expanded(
                                                                                                                                                                      child: Padding(
                                                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
                                                                                                                                                                        child: Text(
                                                                                                                                                                          'client',
                                                                                                                                                                          textAlign: TextAlign.start,
                                                                                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                                                fontFamily: 'sf pro text',
                                                                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                                                fontSize: 13,
                                                                                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                                                                                useGoogleFonts: false,
                                                                                                                                                                              ),
                                                                                                                                                                        ),
                                                                                                                                                                      ),
                                                                                                                                                                    ),
                                                                                                                                                                    Expanded(
                                                                                                                                                                      child: Padding(
                                                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                                                                                        child: StreamBuilder<UsersRecord>(
                                                                                                                                                                          stream: UsersRecord.getDocument(rowPrecommandeRecord.refcli!),
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
                                                                                                                                                                            final textUsersRecord = snapshot.data!;
                                                                                                                                                                            return Text(
                                                                                                                                                                              textUsersRecord.displayName!,
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
                                                                                                                                                                Row(
                                                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                                                  children: [
                                                                                                                                                                    Expanded(
                                                                                                                                                                      child: Padding(
                                                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
                                                                                                                                                                        child: Text(
                                                                                                                                                                          'Heure livraison',
                                                                                                                                                                          textAlign: TextAlign.start,
                                                                                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                                                fontFamily: 'sf pro text',
                                                                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                                                fontSize: 13,
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
                                                                                                                                                                          dateTimeFormat(
                                                                                                                                                                            'd/M H:mm',
                                                                                                                                                                            rowPrecommandeRecord.heurelivre!,
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
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            );
                                                                                                                                          },
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  );
                                                                                                                                },
                                                                                                                              ),
                                                                                                                            );
                                                                                                                          },
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      StreamBuilder<PrecommandeRecord>(
                                                                                                                        stream: PrecommandeRecord.getDocument(columnPrecommandeRecord.reference),
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
                                                                                                                              context.pushNamed(
                                                                                                                                'listePanier',
                                                                                                                                queryParams: {
                                                                                                                                  'refPanier': serializeParam(
                                                                                                                                    buttonPrecommandeRecord.reference,
                                                                                                                                    ParamType.DocumentReference,
                                                                                                                                  ),
                                                                                                                                }.withoutNulls,
                                                                                                                              );
                                                                                                                            },
                                                                                                                            text: 'Voir le contenu',
                                                                                                                            options: FFButtonOptions(
                                                                                                                              width: double.infinity,
                                                                                                                              height: 40,
                                                                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                                                    fontFamily: 'sf pro text',
                                                                                                                                    color: Colors.white,
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
                                                                                                                    ],
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
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 5),
                                                                                                  child: StreamBuilder<List<PrecommandeRecord>>(
                                                                                                    stream: queryPrecommandeRecord(
                                                                                                      queryBuilder: (precommandeRecord) => precommandeRecord.where('livrer', isEqualTo: false).where('livreur', isEqualTo: currentUserReference),
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
                                                                                                      List<PrecommandeRecord> columnPrecommandeRecordList = snapshot.data!;
                                                                                                      if (columnPrecommandeRecordList.isEmpty) {
                                                                                                        return Container(
                                                                                                          width: 300,
                                                                                                          child: UuuiiiWidget(),
                                                                                                        );
                                                                                                      }
                                                                                                      return SingleChildScrollView(
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                                          children: List.generate(columnPrecommandeRecordList.length, (columnIndex) {
                                                                                                            final columnPrecommandeRecord = columnPrecommandeRecordList[columnIndex];
                                                                                                            return Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                                                                                              child: StreamBuilder<PrecommandeRecord>(
                                                                                                                stream: PrecommandeRecord.getDocument(columnPrecommandeRecord.reference),
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
                                                                                                                  final columnPrecommandeRecord = snapshot.data!;
                                                                                                                  return Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 18),
                                                                                                                        child: StreamBuilder<List<PanierRecord>>(
                                                                                                                          stream: queryPanierRecord(
                                                                                                                            parent: columnPrecommandeRecord.refcli,
                                                                                                                            queryBuilder: (panierRecord) => panierRecord.whereIn('ref', columnPrecommandeRecord.listecom!.toList()),
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
                                                                                                                            List<PanierRecord> containerPanierRecordList = snapshot.data!;
                                                                                                                            // Return an empty Container when the item does not exist.
                                                                                                                            if (snapshot.data!.isEmpty) {
                                                                                                                              return Container();
                                                                                                                            }
                                                                                                                            final containerPanierRecord = containerPanierRecordList.isNotEmpty ? containerPanierRecordList.first : null;
                                                                                                                            return Container(
                                                                                                                              width: MediaQuery.of(context).size.width,
                                                                                                                              height: 130,
                                                                                                                              constraints: BoxConstraints(
                                                                                                                                maxWidth: 400,
                                                                                                                              ),
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                borderRadius: BorderRadius.circular(15),
                                                                                                                              ),
                                                                                                                              child: StreamBuilder<PrecommandeRecord>(
                                                                                                                                stream: PrecommandeRecord.getDocument(columnPrecommandeRecord.reference),
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
                                                                                                                                  final rowPrecommandeRecord = snapshot.data!;
                                                                                                                                  return Row(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    children: [
                                                                                                                                      Expanded(
                                                                                                                                        child: StreamBuilder<ProduitsRecord>(
                                                                                                                                          stream: ProduitsRecord.getDocument(containerPanierRecord!.prodRef!),
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
                                                                                                                                              height: MediaQuery.of(context).size.height * 1,
                                                                                                                                              decoration: BoxDecoration(
                                                                                                                                                color: Color(0x00FFFFFF),
                                                                                                                                                image: DecorationImage(
                                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                                  image: Image.network(
                                                                                                                                                    containerProduitsRecord.image!,
                                                                                                                                                  ).image,
                                                                                                                                                ),
                                                                                                                                                borderRadius: BorderRadius.circular(20),
                                                                                                                                              ),
                                                                                                                                              child: Container(
                                                                                                                                                width: 100,
                                                                                                                                                height: 100,
                                                                                                                                                decoration: BoxDecoration(
                                                                                                                                                  color: FlutterFlowTheme.of(context).customColor2,
                                                                                                                                                  borderRadius: BorderRadius.circular(20),
                                                                                                                                                ),
                                                                                                                                                child: Row(
                                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                                  children: [
                                                                                                                                                    Expanded(
                                                                                                                                                      child: Padding(
                                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                                                                                                                                                        child: Container(
                                                                                                                                                          width: MediaQuery.of(context).size.width * 0.5,
                                                                                                                                                          height: double.infinity,
                                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                                            color: Color(0x00FFFFFF),
                                                                                                                                                          ),
                                                                                                                                                          child: InkWell(
                                                                                                                                                            onTap: () async {
                                                                                                                                                              context.pushNamed(
                                                                                                                                                                'Tracking',
                                                                                                                                                                queryParams: {
                                                                                                                                                                  'refTrack': serializeParam(
                                                                                                                                                                    rowPrecommandeRecord.reference,
                                                                                                                                                                    ParamType.DocumentReference,
                                                                                                                                                                  ),
                                                                                                                                                                }.withoutNulls,
                                                                                                                                                              );
                                                                                                                                                            },
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
                                                                                                                                                                        rowPrecommandeRecord.nom!,
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
                                                                                                                                                                Row(
                                                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                                                  children: [
                                                                                                                                                                    Expanded(
                                                                                                                                                                      child: Padding(
                                                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
                                                                                                                                                                        child: Text(
                                                                                                                                                                          'client',
                                                                                                                                                                          textAlign: TextAlign.start,
                                                                                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                                                fontFamily: 'sf pro text',
                                                                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                                                fontSize: 13,
                                                                                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                                                                                useGoogleFonts: false,
                                                                                                                                                                              ),
                                                                                                                                                                        ),
                                                                                                                                                                      ),
                                                                                                                                                                    ),
                                                                                                                                                                    Expanded(
                                                                                                                                                                      child: Padding(
                                                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                                                                                        child: StreamBuilder<UsersRecord>(
                                                                                                                                                                          stream: UsersRecord.getDocument(rowPrecommandeRecord.refcli!),
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
                                                                                                                                                                            final textUsersRecord = snapshot.data!;
                                                                                                                                                                            return Text(
                                                                                                                                                                              textUsersRecord.displayName!,
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
                                                                                                                                                                Row(
                                                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                                                  children: [
                                                                                                                                                                    Expanded(
                                                                                                                                                                      child: Padding(
                                                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
                                                                                                                                                                        child: Text(
                                                                                                                                                                          'Destination',
                                                                                                                                                                          textAlign: TextAlign.start,
                                                                                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                                                fontFamily: 'sf pro text',
                                                                                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                                                fontSize: 13,
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
                                                                                                                                                                          rowPrecommandeRecord.lieu!,
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
                                                                                                                                                              ],
                                                                                                                                                            ),
                                                                                                                                                          ),
                                                                                                                                                        ),
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                  ],
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            );
                                                                                                                                          },
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ],
                                                                                                                                  );
                                                                                                                                },
                                                                                                                              ),
                                                                                                                            );
                                                                                                                          },
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      StreamBuilder<PrecommandeRecord>(
                                                                                                                        stream: PrecommandeRecord.getDocument(columnPrecommandeRecord.reference),
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
                                                                                                                              context.pushNamed(
                                                                                                                                'listePanier',
                                                                                                                                queryParams: {
                                                                                                                                  'refPanier': serializeParam(
                                                                                                                                    buttonPrecommandeRecord.reference,
                                                                                                                                    ParamType.DocumentReference,
                                                                                                                                  ),
                                                                                                                                }.withoutNulls,
                                                                                                                              );
                                                                                                                            },
                                                                                                                            text: 'Voir le contenu',
                                                                                                                            options: FFButtonOptions(
                                                                                                                              width: double.infinity,
                                                                                                                              height: 40,
                                                                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                                                    fontFamily: 'sf pro text',
                                                                                                                                    color: Colors.white,
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
                                                                                                                    ],
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
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 5),
                                                                                                  child: StreamBuilder<List<CommandesRecord>>(
                                                                                                    stream: queryCommandesRecord(
                                                                                                      parent: currentUserReference,
                                                                                                      queryBuilder: (commandesRecord) => commandesRecord.where('paye', isEqualTo: true),
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
                                                                                                      List<CommandesRecord> columnCommandesRecordList = snapshot.data!;
                                                                                                      if (columnCommandesRecordList.isEmpty) {
                                                                                                        return Container(
                                                                                                          width: 300,
                                                                                                          child: UuuiiiWidget(),
                                                                                                        );
                                                                                                      }
                                                                                                      return SingleChildScrollView(
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                                          children: List.generate(columnCommandesRecordList.length, (columnIndex) {
                                                                                                            final columnCommandesRecord = columnCommandesRecordList[columnIndex];
                                                                                                            return Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                                                                                              child: StreamBuilder<CommandesRecord>(
                                                                                                                stream: CommandesRecord.getDocument(columnCommandesRecord.reference),
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
                                                                                                                  final columnCommandesRecord = snapshot.data!;
                                                                                                                  return Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 18),
                                                                                                                        child: Container(
                                                                                                                          width: MediaQuery.of(context).size.width,
                                                                                                                          height: 130,
                                                                                                                          constraints: BoxConstraints(
                                                                                                                            maxWidth: 400,
                                                                                                                          ),
                                                                                                                          decoration: BoxDecoration(
                                                                                                                            borderRadius: BorderRadius.circular(15),
                                                                                                                          ),
                                                                                                                          child: StreamBuilder<PrecommandeRecord>(
                                                                                                                            stream: PrecommandeRecord.getDocument(columnCommandesRecord.ref!),
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
                                                                                                                              final rowPrecommandeRecord = snapshot.data!;
                                                                                                                              return Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                children: [
                                                                                                                                  Expanded(
                                                                                                                                    child: Container(
                                                                                                                                      height: MediaQuery.of(context).size.height * 1,
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                        image: DecorationImage(
                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                          image: Image.network(
                                                                                                                                            '',
                                                                                                                                          ).image,
                                                                                                                                        ),
                                                                                                                                        borderRadius: BorderRadius.circular(20),
                                                                                                                                      ),
                                                                                                                                      child: StreamBuilder<List<PanierRecord>>(
                                                                                                                                        stream: queryPanierRecord(
                                                                                                                                          parent: columnCommandesRecord.client,
                                                                                                                                          queryBuilder: (panierRecord) => panierRecord.whereIn('ref', rowPrecommandeRecord.listecom!.toList()),
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
                                                                                                                                          List<PanierRecord> containerPanierRecordList = snapshot.data!;
                                                                                                                                          // Return an empty Container when the item does not exist.
                                                                                                                                          if (snapshot.data!.isEmpty) {
                                                                                                                                            return Container();
                                                                                                                                          }
                                                                                                                                          final containerPanierRecord = containerPanierRecordList.isNotEmpty ? containerPanierRecordList.first : null;
                                                                                                                                          return Container(
                                                                                                                                            width: 100,
                                                                                                                                            height: 100,
                                                                                                                                            decoration: BoxDecoration(
                                                                                                                                              borderRadius: BorderRadius.circular(20),
                                                                                                                                            ),
                                                                                                                                            child: Row(
                                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                              children: [
                                                                                                                                                Expanded(
                                                                                                                                                  child: Padding(
                                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                                                                                                                                                    child: StreamBuilder<ProduitsRecord>(
                                                                                                                                                      stream: ProduitsRecord.getDocument(containerPanierRecord!.prodRef!),
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
                                                                                                                                                        return Material(
                                                                                                                                                          color: Colors.transparent,
                                                                                                                                                          elevation: 2,
                                                                                                                                                          shape: RoundedRectangleBorder(
                                                                                                                                                            borderRadius: BorderRadius.circular(20),
                                                                                                                                                          ),
                                                                                                                                                          child: Container(
                                                                                                                                                            width: MediaQuery.of(context).size.width * 0.5,
                                                                                                                                                            height: double.infinity,
                                                                                                                                                            decoration: BoxDecoration(
                                                                                                                                                              color: Color(0x00FFFFFF),
                                                                                                                                                              image: DecorationImage(
                                                                                                                                                                fit: BoxFit.cover,
                                                                                                                                                                image: Image.network(
                                                                                                                                                                  containerProduitsRecord.image!,
                                                                                                                                                                ).image,
                                                                                                                                                              ),
                                                                                                                                                              borderRadius: BorderRadius.circular(20),
                                                                                                                                                            ),
                                                                                                                                                            child: Container(
                                                                                                                                                              decoration: BoxDecoration(
                                                                                                                                                                color: Color(0xA0FFFFFF),
                                                                                                                                                              ),
                                                                                                                                                              child: Padding(
                                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                                                                                                                                                child: InkWell(
                                                                                                                                                                  onTap: () async {
                                                                                                                                                                    context.pushNamed(
                                                                                                                                                                      'Tracking',
                                                                                                                                                                      queryParams: {
                                                                                                                                                                        'refTrack': serializeParam(
                                                                                                                                                                          rowPrecommandeRecord.reference,
                                                                                                                                                                          ParamType.DocumentReference,
                                                                                                                                                                        ),
                                                                                                                                                                      }.withoutNulls,
                                                                                                                                                                    );
                                                                                                                                                                  },
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
                                                                                                                                                                              rowPrecommandeRecord.nom!,
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
                                                                                                                                                                      Row(
                                                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                                                        children: [
                                                                                                                                                                          Expanded(
                                                                                                                                                                            child: Padding(
                                                                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
                                                                                                                                                                              child: Text(
                                                                                                                                                                                'client',
                                                                                                                                                                                textAlign: TextAlign.start,
                                                                                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                                                      fontFamily: 'sf pro text',
                                                                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                                                      fontSize: 13,
                                                                                                                                                                                      fontWeight: FontWeight.bold,
                                                                                                                                                                                      useGoogleFonts: false,
                                                                                                                                                                                    ),
                                                                                                                                                                              ),
                                                                                                                                                                            ),
                                                                                                                                                                          ),
                                                                                                                                                                          Expanded(
                                                                                                                                                                            child: Padding(
                                                                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                                                                                              child: StreamBuilder<UsersRecord>(
                                                                                                                                                                                stream: UsersRecord.getDocument(rowPrecommandeRecord.refcli!),
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
                                                                                                                                                                                  final textUsersRecord = snapshot.data!;
                                                                                                                                                                                  return Text(
                                                                                                                                                                                    textUsersRecord.displayName!,
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
                                                                                                                                                                      Row(
                                                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                                                        children: [
                                                                                                                                                                          Expanded(
                                                                                                                                                                            child: Padding(
                                                                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
                                                                                                                                                                              child: Text(
                                                                                                                                                                                'Heure livraison',
                                                                                                                                                                                textAlign: TextAlign.start,
                                                                                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                                                      fontFamily: 'sf pro text',
                                                                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                                                      fontSize: 13,
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
                                                                                                                                                                                dateTimeFormat(
                                                                                                                                                                                  'd/M H:mm',
                                                                                                                                                                                  rowPrecommandeRecord.heurelivre!,
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
                                                                                                                                                        );
                                                                                                                                                      },
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ],
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
                                                                                                                      ),
                                                                                                                      StreamBuilder<PrecommandeRecord>(
                                                                                                                        stream: PrecommandeRecord.getDocument(columnCommandesRecord.ref!),
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
                                                                                                                              context.pushNamed(
                                                                                                                                'listePanier',
                                                                                                                                queryParams: {
                                                                                                                                  'refPanier': serializeParam(
                                                                                                                                    buttonPrecommandeRecord.reference,
                                                                                                                                    ParamType.DocumentReference,
                                                                                                                                  ),
                                                                                                                                }.withoutNulls,
                                                                                                                              );
                                                                                                                            },
                                                                                                                            text: 'Voir le contenu',
                                                                                                                            options: FFButtonOptions(
                                                                                                                              width: double.infinity,
                                                                                                                              height: 40,
                                                                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                                                    fontFamily: 'sf pro text',
                                                                                                                                    color: Colors.white,
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
                                                                                                                    ],
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
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 5),
                                                                                                  child: StreamBuilder<List<CommandesRecord>>(
                                                                                                    stream: queryCommandesRecord(
                                                                                                      parent: currentUserReference,
                                                                                                      queryBuilder: (commandesRecord) => commandesRecord.where('paye', isEqualTo: false),
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
                                                                                                      List<CommandesRecord> columnCommandesRecordList = snapshot.data!;
                                                                                                      if (columnCommandesRecordList.isEmpty) {
                                                                                                        return Container(
                                                                                                          width: 300,
                                                                                                          child: UuuiiiWidget(),
                                                                                                        );
                                                                                                      }
                                                                                                      return SingleChildScrollView(
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                                          children: List.generate(columnCommandesRecordList.length, (columnIndex) {
                                                                                                            final columnCommandesRecord = columnCommandesRecordList[columnIndex];
                                                                                                            return Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                                                                                              child: StreamBuilder<CommandesRecord>(
                                                                                                                stream: CommandesRecord.getDocument(columnCommandesRecord.reference),
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
                                                                                                                  final columnCommandesRecord = snapshot.data!;
                                                                                                                  return Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 18),
                                                                                                                        child: Container(
                                                                                                                          width: MediaQuery.of(context).size.width,
                                                                                                                          height: 130,
                                                                                                                          constraints: BoxConstraints(
                                                                                                                            maxWidth: 400,
                                                                                                                          ),
                                                                                                                          decoration: BoxDecoration(
                                                                                                                            borderRadius: BorderRadius.circular(15),
                                                                                                                          ),
                                                                                                                          child: StreamBuilder<PrecommandeRecord>(
                                                                                                                            stream: PrecommandeRecord.getDocument(columnCommandesRecord.ref!),
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
                                                                                                                              final rowPrecommandeRecord = snapshot.data!;
                                                                                                                              return Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                children: [
                                                                                                                                  Expanded(
                                                                                                                                    child: Container(
                                                                                                                                      height: MediaQuery.of(context).size.height * 1,
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                        image: DecorationImage(
                                                                                                                                          fit: BoxFit.cover,
                                                                                                                                          image: Image.network(
                                                                                                                                            '',
                                                                                                                                          ).image,
                                                                                                                                        ),
                                                                                                                                        borderRadius: BorderRadius.circular(20),
                                                                                                                                      ),
                                                                                                                                      child: StreamBuilder<List<PanierRecord>>(
                                                                                                                                        stream: queryPanierRecord(
                                                                                                                                          parent: columnCommandesRecord.client,
                                                                                                                                          queryBuilder: (panierRecord) => panierRecord.whereIn('ref', rowPrecommandeRecord.listecom!.toList()),
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
                                                                                                                                          List<PanierRecord> containerPanierRecordList = snapshot.data!;
                                                                                                                                          // Return an empty Container when the item does not exist.
                                                                                                                                          if (snapshot.data!.isEmpty) {
                                                                                                                                            return Container();
                                                                                                                                          }
                                                                                                                                          final containerPanierRecord = containerPanierRecordList.isNotEmpty ? containerPanierRecordList.first : null;
                                                                                                                                          return Container(
                                                                                                                                            width: 100,
                                                                                                                                            height: 100,
                                                                                                                                            decoration: BoxDecoration(
                                                                                                                                              borderRadius: BorderRadius.circular(20),
                                                                                                                                            ),
                                                                                                                                            child: Row(
                                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                                              children: [
                                                                                                                                                Expanded(
                                                                                                                                                  child: Padding(
                                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                                                                                                                                                    child: StreamBuilder<ProduitsRecord>(
                                                                                                                                                      stream: ProduitsRecord.getDocument(containerPanierRecord!.prodRef!),
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
                                                                                                                                                        return Material(
                                                                                                                                                          color: Colors.transparent,
                                                                                                                                                          elevation: 2,
                                                                                                                                                          shape: RoundedRectangleBorder(
                                                                                                                                                            borderRadius: BorderRadius.circular(20),
                                                                                                                                                          ),
                                                                                                                                                          child: Container(
                                                                                                                                                            width: MediaQuery.of(context).size.width * 0.5,
                                                                                                                                                            height: double.infinity,
                                                                                                                                                            decoration: BoxDecoration(
                                                                                                                                                              color: Color(0x00FFFFFF),
                                                                                                                                                              image: DecorationImage(
                                                                                                                                                                fit: BoxFit.cover,
                                                                                                                                                                image: Image.network(
                                                                                                                                                                  containerProduitsRecord.image!,
                                                                                                                                                                ).image,
                                                                                                                                                              ),
                                                                                                                                                              borderRadius: BorderRadius.circular(20),
                                                                                                                                                            ),
                                                                                                                                                            child: Container(
                                                                                                                                                              decoration: BoxDecoration(
                                                                                                                                                                color: Color(0xA0FFFFFF),
                                                                                                                                                              ),
                                                                                                                                                              child: Padding(
                                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                                                                                                                                                child: InkWell(
                                                                                                                                                                  onTap: () async {
                                                                                                                                                                    context.pushNamed(
                                                                                                                                                                      'Tracking',
                                                                                                                                                                      queryParams: {
                                                                                                                                                                        'refTrack': serializeParam(
                                                                                                                                                                          rowPrecommandeRecord.reference,
                                                                                                                                                                          ParamType.DocumentReference,
                                                                                                                                                                        ),
                                                                                                                                                                      }.withoutNulls,
                                                                                                                                                                    );
                                                                                                                                                                  },
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
                                                                                                                                                                              rowPrecommandeRecord.nom!,
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
                                                                                                                                                                      Row(
                                                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                                                        children: [
                                                                                                                                                                          Expanded(
                                                                                                                                                                            child: Padding(
                                                                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
                                                                                                                                                                              child: Text(
                                                                                                                                                                                'client',
                                                                                                                                                                                textAlign: TextAlign.start,
                                                                                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                                                      fontFamily: 'sf pro text',
                                                                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                                                      fontSize: 13,
                                                                                                                                                                                      fontWeight: FontWeight.bold,
                                                                                                                                                                                      useGoogleFonts: false,
                                                                                                                                                                                    ),
                                                                                                                                                                              ),
                                                                                                                                                                            ),
                                                                                                                                                                          ),
                                                                                                                                                                          Expanded(
                                                                                                                                                                            child: Padding(
                                                                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                                                                                              child: StreamBuilder<UsersRecord>(
                                                                                                                                                                                stream: UsersRecord.getDocument(rowPrecommandeRecord.refcli!),
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
                                                                                                                                                                                  final textUsersRecord = snapshot.data!;
                                                                                                                                                                                  return Text(
                                                                                                                                                                                    textUsersRecord.displayName!,
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
                                                                                                                                                                      Row(
                                                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                                                        children: [
                                                                                                                                                                          Expanded(
                                                                                                                                                                            child: Padding(
                                                                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
                                                                                                                                                                              child: Text(
                                                                                                                                                                                'Heure livraison',
                                                                                                                                                                                textAlign: TextAlign.start,
                                                                                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                                                      fontFamily: 'sf pro text',
                                                                                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                                                      fontSize: 13,
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
                                                                                                                                                                                dateTimeFormat(
                                                                                                                                                                                  'd/M H:mm',
                                                                                                                                                                                  rowPrecommandeRecord.heurelivre!,
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
                                                                                                                                                        );
                                                                                                                                                      },
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ],
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
                                                                                                                      ),
                                                                                                                      StreamBuilder<PrecommandeRecord>(
                                                                                                                        stream: PrecommandeRecord.getDocument(columnCommandesRecord.ref!),
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
                                                                                                                              context.pushNamed(
                                                                                                                                'listePanier',
                                                                                                                                queryParams: {
                                                                                                                                  'refPanier': serializeParam(
                                                                                                                                    buttonPrecommandeRecord.reference,
                                                                                                                                    ParamType.DocumentReference,
                                                                                                                                  ),
                                                                                                                                }.withoutNulls,
                                                                                                                              );
                                                                                                                            },
                                                                                                                            text: 'Voir le contenu',
                                                                                                                            options: FFButtonOptions(
                                                                                                                              width: double.infinity,
                                                                                                                              height: 40,
                                                                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                                                    fontFamily: 'sf pro text',
                                                                                                                                    color: Colors.white,
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
                                                                                                                    ],
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
                                                                                              ],
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
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
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
                                                                    color: Color(
                                                                        0x00272B50),
                                                                  ),
                                                                  child: Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            12,
                                                                            0),
                                                                    child: Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              20,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
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
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                20,
                                                                                0,
                                                                                100),
                                                                            child:
                                                                                StreamBuilder<List<ProduitsRecord>>(
                                                                              stream:
                                                                                  queryProduitsRecord(
                                                                                queryBuilder: (produitsRecord) => produitsRecord.orderBy('vue', descending: true),
                                                                                limit: 10,
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
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
