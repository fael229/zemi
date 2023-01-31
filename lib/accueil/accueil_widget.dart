import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/backend.dart';
import '../components/detail_widget.dart';
import '../components/livraion_abo_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:touch_mouse_behavior/touch_mouse_behavior.dart';


class AccueilWidget extends StatefulWidget {
  const AccueilWidget({Key? key}) : super(key: key);

  @override
  _AccueilWidgetState createState() => _AccueilWidgetState();
}

class _AccueilWidgetState extends State<AccueilWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'circleImageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };
  List<ProduitsRecord>? algoliaSearchResults1 = [];
  TextEditingController? searchFieldController;
  List<ProduitsRecord>? algoliaSearchResults2 = [];
  TextEditingController? searchField232Controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!loggedIn) {
        context.goNamed('connexion');
      }
      if (valueOrDefault<bool>(currentUserDocument?.abonnLivraison, false) ==
          true) {
        if (functions.abo(
                currentUserDocument!.debutAbo!, getCurrentTimestamp) ==
            false) {
          final usersUpdateData = createUsersRecordData(
            abonnLivraison: false,
          );
          await currentUserReference!.update(usersUpdateData);
        }
      }
      if (FFAppState().isActive == true) {
        setDarkModeSetting(context, ThemeMode.light);
      } else {
        setDarkModeSetting(context, ThemeMode.dark);
      }

      FFAppState().update(() {
        FFAppState().prixDefaut = true;
        FFAppState().refFav = null;
      });
      FFAppState().update(() {
        FFAppState().qty = 1;
      });

      final lastConnexionHourUpdateData = createLastConnexionHourRecordData(
        last: getCurrentTimestamp,
      );
      await currentUserDocument!.last!.update(lastConnexionHourUpdateData);
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Accueil'});
    searchField232Controller = TextEditingController();
    searchFieldController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    searchField232Controller?.dispose();
    searchFieldController?.dispose();
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
          child: AuthUserStreamWidget(
            builder: (context) => Stack(
              children: [
                if (responsiveVisibility(
                  context: context,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(
                      color: Color(0x00272B50),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 45, 0, 0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 20, 0),
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
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 20,
                                            ),
                                          ),
                                        );
                                      }
                                      final rowUsersRecord = snapshot.data!;
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.7,
                                                decoration: BoxDecoration(
                                                  color: Color(0x00FFFFFF),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Bienvenu  ${rowUsersRecord.prenom}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'sf pro text',
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Icon(
                                                                  Icons.phone,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 20,
                                                                ),
                                                                Expanded(
                                                                  flex: 2,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: StreamBuilder<
                                                                        List<
                                                                            RideRecord>>(
                                                                      stream:
                                                                          queryRideRecord(
                                                                        singleRecord:
                                                                            true,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 20,
                                                                              height: 20,
                                                                              child: SpinKitPulse(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                size: 20,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<RideRecord>
                                                                            textRideRecordList =
                                                                            snapshot.data!;
                                                                        // Return an empty Container when the item does not exist.
                                                                        if (snapshot
                                                                            .data!
                                                                            .isEmpty) {
                                                                          return Container();
                                                                        }
                                                                        final textRideRecord = textRideRecordList.isNotEmpty
                                                                            ? textRideRecordList.first
                                                                            : null;
                                                                        return InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            await launchUrl(Uri(
                                                                              scheme: 'tel',
                                                                              path: textRideRecord!.userName!,
                                                                            ));
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'Service Client: ${textRideRecord!.userAddress}',
                                                                            maxLines:
                                                                                2,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'sf pro text',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 13,
                                                                                  fontWeight: FontWeight.w300,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        );
                                                                      },
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
                                            ],
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -0.6, -0.5),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.12,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.12,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 15,
                                                    color: Color(0x205A5A5A),
                                                    spreadRadius: 3,
                                                  )
                                                ],
                                                shape: BoxShape.circle,
                                              ),
                                              child: Container(
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  rowUsersRecord.photoUrl!,
                                                  fit: BoxFit.fill,
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'circleImageOnPageLoadAnimation']!),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 40,
                                      constraints: BoxConstraints(
                                        maxWidth: 500,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(28),
                                      ),
                                      child: TextFormField(
                                        controller: searchFieldController,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          'searchFieldController',
                                          Duration(milliseconds: 200),
                                          () async {
                                            setState(() =>
                                                algoliaSearchResults1 = null);
                                            await ProduitsRecord.search(
                                              term: searchFieldController!.text,
                                            )
                                                .then((r) =>
                                                    algoliaSearchResults1 = r)
                                                .onError((_, __) =>
                                                    algoliaSearchResults1 = [])
                                                .whenComplete(
                                                    () => setState(() {}));
                                          },
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2,
                                          hintText: 'Recherchez un plat ici',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(29),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(29),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(29),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(29),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  14, 24, 14, 24),
                                          prefixIcon: Icon(
                                            FFIcons.ksearchFael,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                          suffixIcon: searchFieldController!
                                                  .text.isNotEmpty
                                              ? InkWell(
                                                  onTap: () async {
                                                    searchFieldController
                                                        ?.clear();
                                                    setState(() =>
                                                        algoliaSearchResults1 =
                                                            null);
                                                    await ProduitsRecord.search(
                                                      term:
                                                          searchFieldController!
                                                              .text,
                                                    )
                                                        .then((r) =>
                                                            algoliaSearchResults1 =
                                                                r)
                                                        .onError((_, __) =>
                                                            algoliaSearchResults1 =
                                                                [])
                                                        .whenComplete(() =>
                                                            setState(() {}));
      
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
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                  ),
                                  if (searchFieldController!.text != null &&
                                      searchFieldController!.text != '')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  1,
                                              decoration: BoxDecoration(
                                                color: Color(0x00FFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: FutureBuilder<
                                                  List<ProduitsRecord>>(
                                                future: ProduitsRecord.search(
                                                  term: searchFieldController!
                                                      .text,
                                                ),
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
                                                  List<ProduitsRecord>
                                                      columnProduitsRecordList =
                                                      snapshot.data!;
                                                  // Customize what your widget looks like with no search results.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container(
                                                      height: 100,
                                                      child: Center(
                                                        child:
                                                            Text('No results.'),
                                                      ),
                                                    );
                                                  }
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        columnProduitsRecordList
                                                            .length,
                                                        (columnIndex) {
                                                      final columnProduitsRecord =
                                                          columnProduitsRecordList[
                                                              columnIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 0, 0),
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                          child: StreamBuilder<
                                                              ProduitsRecord>(
                                                            stream: ProduitsRecord
                                                                .getDocument(
                                                                    columnProduitsRecord
                                                                        .reference),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
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
                                                              final rowProduitsRecord =
                                                                  snapshot
                                                                      .data!;
                                                              return InkWell(
                                                                onTap:
                                                                    () async {
                                                                  FFAppState()
                                                                      .update(
                                                                          () {
                                                                    FFAppState()
                                                                            .prixDefaut =
                                                                        true;
                                                                    FFAppState()
                                                                            .refFav =
                                                                        null;
                                                                  });
                                                                  FFAppState()
                                                                      .update(
                                                                          () {
                                                                    FFAppState()
                                                                        .qty = 1;
                                                                  });
      
                                                                  final produitsUpdateData =
                                                                      {
                                                                    'vue': FieldValue
                                                                        .increment(
                                                                            1),
                                                                  };
                                                                  await rowProduitsRecord
                                                                      .reference
                                                                      .update(
                                                                          produitsUpdateData);
                                                                  showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return Padding(
                                                                        padding:
                                                                            MediaQuery.of(context).viewInsets,
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 1,
                                                                          child:
                                                                              DetailWidget(
                                                                            prodRef:
                                                                                rowProduitsRecord.reference,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      setState(
                                                                          () {}));
                                                                },
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      child: Image
                                                                          .network(
                                                                        rowProduitsRecord
                                                                            .image!,
                                                                        width:
                                                                            100,
                                                                        height:
                                                                            100,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            MediaQuery.of(context).size.height *
                                                                                1,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x00FFFFFF),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
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
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 20, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Pour vous',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'sf pro text',
                                                fontSize: 16,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            context.pushNamed('pourVous');
                                          },
                                          child: Text(
                                            'Voir plus',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'sf pro text',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 16, 0, 0),
                                    child: StreamBuilder<List<ProduitsRecord>>(
                                      stream: queryProduitsRecord(
                                        queryBuilder: (produitsRecord) =>
                                            produitsRecord.where('category',
                                                isNotEqualTo: 'Ravitaillement'),
                                        limit: 5,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: SpinKitPulse(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 20,
                                              ),
                                            ),
                                          );
                                        }
                                        List<ProduitsRecord>
                                            rowProduitsRecordList =
                                            snapshot.data!;
                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                rowProduitsRecordList.length,
                                                (rowIndex) {
                                              final rowProduitsRecord =
                                                  rowProduitsRecordList[
                                                      rowIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 12, 0),
                                                child: StreamBuilder<
                                                    ProduitsRecord>(
                                                  stream: ProduitsRecord
                                                      .getDocument(
                                                          rowProduitsRecord
                                                              .reference),
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
                                                    final containerProduitsRecord =
                                                        snapshot.data!;
                                                    return Container(
                                                      width: 230,
                                                      height: 300,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 400,
                                                        maxHeight: 300,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    9, 9, 9, 9),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .complet =
                                                                  false;
                                                              FFAppState()
                                                                      .refFav =
                                                                  null;
                                                            });
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState().qty =
                                                                  1;
                                                            });
      
                                                            final produitsUpdateData =
                                                                {
                                                              'vue': FieldValue
                                                                  .increment(1),
                                                            };
                                                            await containerProduitsRecord
                                                                .reference
                                                                .update(
                                                                    produitsUpdateData);
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      Container(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        1,
                                                                    child:
                                                                        DetailWidget(
                                                                      prodRef:
                                                                          containerProduitsRecord
                                                                              .reference,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          },
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Stack(
                                                                children: [
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: 170,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxHeight:
                                                                          170,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      image:
                                                                          DecorationImage(
                                                                        fit: BoxFit
                                                                            .fitHeight,
                                                                        image: Image
                                                                            .network(
                                                                          containerProduitsRecord
                                                                              .image!,
                                                                        ).image,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                    ),
                                                                  ),
                                                                  if (containerProduitsRecord
                                                                          .pourcentage !=
                                                                      0)
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          0.96,
                                                                          -0.95),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            8,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              50,
                                                                          height:
                                                                              40,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xAC40249B),
                                                                            borderRadius:
                                                                                BorderRadius.circular(2),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              SelectionArea(
                                                                                  child: Text(
                                                                                '- ${containerProduitsRecord.pourcentage?.toString()} %',
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'sf pro text',
                                                                                      color: Colors.white,
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                              )),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          8,
                                                                          0,
                                                                          0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0x00FFFFFF),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    '${dateTimeFormat(
                                                                      'Hm',
                                                                      containerProduitsRecord
                                                                          .ouv,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    )} - ${dateTimeFormat(
                                                                      'Hm',
                                                                      containerProduitsRecord
                                                                          .clo,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    )}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'sf pro text',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              12,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  RatingBarIndicator(
                                                                    itemBuilder:
                                                                        (context,
                                                                                index) =>
                                                                            Icon(
                                                                      Icons
                                                                          .star_rounded,
                                                                      color: Color(
                                                                          0xFFFFCC53),
                                                                    ),
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    rating: functions.rate(
                                                                        containerProduitsRecord
                                                                            .note!
                                                                            .toList(),
                                                                        containerProduitsRecord
                                                                            .note!
                                                                            .toList()
                                                                            .length),
                                                                    unratedColor:
                                                                        Color(
                                                                            0xFF9E9E9E),
                                                                    itemCount:
                                                                        5,
                                                                    itemSize:
                                                                        18,
                                                                  ),
                                                                  Container(
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          140,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              5,
                                                                              5,
                                                                              5,
                                                                              5),
                                                                      child:
                                                                          Text(
                                                                        () {
                                                                          if (containerProduitsRecord.multi ==
                                                                              false) {
                                                                            return '${functions.reduce(functions.multippl(containerProduitsRecord.prix!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
                                                                          } else if ((containerProduitsRecord.multi == true) &&
                                                                              (FFAppState().prixDefaut == false)) {
                                                                            return '${functions.reduce(functions.multippl(containerProduitsRecord.prixComplet!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
                                                                          } else {
                                                                            return '${functions.reduce(functions.multippl(containerProduitsRecord.prixDemi!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
                                                                          }
                                                                        }(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
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
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                              child: FutureBuilder<List<CatRecord>>(
                                future: queryCatRecordOnce(
                                  queryBuilder: (catRecord) => catRecord.where(
                                      'nom',
                                      isEqualTo: 'Ravitaillement'),
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 20,
                                        ),
                                      ),
                                    );
                                  }
                                  List<CatRecord> columnCatRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final columnCatRecord =
                                      columnCatRecordList.isNotEmpty
                                          ? columnCatRecordList.first
                                          : null;
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Ravitaillement Tchéké',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'sf pro text',
                                                        fontSize: 16,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                context.pushNamed(
                                                    'Ravitaillemant');
                                              },
                                              child: Text(
                                                'Voir plus',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'sf pro text',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 16, 0, 0),
                                        child:
                                            StreamBuilder<List<DetailsRecord>>(
                                          stream: queryDetailsRecord(
                                            parent: columnCatRecord!.reference,
                                            queryBuilder: (detailsRecord) =>
                                                detailsRecord.orderBy('nbr',
                                                    descending: true),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child: SpinKitPulse(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 20,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<DetailsRecord>
                                                rowDetailsRecordList =
                                                snapshot.data!;
                                            return SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    rowDetailsRecordList.length,
                                                    (rowIndex) {
                                                  final rowDetailsRecord =
                                                      rowDetailsRecordList[
                                                          rowIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 10, 0),
                                                    child: StreamBuilder<
                                                        DetailsRecord>(
                                                      stream: DetailsRecord
                                                          .getDocument(
                                                              rowDetailsRecord
                                                                  .reference),
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
                                                        final containerDetailsRecord =
                                                            snapshot.data!;
                                                        return InkWell(
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'catDetails2',
                                                              queryParams: {
                                                                'refDet':
                                                                    serializeParam(
                                                                  containerDetailsRecord
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 250,
                                                            height: 140,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              image:
                                                                  DecorationImage(
                                                                fit:
                                                                    BoxFit.fill,
                                                                image: Image
                                                                    .network(
                                                                  containerDetailsRecord
                                                                      .img!,
                                                                ).image,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
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
                                    ],
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                              child: FutureBuilder<List<CatRecord>>(
                                future: queryCatRecordOnce(
                                  queryBuilder: (catRecord) => catRecord.where(
                                      'nom',
                                      isEqualTo: 'Ravitaillement'),
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 20,
                                        ),
                                      ),
                                    );
                                  }
                                  List<CatRecord> columnCatRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final columnCatRecord =
                                      columnCatRecordList.isNotEmpty
                                          ? columnCatRecordList.first
                                          : null;
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Packages Ravitaillement',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'sf pro text',
                                                        fontSize: 16,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                            StreamBuilder<List<DetailsRecord>>(
                                              stream: queryDetailsRecord(
                                                parent:
                                                    columnCatRecord!.reference,
                                                queryBuilder: (detailsRecord) =>
                                                    detailsRecord.where('nom',
                                                        isEqualTo: 'Packages'),
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 20,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<DetailsRecord>
                                                    textDetailsRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final textDetailsRecord =
                                                    textDetailsRecordList
                                                            .isNotEmpty
                                                        ? textDetailsRecordList
                                                            .first
                                                        : null;
                                                return InkWell(
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'catDetails2',
                                                      queryParams: {
                                                        'refcat':
                                                            serializeParam(
                                                          columnCatRecord!
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                        'refDet':
                                                            serializeParam(
                                                          textDetailsRecord!
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Text(
                                                    'Voir plus',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'sf pro text',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          useGoogleFonts: false,
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
                                            20, 16, 0, 0),
                                        child:
                                            StreamBuilder<List<ProduitsRecord>>(
                                          stream: queryProduitsRecord(
                                            queryBuilder: (produitsRecord) =>
                                                produitsRecord
                                                    .where('category',
                                                        isEqualTo:
                                                            'Ravitaillement')
                                                    .where('catList',
                                                        arrayContains:
                                                            'Packages'),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child: SpinKitPulse(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 20,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<ProduitsRecord>
                                                rowProduitsRecordList =
                                                snapshot.data!;
                                            return SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    rowProduitsRecordList
                                                        .length, (rowIndex) {
                                                  final rowProduitsRecord =
                                                      rowProduitsRecordList[
                                                          rowIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 12, 0),
                                                    child: StreamBuilder<
                                                        ProduitsRecord>(
                                                      stream: ProduitsRecord
                                                          .getDocument(
                                                              rowProduitsRecord
                                                                  .reference),
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
                                                        final containerProduitsRecord =
                                                            snapshot.data!;
                                                        return Container(
                                                          width: 230,
                                                          height: 300,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 400,
                                                            maxHeight: 300,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        9,
                                                                        9,
                                                                        9,
                                                                        9),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .complet =
                                                                      false;
                                                                  FFAppState()
                                                                          .refFav =
                                                                      null;
                                                                });
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                      .qty = 1;
                                                                });
      
                                                                final produitsUpdateData =
                                                                    {
                                                                  'vue': FieldValue
                                                                      .increment(
                                                                          1),
                                                                };
                                                                await containerProduitsRecord
                                                                    .reference
                                                                    .update(
                                                                        produitsUpdateData);
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return Padding(
                                                                      padding: MediaQuery.of(
                                                                              context)
                                                                          .viewInsets,
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            MediaQuery.of(context).size.height *
                                                                                1,
                                                                        child:
                                                                            DetailWidget(
                                                                          prodRef:
                                                                              containerProduitsRecord.reference,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));
                                                              },
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Stack(
                                                                    children: [
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            170,
                                                                        constraints:
                                                                            BoxConstraints(
                                                                          maxHeight:
                                                                              170,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          image:
                                                                              DecorationImage(
                                                                            fit:
                                                                                BoxFit.fitHeight,
                                                                            image:
                                                                                Image.network(
                                                                              containerProduitsRecord.image!,
                                                                            ).image,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(15),
                                                                        ),
                                                                      ),
                                                                      if (containerProduitsRecord
                                                                              .pourcentage !=
                                                                          0)
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.96,
                                                                              -0.95),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                8,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Container(
                                                                              width: 50,
                                                                              height: 40,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xAC40249B),
                                                                                borderRadius: BorderRadius.circular(2),
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  SelectionArea(
                                                                                      child: Text(
                                                                                    '- ${containerProduitsRecord.pourcentage?.toString()} %',
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'sf pro text',
                                                                                          color: Colors.white,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  )),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              8,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
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
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        '${dateTimeFormat(
                                                                          'Hm',
                                                                          containerProduitsRecord
                                                                              .ouv,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )} - ${dateTimeFormat(
                                                                          'Hm',
                                                                          containerProduitsRecord
                                                                              .clo,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'sf pro text',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 12,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      RatingBarIndicator(
                                                                        itemBuilder:
                                                                            (context, index) =>
                                                                                Icon(
                                                                          Icons
                                                                              .star_rounded,
                                                                          color:
                                                                              Color(0xFFFFCC53),
                                                                        ),
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        rating: functions.rate(
                                                                            containerProduitsRecord.note!.toList(),
                                                                            containerProduitsRecord.note!.toList().length),
                                                                        unratedColor:
                                                                            Color(0xFF9E9E9E),
                                                                        itemCount:
                                                                            5,
                                                                        itemSize:
                                                                            18,
                                                                      ),
                                                                      Container(
                                                                        constraints:
                                                                            BoxConstraints(
                                                                          maxWidth:
                                                                              140,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5,
                                                                              5,
                                                                              5,
                                                                              5),
                                                                          child:
                                                                              Text(
                                                                            () {
                                                                              if (containerProduitsRecord.multi == false) {
                                                                                return '${functions.reduce(functions.multippl(containerProduitsRecord.prix!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
                                                                              } else if ((containerProduitsRecord.multi == true) && (FFAppState().prixDefaut == false)) {
                                                                                return '${functions.reduce(functions.multippl(containerProduitsRecord.prixComplet!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
                                                                              } else {
                                                                                return '${functions.reduce(functions.multippl(containerProduitsRecord.prixDemi!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
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
                                    ],
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                              child: FutureBuilder<List<CatRecord>>(
                                future: queryCatRecordOnce(
                                  queryBuilder: (catRecord) => catRecord.where(
                                      'nom',
                                      isEqualTo: 'Ravitaillement'),
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 20,
                                        ),
                                      ),
                                    );
                                  }
                                  List<CatRecord> columnCatRecordList =
                                      snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final columnCatRecord =
                                      columnCatRecordList.isNotEmpty
                                          ? columnCatRecordList.first
                                          : null;
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Le meilleur du ravitaillement',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'sf pro text',
                                                        fontSize: 16,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                context.pushNamed(
                                                    'Ravitaillemant');
                                              },
                                              child: Text(
                                                'Voir plus',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'sf pro text',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 16, 0, 0),
                                        child:
                                            StreamBuilder<List<ProduitsRecord>>(
                                          stream: queryProduitsRecord(
                                            queryBuilder: (produitsRecord) =>
                                                produitsRecord.where('category',
                                                    isEqualTo:
                                                        'Ravitaillement'),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child: SpinKitPulse(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 20,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<ProduitsRecord>
                                                rowProduitsRecordList =
                                                snapshot.data!;
                                            return SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    rowProduitsRecordList
                                                        .length, (rowIndex) {
                                                  final rowProduitsRecord =
                                                      rowProduitsRecordList[
                                                          rowIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 12, 0),
                                                    child: StreamBuilder<
                                                        ProduitsRecord>(
                                                      stream: ProduitsRecord
                                                          .getDocument(
                                                              rowProduitsRecord
                                                                  .reference),
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
                                                        final containerProduitsRecord =
                                                            snapshot.data!;
                                                        return Container(
                                                          width: 230,
                                                          height: 300,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 400,
                                                            maxHeight: 300,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        9,
                                                                        9,
                                                                        9,
                                                                        9),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                          .complet =
                                                                      false;
                                                                  FFAppState()
                                                                          .refFav =
                                                                      null;
                                                                });
                                                                FFAppState()
                                                                    .update(() {
                                                                  FFAppState()
                                                                      .qty = 1;
                                                                });
      
                                                                final produitsUpdateData =
                                                                    {
                                                                  'vue': FieldValue
                                                                      .increment(
                                                                          1),
                                                                };
                                                                await containerProduitsRecord
                                                                    .reference
                                                                    .update(
                                                                        produitsUpdateData);
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return Padding(
                                                                      padding: MediaQuery.of(
                                                                              context)
                                                                          .viewInsets,
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            MediaQuery.of(context).size.height *
                                                                                1,
                                                                        child:
                                                                            DetailWidget(
                                                                          prodRef:
                                                                              containerProduitsRecord.reference,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    setState(
                                                                        () {}));
                                                              },
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Stack(
                                                                    children: [
                                                                      Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            170,
                                                                        constraints:
                                                                            BoxConstraints(
                                                                          maxHeight:
                                                                              170,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          image:
                                                                              DecorationImage(
                                                                            fit:
                                                                                BoxFit.fitHeight,
                                                                            image:
                                                                                Image.network(
                                                                              containerProduitsRecord.image!,
                                                                            ).image,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(15),
                                                                        ),
                                                                      ),
                                                                      if (containerProduitsRecord
                                                                              .pourcentage !=
                                                                          0)
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.96,
                                                                              -0.95),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                8,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Container(
                                                                              width: 50,
                                                                              height: 40,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xAC40249B),
                                                                                borderRadius: BorderRadius.circular(2),
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  SelectionArea(
                                                                                      child: Text(
                                                                                    '- ${containerProduitsRecord.pourcentage?.toString()} %',
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'sf pro text',
                                                                                          color: Colors.white,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  )),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              8,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
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
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        '${dateTimeFormat(
                                                                          'Hm',
                                                                          containerProduitsRecord
                                                                              .ouv,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )} - ${dateTimeFormat(
                                                                          'Hm',
                                                                          containerProduitsRecord
                                                                              .clo,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'sf pro text',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 12,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      RatingBarIndicator(
                                                                        itemBuilder:
                                                                            (context, index) =>
                                                                                Icon(
                                                                          Icons
                                                                              .star_rounded,
                                                                          color:
                                                                              Color(0xFFFFCC53),
                                                                        ),
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        rating: functions.rate(
                                                                            containerProduitsRecord.note!.toList(),
                                                                            containerProduitsRecord.note!.toList().length),
                                                                        unratedColor:
                                                                            Color(0xFF9E9E9E),
                                                                        itemCount:
                                                                            5,
                                                                        itemSize:
                                                                            18,
                                                                      ),
                                                                      Container(
                                                                        constraints:
                                                                            BoxConstraints(
                                                                          maxWidth:
                                                                              140,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5,
                                                                              5,
                                                                              5,
                                                                              5),
                                                                          child:
                                                                              Text(
                                                                            () {
                                                                              if (containerProduitsRecord.multi == false) {
                                                                                return '${functions.reduce(functions.multippl(containerProduitsRecord.prix!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
                                                                              } else if ((containerProduitsRecord.multi == true) && (FFAppState().prixDefaut == false)) {
                                                                                return '${functions.reduce(functions.multippl(containerProduitsRecord.prixComplet!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
                                                                              } else {
                                                                                return '${functions.reduce(functions.multippl(containerProduitsRecord.prixDemi!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
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
                                    ],
                                  );
                                },
                              ),
                            ),
                            if (valueOrDefault<bool>(
                                    currentUserDocument?.abonnLivraison,
                                    false) ==
                                false)
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                child:
                                    StreamBuilder<List<FraisLivraisonRecord>>(
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 20,
                                          ),
                                        ),
                                      );
                                    }
                                    List<FraisLivraisonRecord>
                                        rowFraisLivraisonRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final rowFraisLivraisonRecord =
                                        rowFraisLivraisonRecordList.isNotEmpty
                                            ? rowFraisLivraisonRecordList.first
                                            : null;
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Stack(
                                          children: [
                                            ClipRect(
                                              child: ImageFiltered(
                                                imageFilter: ImageFilter.blur(
                                                  sigmaX: 3,
                                                  sigmaY: 3,
                                                ),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 150,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.asset(
                                                        'assets/images/IMG_1261-1200x1068_(1).png',
                                                      ).image,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 150,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor2,
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -0.01, -0.26),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 10, 0),
                                                      child: Text(
                                                        'Profitez maintenant d\'un service de livraison en illimité avec seulement 5000 FCFA par mois',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 15, 0, 0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                  height: 500,
                                                                  child:
                                                                      LivraionAboWidget(),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));
                                                        },
                                                        text:
                                                            'Commencez Maintenant',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 230,
                                                          height: 40,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  StreamBuilder<List<ProduitsRecord>>(
                                    stream: queryProduitsRecord(
                                      queryBuilder: (produitsRecord) =>
                                          produitsRecord
                                              .where('pourcentage',
                                                  isNotEqualTo: 0)
                                              .orderBy('pourcentage',
                                                  descending: true),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 20,
                                            ),
                                          ),
                                        );
                                      }
                                      List<ProduitsRecord>
                                          containerProduitsRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the item does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final containerProduitsRecord =
                                          containerProduitsRecordList.isNotEmpty
                                              ? containerProduitsRecordList
                                                  .first
                                              : null;
                                      return Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Color(0x00FFFFFF),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 0, 20, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Réductions',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'sf pro text',
                                                          fontSize: 16,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  context
                                                      .pushNamed('Reduction');
                                                },
                                                child: Text(
                                                  'Voir plus',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'sf pro text',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 16, 0, 0),
                                    child: StreamBuilder<List<ProduitsRecord>>(
                                      stream: queryProduitsRecord(
                                        queryBuilder: (produitsRecord) =>
                                            produitsRecord
                                                .where('pourcentage',
                                                    isNotEqualTo: 0)
                                                .orderBy('pourcentage',
                                                    descending: true),
                                        limit: 5,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: SpinKitPulse(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 20,
                                              ),
                                            ),
                                          );
                                        }
                                        List<ProduitsRecord>
                                            rowProduitsRecordList =
                                            snapshot.data!;
                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: List.generate(
                                                rowProduitsRecordList.length,
                                                (rowIndex) {
                                              final rowProduitsRecord =
                                                  rowProduitsRecordList[
                                                      rowIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 12, 0),
                                                child: StreamBuilder<
                                                    ProduitsRecord>(
                                                  stream: ProduitsRecord
                                                      .getDocument(
                                                          rowProduitsRecord
                                                              .reference),
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
                                                    final containerProduitsRecord =
                                                        snapshot.data!;
                                                    return Container(
                                                      width: 230,
                                                      height: 300,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 400,
                                                        maxHeight: 300,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    9, 9, 9, 9),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .complet =
                                                                  false;
                                                              FFAppState()
                                                                      .refFav =
                                                                  null;
                                                            });
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState().qty =
                                                                  1;
                                                            });
      
                                                            final produitsUpdateData =
                                                                {
                                                              'vue': FieldValue
                                                                  .increment(1),
                                                            };
                                                            await containerProduitsRecord
                                                                .reference
                                                                .update(
                                                                    produitsUpdateData);
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      Container(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        1,
                                                                    child:
                                                                        DetailWidget(
                                                                      prodRef:
                                                                          containerProduitsRecord
                                                                              .reference,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          },
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Stack(
                                                                children: [
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: 170,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxHeight:
                                                                          170,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      image:
                                                                          DecorationImage(
                                                                        fit: BoxFit
                                                                            .fitHeight,
                                                                        image: Image
                                                                            .network(
                                                                          containerProduitsRecord
                                                                              .image!,
                                                                        ).image,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                    ),
                                                                  ),
                                                                  if (containerProduitsRecord
                                                                          .pourcentage !=
                                                                      0)
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          0.96,
                                                                          -0.95),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            8,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              50,
                                                                          height:
                                                                              40,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xAC40249B),
                                                                            borderRadius:
                                                                                BorderRadius.circular(2),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              SelectionArea(
                                                                                  child: Text(
                                                                                '- ${containerProduitsRecord.pourcentage?.toString()} %',
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'sf pro text',
                                                                                      color: Colors.white,
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                              )),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          8,
                                                                          0,
                                                                          0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0x00FFFFFF),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    '${dateTimeFormat(
                                                                      'Hm',
                                                                      containerProduitsRecord
                                                                          .ouv,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    )} - ${dateTimeFormat(
                                                                      'Hm',
                                                                      containerProduitsRecord
                                                                          .clo,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    )}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'sf pro text',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              12,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  RatingBarIndicator(
                                                                    itemBuilder:
                                                                        (context,
                                                                                index) =>
                                                                            Icon(
                                                                      Icons
                                                                          .star_rounded,
                                                                      color: Color(
                                                                          0xFFFFCC53),
                                                                    ),
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    rating: functions.rate(
                                                                        containerProduitsRecord
                                                                            .note!
                                                                            .toList(),
                                                                        containerProduitsRecord
                                                                            .note!
                                                                            .toList()
                                                                            .length),
                                                                    unratedColor:
                                                                        Color(
                                                                            0xFF9E9E9E),
                                                                    itemCount:
                                                                        5,
                                                                    itemSize:
                                                                        18,
                                                                  ),
                                                                  Container(
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          140,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              5,
                                                                              5,
                                                                              5,
                                                                              5),
                                                                      child:
                                                                          Text(
                                                                        () {
                                                                          if (containerProduitsRecord.multi ==
                                                                              false) {
                                                                            return '${functions.multippl(containerProduitsRecord.prix!, FFAppState().qty).toString()} FCFA';
                                                                          } else if ((containerProduitsRecord.multi == true) &&
                                                                              (FFAppState().prixDefaut == false)) {
                                                                            return '${functions.multippl(containerProduitsRecord.prixComplet!, FFAppState().qty).toString()} FCFA';
                                                                          } else {
                                                                            return '${functions.multippl(containerProduitsRecord.prixDemi!, FFAppState().qty).toString()} FCFA';
                                                                          }
                                                                        }(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
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
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Stack(
                                    children: [
                                      ClipRect(
                                        child: ImageFiltered(
                                          imageFilter: ImageFilter.blur(
                                            sigmaX: 3,
                                            sigmaY: 3,
                                          ),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 150,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.asset(
                                                  'assets/images/IMG_1261-1200x1068_(1).png',
                                                ).image,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          color: Color(0x60FFFFFF),
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(
                                              -0.01, -0.26),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 15, 0, 0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                        'Abonnement');
                                                  },
                                                  text: 'Abonnement sur Mesure',
                                                  options: FFButtonOptions(
                                                    width: 230,
                                                    height: 40,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              'sf pro text',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          useGoogleFonts: false,
                                                        ),
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
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
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 20, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Explorez  les Catégories',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'sf pro text',
                                                fontSize: 16,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            context.pushNamed('category');
                                          },
                                          child: Text(
                                            'Voir plus',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'sf pro text',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 18, 0, 0),
                                    child: StreamBuilder<List<CatRecord>>(
                                      stream: queryCatRecord(
                                        queryBuilder: (catRecord) =>
                                            catRecord.where('nom',
                                                isNotEqualTo: 'Ravitaillement'),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: SpinKitPulse(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 20,
                                              ),
                                            ),
                                          );
                                        }
                                        List<CatRecord> rowCatRecordList =
                                            snapshot.data!;
                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: List.generate(
                                                rowCatRecordList.length,
                                                (rowIndex) {
                                              final rowCatRecord =
                                                  rowCatRecordList[rowIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 12, 0),
                                                child: StreamBuilder<CatRecord>(
                                                  stream: CatRecord.getDocument(
                                                      rowCatRecord.reference),
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
                                                    final containerCatRecord =
                                                        snapshot.data!;
                                                    return Container(
                                                      width: 100,
                                                      height: 120,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 100,
                                                        maxHeight: 135,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? Color(0xFF24272E)
                                                            : Color(0xB739D2C0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10,
                                                                    10, 10, 10),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'catDetails',
                                                              queryParams: {
                                                                'refcat':
                                                                    serializeParam(
                                                                  containerCatRecord
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Image.network(
                                                                containerCatRecord
                                                                    .img!,
                                                                height: 50,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            8,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  containerCatRecord
                                                                      .nom!,
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'sf pro text',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            3,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  '${containerCatRecord.nbr?.toString()} Plats',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'sf pro text',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            11,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 16, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Stack(
                                          children: [
                                            ClipRect(
                                              child: ImageFiltered(
                                                imageFilter: ImageFilter.blur(
                                                  sigmaX: 3,
                                                  sigmaY: 3,
                                                ),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 80,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF52DD52),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Color(0x60FFFFFF),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -0.01, -0.26),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 15, 0, 0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          await launchURL(
                                                              'https://wa.me/22953037600?text=Bonjour%20et%20bienvenue%20chez%20Zemfood,%20faites%20votre%20liste%20de%20commande%20ici');
                                                        },
                                                        text:
                                                            'Commandez sur Whatsapp',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 230,
                                                          height: 40,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle2
                                                                  .override(
                                                                    fontFamily:
                                                                        'sf pro text',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        13,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
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
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 20, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Nos Recommandations',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'sf pro text',
                                                fontSize: 16,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            context.pushNamed(
                                                'nosRecommandations');
                                          },
                                          child: Text(
                                            'Voir plus',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'sf pro text',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 16, 0, 10),
                                    child: StreamBuilder<List<ProduitsRecord>>(
                                      stream: queryProduitsRecord(
                                        queryBuilder: (produitsRecord) =>
                                            produitsRecord
                                                .where('moyenne',
                                                    isGreaterThanOrEqualTo: 4.0)
                                                .orderBy('moyenne',
                                                    descending: true),
                                        limit: 5,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: SpinKitPulse(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 20,
                                              ),
                                            ),
                                          );
                                        }
                                        List<ProduitsRecord>
                                            rowProduitsRecordList =
                                            snapshot.data!;
                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                rowProduitsRecordList.length,
                                                (rowIndex) {
                                              final rowProduitsRecord =
                                                  rowProduitsRecordList[
                                                      rowIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 12, 0),
                                                child: StreamBuilder<
                                                    ProduitsRecord>(
                                                  stream: ProduitsRecord
                                                      .getDocument(
                                                          rowProduitsRecord
                                                              .reference),
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
                                                    final containerProduitsRecord =
                                                        snapshot.data!;
                                                    return Container(
                                                      width: 230,
                                                      height: 300,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 400,
                                                        maxHeight: 300,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    9, 9, 9, 9),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .prixDefaut =
                                                                  true;
                                                              FFAppState()
                                                                      .complet =
                                                                  false;
                                                            });
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .refFav =
                                                                  null;
                                                              FFAppState().qty =
                                                                  1;
                                                            });
      
                                                            final produitsUpdateData =
                                                                {
                                                              'vue': FieldValue
                                                                  .increment(1),
                                                            };
                                                            await containerProduitsRecord
                                                                .reference
                                                                .update(
                                                                    produitsUpdateData);
                                                            showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      Container(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        1,
                                                                    child:
                                                                        DetailWidget(
                                                                      prodRef:
                                                                          containerProduitsRecord
                                                                              .reference,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          },
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Stack(
                                                                children: [
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: 150,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxHeight:
                                                                          150,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      image:
                                                                          DecorationImage(
                                                                        fit: BoxFit
                                                                            .fitHeight,
                                                                        image: Image
                                                                            .network(
                                                                          containerProduitsRecord
                                                                              .image!,
                                                                        ).image,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                    ),
                                                                  ),
                                                                  if (containerProduitsRecord
                                                                          .pourcentage !=
                                                                      0)
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          0.96,
                                                                          -0.95),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            8,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              50,
                                                                          height:
                                                                              40,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xAC40249B),
                                                                            borderRadius:
                                                                                BorderRadius.circular(2),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              SelectionArea(
                                                                                  child: Text(
                                                                                '- ${containerProduitsRecord.pourcentage?.toString()} %',
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'sf pro text',
                                                                                      color: Colors.white,
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                              )),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          8,
                                                                          0,
                                                                          0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0x00FFFFFF),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    '${dateTimeFormat(
                                                                      'Hm',
                                                                      containerProduitsRecord
                                                                          .ouv,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    )} - ${dateTimeFormat(
                                                                      'Hm',
                                                                      containerProduitsRecord
                                                                          .clo,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    )}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'sf pro text',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              12,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        containerProduitsRecord
                                                                            .moyenne!
                                                                            .toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1,
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            3,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .star_rate,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            5,
                                                                            0,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5,
                                                                            5,
                                                                            5,
                                                                            5),
                                                                        child:
                                                                            Text(
                                                                          () {
                                                                            if (containerProduitsRecord.multi ==
                                                                                false) {
                                                                              return '${functions.multippl(containerProduitsRecord.prix!, FFAppState().qty).toString()} FCFA';
                                                                            } else if ((containerProduitsRecord.multi == true) &&
                                                                                (FFAppState().prixDefaut == false)) {
                                                                              return '${functions.multippl(containerProduitsRecord.prixComplet!, FFAppState().qty).toString()} FCFA';
                                                                            } else {
                                                                              return '${functions.multippl(containerProduitsRecord.prixDemi!, FFAppState().qty).toString()} FCFA';
                                                                            }
                                                                          }(),
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'sf pro text',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 16,
                                                                                useGoogleFonts: false,
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
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 16, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 16, 0, 10),
                                          child: StreamBuilder<
                                              List<BanniereRecord>>(
                                            stream: queryBanniereRecord(
                                              queryBuilder: (banniereRecord) =>
                                                  banniereRecord.orderBy(
                                                      'priorite',
                                                      descending: true),
                                            ),
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
                                              List<BanniereRecord>
                                                  rowBanniereRecordList =
                                                  snapshot.data!;
                                              return SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      rowBanniereRecordList
                                                          .length, (rowIndex) {
                                                    final rowBanniereRecord =
                                                        rowBanniereRecordList[
                                                            rowIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 12, 0),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .prixDefaut =
                                                                true;
                                                            FFAppState()
                                                                    .complet =
                                                                false;
                                                          });
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                .refFav = null;
                                                            FFAppState().qty =
                                                                1;
                                                          });
      
                                                          final produitsUpdateData =
                                                              {
                                                            'vue': FieldValue
                                                                .increment(1),
                                                          };
                                                          await rowBanniereRecord
                                                              .lien!
                                                              .update(
                                                                  produitsUpdateData);
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      1,
                                                                  child:
                                                                      DetailWidget(
                                                                    prodRef:
                                                                        rowBanniereRecord
                                                                            .lien,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));
                                                        },
                                                        child: Container(
                                                          width: 270,
                                                          height: 140,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 300,
                                                            maxHeight: 140,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            image:
                                                                DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image:
                                                                  Image.network(
                                                                rowBanniereRecord
                                                                    .img!,
                                                              ).image,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                              child: Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                constraints: BoxConstraints(
                                  maxHeight: 600,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 10, 20),
                                  child: DefaultTabController(
                                    length: 5,
                                    initialIndex: 0,
                                    child: Column(
                                      children: [
                                        TabBar(
                                          isScrollable: true,
                                          labelColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryColor,
                                          unselectedLabelColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle1
                                                  .override(
                                                    fontFamily: 'sf pro text',
                                                    fontSize: 16,
                                                    useGoogleFonts: false,
                                                  ),
                                          indicatorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryColor,
                                          indicatorWeight: 2,
                                          tabs: [
                                            Tab(
                                              text: 'Tendance',
                                            ),
                                            Tab(
                                              text: 'Populaire',
                                            ),
                                            Tab(
                                              text: 'Nouveauté',
                                            ),
                                            Tab(
                                              text: 'Les mieux notés',
                                            ),
                                            Tab(
                                              text: 'Les plus commenté',
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: TabBarView(
                                            children: [
                                              KeepAliveWidgetWrapper(
                                                builder: (context) => Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 16, 0, 50),
                                                  child: StreamBuilder<
                                                      List<ProduitsRecord>>(
                                                    stream: queryProduitsRecord(
                                                      queryBuilder:
                                                          (produitsRecord) =>
                                                              produitsRecord
                                                                  .orderBy(
                                                                      'nbreFav',
                                                                      descending:
                                                                          true),
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 20,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<ProduitsRecord>
                                                          columnProduitsRecordList =
                                                          snapshot.data!;
                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                              columnProduitsRecordList
                                                                  .length,
                                                              (columnIndex) {
                                                            final columnProduitsRecord =
                                                                columnProduitsRecordList[
                                                                    columnIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          4,
                                                                          10,
                                                                          0),
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
                                                                  color: Color(
                                                                      0x001E2039),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                                child: StreamBuilder<
                                                                    ProduitsRecord>(
                                                                  stream: ProduitsRecord
                                                                      .getDocument(
                                                                          columnProduitsRecord
                                                                              .reference),
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
                                                                    final rowProduitsRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().prixDefaut =
                                                                              true;
                                                                          FFAppState().complet =
                                                                              false;
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().refFav =
                                                                              null;
                                                                          FFAppState().qty =
                                                                              1;
                                                                        });
      
                                                                        final produitsUpdateData =
                                                                            {
                                                                          'vue':
                                                                              FieldValue.increment(1),
                                                                        };
                                                                        await rowProduitsRecord
                                                                            .reference
                                                                            .update(produitsUpdateData);
                                                                        showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
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
                                                                        ).then((value) =>
                                                                            setState(() {}));
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                            child:
                                                                                Image.network(
                                                                              rowProduitsRecord.image!,
                                                                              width: 100,
                                                                              height: 100,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
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
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                                                                if (rowProduitsRecord.pourcentage != 0)
                                                                                                  SelectionArea(
                                                                                                      child: Text(
                                                                                                    '- ${rowProduitsRecord.pourcentage?.toString()} %',
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                  )),
                                                                                              ],
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
                                                                      ),
                                                                    );
                                                                  },
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
                                              KeepAliveWidgetWrapper(
                                                builder: (context) => Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 16, 0, 50),
                                                  child: StreamBuilder<
                                                      List<ProduitsRecord>>(
                                                    stream: queryProduitsRecord(
                                                      queryBuilder:
                                                          (produitsRecord) =>
                                                              produitsRecord
                                                                  .orderBy(
                                                                      'vue',
                                                                      descending:
                                                                          true),
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 20,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<ProduitsRecord>
                                                          columnProduitsRecordList =
                                                          snapshot.data!;
                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                              columnProduitsRecordList
                                                                  .length,
                                                              (columnIndex) {
                                                            final columnProduitsRecord =
                                                                columnProduitsRecordList[
                                                                    columnIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          4,
                                                                          10,
                                                                          0),
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
                                                                  color: Color(
                                                                      0x001E2039),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                                child: StreamBuilder<
                                                                    ProduitsRecord>(
                                                                  stream: ProduitsRecord
                                                                      .getDocument(
                                                                          columnProduitsRecord
                                                                              .reference),
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
                                                                    final rowProduitsRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().prixDefaut =
                                                                              true;
                                                                          FFAppState().complet =
                                                                              false;
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().refFav =
                                                                              null;
                                                                          FFAppState().qty =
                                                                              1;
                                                                        });
      
                                                                        final produitsUpdateData =
                                                                            {
                                                                          'vue':
                                                                              FieldValue.increment(1),
                                                                        };
                                                                        await rowProduitsRecord
                                                                            .reference
                                                                            .update(produitsUpdateData);
                                                                        showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
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
                                                                        ).then((value) =>
                                                                            setState(() {}));
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                            child:
                                                                                Image.network(
                                                                              rowProduitsRecord.image!,
                                                                              width: 100,
                                                                              height: 100,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
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
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                                                                if (rowProduitsRecord.pourcentage != 0)
                                                                                                  SelectionArea(
                                                                                                      child: Text(
                                                                                                    '- ${rowProduitsRecord.pourcentage?.toString()} %',
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                  )),
                                                                                              ],
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
                                                                      ),
                                                                    );
                                                                  },
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
                                              KeepAliveWidgetWrapper(
                                                builder: (context) => Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 16, 0, 50),
                                                  child: StreamBuilder<
                                                      List<ProduitsRecord>>(
                                                    stream: queryProduitsRecord(
                                                      queryBuilder:
                                                          (produitsRecord) =>
                                                              produitsRecord
                                                                  .orderBy(
                                                                      'date',
                                                                      descending:
                                                                          true),
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 20,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<ProduitsRecord>
                                                          columnProduitsRecordList =
                                                          snapshot.data!;
                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                              columnProduitsRecordList
                                                                  .length,
                                                              (columnIndex) {
                                                            final columnProduitsRecord =
                                                                columnProduitsRecordList[
                                                                    columnIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          4,
                                                                          10,
                                                                          0),
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
                                                                  color: Color(
                                                                      0x001E2039),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                                child: StreamBuilder<
                                                                    ProduitsRecord>(
                                                                  stream: ProduitsRecord
                                                                      .getDocument(
                                                                          columnProduitsRecord
                                                                              .reference),
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
                                                                    final rowProduitsRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().prixDefaut =
                                                                              true;
                                                                          FFAppState().complet =
                                                                              false;
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().refFav =
                                                                              null;
                                                                          FFAppState().qty =
                                                                              1;
                                                                        });
      
                                                                        final produitsUpdateData =
                                                                            {
                                                                          'vue':
                                                                              FieldValue.increment(1),
                                                                        };
                                                                        await rowProduitsRecord
                                                                            .reference
                                                                            .update(produitsUpdateData);
                                                                        showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
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
                                                                        ).then((value) =>
                                                                            setState(() {}));
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                            child:
                                                                                Image.network(
                                                                              rowProduitsRecord.image!,
                                                                              width: 100,
                                                                              height: 100,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
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
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                                                                if (rowProduitsRecord.pourcentage != 0)
                                                                                                  SelectionArea(
                                                                                                      child: Text(
                                                                                                    '- ${rowProduitsRecord.pourcentage?.toString()} %',
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                  )),
                                                                                              ],
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
                                                                      ),
                                                                    );
                                                                  },
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
                                              KeepAliveWidgetWrapper(
                                                builder: (context) => Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 16, 0, 50),
                                                  child: StreamBuilder<
                                                      List<ProduitsRecord>>(
                                                    stream: queryProduitsRecord(
                                                      queryBuilder:
                                                          (produitsRecord) =>
                                                              produitsRecord
                                                                  .orderBy(
                                                                      'moyenne',
                                                                      descending:
                                                                          true),
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 20,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<ProduitsRecord>
                                                          columnProduitsRecordList =
                                                          snapshot.data!;
                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                              columnProduitsRecordList
                                                                  .length,
                                                              (columnIndex) {
                                                            final columnProduitsRecord =
                                                                columnProduitsRecordList[
                                                                    columnIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          4,
                                                                          10,
                                                                          0),
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
                                                                  color: Color(
                                                                      0x001E2039),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                                child: StreamBuilder<
                                                                    ProduitsRecord>(
                                                                  stream: ProduitsRecord
                                                                      .getDocument(
                                                                          columnProduitsRecord
                                                                              .reference),
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
                                                                    final rowProduitsRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().prixDefaut =
                                                                              true;
                                                                          FFAppState().complet =
                                                                              false;
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().refFav =
                                                                              null;
                                                                          FFAppState().qty =
                                                                              1;
                                                                        });
      
                                                                        final produitsUpdateData =
                                                                            {
                                                                          'vue':
                                                                              FieldValue.increment(1),
                                                                        };
                                                                        await rowProduitsRecord
                                                                            .reference
                                                                            .update(produitsUpdateData);
                                                                        showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
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
                                                                        ).then((value) =>
                                                                            setState(() {}));
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                            child:
                                                                                Image.network(
                                                                              rowProduitsRecord.image!,
                                                                              width: 100,
                                                                              height: 100,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
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
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      rowProduitsRecord.moyenne!.toString(),
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
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              KeepAliveWidgetWrapper(
                                                builder: (context) => Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 16, 0, 50),
                                                  child: StreamBuilder<
                                                      List<ProduitsRecord>>(
                                                    stream: queryProduitsRecord(
                                                      queryBuilder:
                                                          (produitsRecord) =>
                                                              produitsRecord
                                                                  .orderBy(
                                                                      'nbreFav',
                                                                      descending:
                                                                          true),
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 20,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<ProduitsRecord>
                                                          columnProduitsRecordList =
                                                          snapshot.data!;
                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                              columnProduitsRecordList
                                                                  .length,
                                                              (columnIndex) {
                                                            final columnProduitsRecord =
                                                                columnProduitsRecordList[
                                                                    columnIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          4,
                                                                          10,
                                                                          0),
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
                                                                  color: Color(
                                                                      0x001E2039),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                ),
                                                                child: StreamBuilder<
                                                                    ProduitsRecord>(
                                                                  stream: ProduitsRecord
                                                                      .getDocument(
                                                                          columnProduitsRecord
                                                                              .reference),
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
                                                                    final rowProduitsRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().prixDefaut =
                                                                              true;
                                                                          FFAppState().complet =
                                                                              false;
                                                                        });
                                                                        FFAppState()
                                                                            .update(() {
                                                                          FFAppState().refFav =
                                                                              null;
                                                                          FFAppState().qty =
                                                                              1;
                                                                        });
      
                                                                        final produitsUpdateData =
                                                                            {
                                                                          'vue':
                                                                              FieldValue.increment(1),
                                                                        };
                                                                        await rowProduitsRecord
                                                                            .reference
                                                                            .update(produitsUpdateData);
                                                                        showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
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
                                                                        ).then((value) =>
                                                                            setState(() {}));
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                            child:
                                                                                Image.network(
                                                                              rowProduitsRecord.image!,
                                                                              width: 100,
                                                                              height: 100,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
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
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                                                                if (rowProduitsRecord.pourcentage != 0)
                                                                                                  SelectionArea(
                                                                                                      child: Text(
                                                                                                    '- ${rowProduitsRecord.pourcentage?.toString()} %',
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                  )),
                                                                                              ],
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
                                                                      ),
                                                                    );
                                                                  },
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
                        color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                        MediaQuery.of(context).size.height * 1,
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
                                                mainAxisSize: MainAxisSize.max,
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
                                                                    child: Text(
                                                              columnUsersRecord
                                                                  .displayName!,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 50, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 15),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 10, 0),
                                                          child: Container(
                                                            width: 150,
                                                            height: 30,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                            child: InkWell(
                                                              onTap: () async {
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
                                                                        30,
                                                                    borderWidth:
                                                                        1,
                                                                    buttonSize:
                                                                        30,
                                                                    fillColor:
                                                                        Color(
                                                                            0xFFCC4433),
                                                                    icon: Icon(
                                                                      FFIcons
                                                                          .kfiRrHome,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 15,
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
                                                                          InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              context.pushNamed('Accueil');
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              'Accueil',
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 15),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 10, 0),
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
                                                              onTap: () async {
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
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    icon: Icon(
                                                                      FFIcons
                                                                          .kfiRrHeart,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size: 15,
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
                                                                          InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              context.pushNamed('favoris');
                                                                            },
                                                                            child:
                                                                                Text(
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 15),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 10, 0),
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
                                                              onTap: () async {
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
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    icon: Icon(
                                                                      FFIcons
                                                                          .kfiRrApps,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size: 15,
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
                                                                          InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              context.pushNamed('category');
                                                                            },
                                                                            child:
                                                                                Text(
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 15),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 10, 0),
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
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
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
                                                                        50,
                                                                    borderWidth:
                                                                        1,
                                                                    buttonSize:
                                                                        30,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    icon: Icon(
                                                                      FFIcons
                                                                          .kfiRrShoppingBasket,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size: 15,
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
                                                                          InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              context.pushNamed('cart2');
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              'Commandes',
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 15),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 10, 0),
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
                                                              onTap: () async {
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
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    icon: Icon(
                                                                      FFIcons
                                                                          .kfiRrUser,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size: 15,
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
                                                                          InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              context.pushNamed('user');
                                                                            },
                                                                            child:
                                                                                Text(
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 40, 0, 0),
                                                  child: Image.asset(
                                                    'assets/images/zem_food-1.png',
                                                    width: 60,
                                                    height: 60,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 5, 0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.phone,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 20,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5, 0, 0, 0),
                                                        child: StreamBuilder<
                                                            List<RideRecord>>(
                                                          stream:
                                                              queryRideRecord(
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
                                                            List<RideRecord>
                                                                textRideRecordList =
                                                                snapshot.data!;
                                                            // Return an empty Container when the item does not exist.
                                                            if (snapshot.data!
                                                                .isEmpty) {
                                                              return Container();
                                                            }
                                                            final textRideRecord =
                                                                textRideRecordList
                                                                        .isNotEmpty
                                                                    ? textRideRecordList
                                                                        .first
                                                                    : null;
                                                            return Text(
                                                              textRideRecord!
                                                                  .userAddress!,
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'sf pro text',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                    useGoogleFonts:
                                                                        false,
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30, 0, 30, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.55,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x00272B50),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20, 16, 20, 0),
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
                                                                  .fromSTEB(0,
                                                                      4, 0, 0),
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
                                                                      algoliaSearchResults2 =
                                                                          null);
                                                                  await ProduitsRecord
                                                                          .search(
                                                                    term: searchField232Controller!
                                                                        .text,
                                                                  )
                                                                      .then((r) =>
                                                                          algoliaSearchResults2 =
                                                                              r)
                                                                      .onError((_,
                                                                              __) =>
                                                                          algoliaSearchResults2 =
                                                                              [])
                                                                      .whenComplete(() =>
                                                                          setState(
                                                                              () {}));
                                                                },
                                                              ),
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelStyle:
                                                                    FlutterFlowTheme.of(
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
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
                                                                      BorderRadius
                                                                          .circular(
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
                                                                      BorderRadius
                                                                          .circular(
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
                                                                      BorderRadius
                                                                          .circular(
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
                                                                      BorderRadius
                                                                          .circular(
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
                                                                suffixIcon:
                                                                    searchField232Controller!
                                                                            .text
                                                                            .isNotEmpty
                                                                        ? InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              searchField232Controller?.clear();
                                                                              setState(() => algoliaSearchResults2 = null);
                                                                              await ProduitsRecord.search(
                                                                                term: searchField232Controller!.text,
                                                                              ).then((r) => algoliaSearchResults2 = r).onError((_, __) => algoliaSearchResults2 = []).whenComplete(() => setState(() {}));
      
                                                                              setState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.clear,
                                                                              color: Color(0xFF757575),
                                                                              size: 22,
                                                                            ),
                                                                          )
                                                                        : null,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
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
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        1,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0x00FFFFFF),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                    ),
                                                                    child: FutureBuilder<
                                                                        List<
                                                                            ProduitsRecord>>(
                                                                      future: ProduitsRecord
                                                                          .search(
                                                                        term: searchField232Controller!
                                                                            .text,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
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
                                                                            height:
                                                                                100,
                                                                            child:
                                                                                Center(
                                                                              child: Text('No results.'),
                                                                            ),
                                                                          );
                                                                        }
                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: List.generate(
                                                                              columnProduitsRecordList.length,
                                                                              (columnIndex) {
                                                                            final columnProduitsRecord =
                                                                                columnProduitsRecordList[columnIndex];
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 16, 0, 0),
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
                                                                .fromSTEB(10, 0,
                                                                    10, 0),
                                                        child: Container(
                                                          height: 40,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 140,
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
                                                                  fillColor: Color(
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
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              GoRouter.of(context).prepareAuthEvent();
                                                                              await signOut();
      
                                                                              context.goNamedAuth('Onboarding1', mounted);
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              'Déconnexion',
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'sf pro text',
                                                                                    color: Colors.white,
                                                                                    fontSize: 12,
                                                                                    fontWeight: FontWeight.bold,
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 0),
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
                                                            Radius.circular(0),
                                                        bottomRight:
                                                            Radius.circular(0),
                                                        topLeft:
                                                            Radius.circular(60),
                                                        topRight:
                                                            Radius.circular(0),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 40, 0, 0),
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
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15,
                                                                          0,
                                                                          8,
                                                                          0),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              30,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child: SelectionArea(
                                                                                child: Text(
                                                                              'Categories',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'sf pro text',
                                                                                    fontSize: 15,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                            )),
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              context.pushNamed('category');
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              'Voir plus',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'sf pro text',
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              20,
                                                                              18,
                                                                              0,
                                                                              0),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              CatRecord>>(
                                                                        stream:
                                                                            queryCatRecord(
                                                                          queryBuilder: (catRecord) => catRecord.where(
                                                                              'nom',
                                                                              isNotEqualTo: 'Ravitaillement'),
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
                                                                          List<CatRecord>
                                                                              rowCatRecordList =
                                                                              snapshot.data!;
                                                                          return SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: List.generate(rowCatRecordList.length, (rowIndex) {
                                                                                final rowCatRecord = rowCatRecordList[rowIndex];
                                                                                return Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                                                                                  child: StreamBuilder<CatRecord>(
                                                                                    stream: CatRecord.getDocument(rowCatRecord.reference),
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
                                                                                      final containerCatRecord = snapshot.data!;
                                                                                      return Container(
                                                                                        width: MediaQuery.of(context).size.width * 0.28,
                                                                                        height: MediaQuery.of(context).size.height * 0.18,
                                                                                        constraints: BoxConstraints(
                                                                                          maxWidth: 100,
                                                                                          maxHeight: 135,
                                                                                        ),
                                                                                        decoration: BoxDecoration(
                                                                                          color: Theme.of(context).brightness == Brightness.dark ? Color(0xFF24272E) : Color(0xB739D2C0),
                                                                                          borderRadius: BorderRadius.circular(20),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                                                                                          child: InkWell(
                                                                                            onTap: () async {
                                                                                              context.pushNamed(
                                                                                                'catDetails',
                                                                                                queryParams: {
                                                                                                  'refcat': serializeParam(
                                                                                                    containerCatRecord.reference,
                                                                                                    ParamType.DocumentReference,
                                                                                                  ),
                                                                                                }.withoutNulls,
                                                                                              );
                                                                                            },
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Image.network(
                                                                                                  containerCatRecord.img!,
                                                                                                  height: 50,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                                                                                  child: Text(
                                                                                                    containerCatRecord.nom!,
                                                                                                    maxLines: 2,
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'sf pro text',
                                                                                                          color: Colors.white,
                                                                                                          fontSize: 12,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                                                                                                  child: Text(
                                                                                                    '${containerCatRecord.nbr?.toString()} Plats',
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'sf pro text',
                                                                                                          color: Colors.white,
                                                                                                          fontSize: 11,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                  ),
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
                                                                    if (valueOrDefault<bool>(
                                                                            currentUserDocument?.abonnLivraison,
                                                                            false) ==
                                                                        false)
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            16,
                                                                            0,
                                                                            0),
                                                                        child: StreamBuilder<
                                                                            List<FraisLivraisonRecord>>(
                                                                          stream:
                                                                              queryFraisLivraisonRecord(
                                                                            singleRecord:
                                                                                true,
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
                                                                            List<FraisLivraisonRecord>
                                                                                rowFraisLivraisonRecordList =
                                                                                snapshot.data!;
                                                                            // Return an empty Container when the item does not exist.
                                                                            if (snapshot.data!.isEmpty) {
                                                                              return Container();
                                                                            }
                                                                            final rowFraisLivraisonRecord = rowFraisLivraisonRecordList.isNotEmpty
                                                                                ? rowFraisLivraisonRecordList.first
                                                                                : null;
                                                                            return Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Container(
                                                                                  width: MediaQuery.of(context).size.width * 0.52,
                                                                                  child: Stack(
                                                                                    children: [
                                                                                      ClipRect(
                                                                                        child: ImageFiltered(
                                                                                          imageFilter: ImageFilter.blur(
                                                                                            sigmaX: 3,
                                                                                            sigmaY: 3,
                                                                                          ),
                                                                                          child: Container(
                                                                                            width: MediaQuery.of(context).size.width,
                                                                                            height: 150,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                              image: DecorationImage(
                                                                                                fit: BoxFit.cover,
                                                                                                image: Image.asset(
                                                                                                  'assets/images/IMG_1261-1200x1068_(1).png',
                                                                                                ).image,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        height: 150,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).customColor2,
                                                                                        ),
                                                                                        child: Align(
                                                                                          alignment: AlignmentDirectional(-0.01, -0.26),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                                                                                                child: Text(
                                                                                                  'Profitez maintenant d\'un service de livraison en illimité avec seulement 5000 FCFA par mois',
                                                                                                  textAlign: TextAlign.center,
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                                                                                child: FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    await showModalBottomSheet(
                                                                                                      isScrollControlled: true,
                                                                                                      backgroundColor: Colors.transparent,
                                                                                                      context: context,
                                                                                                      builder: (context) {
                                                                                                        return Padding(
                                                                                                          padding: MediaQuery.of(context).viewInsets,
                                                                                                          child: Container(
                                                                                                            height: 500,
                                                                                                            child: LivraionAboWidget(),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ).then((value) => setState(() {}));
                                                                                                  },
                                                                                                  text: 'Commencez Maintenant',
                                                                                                  options: FFButtonOptions(
                                                                                                    width: 230,
                                                                                                    height: 40,
                                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                          fontFamily: 'sf pro text',
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      width: 2,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8),
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
                                                                              ],
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    StreamBuilder<
                                                                        List<
                                                                            ProduitsRecord>>(
                                                                      stream:
                                                                          queryProduitsRecord(
                                                                        queryBuilder: (produitsRecord) => produitsRecord.where(
                                                                            'pourcentage',
                                                                            isNotEqualTo:
                                                                                0),
                                                                        singleRecord:
                                                                            true,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
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
                                                                            containerProduitsRecordList =
                                                                            snapshot.data!;
                                                                        // Return an empty Container when the item does not exist.
                                                                        if (snapshot
                                                                            .data!
                                                                            .isEmpty) {
                                                                          return Container();
                                                                        }
                                                                        final containerProduitsRecord = containerProduitsRecordList.isNotEmpty
                                                                            ? containerProduitsRecordList.first
                                                                            : null;
                                                                        return Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0x00FFFFFF),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12,
                                                                                20,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  'Reductions',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'sf pro text',
                                                                                        fontSize: 15,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                ),
                                                                                InkWell(
                                                                                  onTap: () async {
                                                                                    context.pushNamed('Reduction');
                                                                                  },
                                                                                  child: Text(
                                                                                    'Voir plus',
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'sf pro text',
                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              10,
                                                                              0,
                                                                              0),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              ProduitsRecord>>(
                                                                        stream:
                                                                            queryProduitsRecord(
                                                                          queryBuilder: (produitsRecord) => produitsRecord.where('pourcentage', isNotEqualTo: 0).orderBy(
                                                                              'pourcentage',
                                                                              descending: true),
                                                                          limit:
                                                                              10,
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
                                                                              rowProduitsRecordList =
                                                                              snapshot.data!;
                                                                          return SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: List.generate(rowProduitsRecordList.length, (rowIndex) {
                                                                                final rowProduitsRecord = rowProduitsRecordList[rowIndex];
                                                                                return Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 15),
                                                                                  child: StreamBuilder<ProduitsRecord>(
                                                                                    stream: ProduitsRecord.getDocument(rowProduitsRecord.reference),
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
                                                                                          maxHeight: 280,
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
                                                                                                Stack(
                                                                                                  children: [
                                                                                                    Container(
                                                                                                      width: double.infinity,
                                                                                                      height: 120,
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
                                                                                                    if (containerProduitsRecord.pourcentage != 0)
                                                                                                      Align(
                                                                                                        alignment: AlignmentDirectional(0.96, -0.95),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 5, 0),
                                                                                                          child: Container(
                                                                                                            width: 50,
                                                                                                            height: 40,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: Color(0xAC40249B),
                                                                                                              borderRadius: BorderRadius.circular(2),
                                                                                                            ),
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                              children: [
                                                                                                                SelectionArea(
                                                                                                                    child: Text(
                                                                                                                  '- ${containerProduitsRecord.pourcentage?.toString()} %',
                                                                                                                  textAlign: TextAlign.center,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                        fontFamily: 'sf pro text',
                                                                                                                        color: Colors.white,
                                                                                                                        useGoogleFonts: false,
                                                                                                                      ),
                                                                                                                )),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                  ],
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
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                130,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              borderRadius: BorderRadius.circular(20),
                                                                              border: Border.all(
                                                                                color: Color(0x00FC6A57),
                                                                                width: 2,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(-0.01, -0.26),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                                                                    child: FFButtonWidget(
                                                                                      onPressed: () async {
                                                                                        context.pushNamed('Abonnement');
                                                                                      },
                                                                                      text: 'Abonnement sur Mesure',
                                                                                      options: FFButtonOptions(
                                                                                        width: 230,
                                                                                        height: 40,
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                              fontFamily: 'sf pro text',
                                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                          width: 2,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(8),
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
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              16,
                                                                              0,
                                                                              0),
                                                                      child: FutureBuilder<
                                                                          List<
                                                                              CatRecord>>(
                                                                        future:
                                                                            queryCatRecordOnce(
                                                                          queryBuilder: (catRecord) => catRecord.where(
                                                                              'nom',
                                                                              isEqualTo: 'Ravitaillement'),
                                                                          singleRecord:
                                                                              true,
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
                                                                          List<CatRecord>
                                                                              columnCatRecordList =
                                                                              snapshot.data!;
                                                                          // Return an empty Container when the item does not exist.
                                                                          if (snapshot
                                                                              .data!
                                                                              .isEmpty) {
                                                                            return Container();
                                                                          }
                                                                          final columnCatRecord = columnCatRecordList.isNotEmpty
                                                                              ? columnCatRecordList.first
                                                                              : null;
                                                                          return Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Ravitaillement Tchéké',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'sf pro text',
                                                                                            fontSize: 16,
                                                                                            useGoogleFonts: false,
                                                                                          ),
                                                                                    ),
                                                                                    InkWell(
                                                                                      onTap: () async {
                                                                                        context.pushNamed('pourVous');
                                                                                      },
                                                                                      child: Text(
                                                                                        'Voir plus',
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'sf pro text',
                                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(20, 16, 0, 0),
                                                                                child: StreamBuilder<List<DetailsRecord>>(
                                                                                  stream: queryDetailsRecord(
                                                                                    parent: columnCatRecord!.reference,
                                                                                    queryBuilder: (detailsRecord) => detailsRecord.orderBy('nbr', descending: true),
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
                                                                                    List<DetailsRecord> rowDetailsRecordList = snapshot.data!;
                                                                                    return SingleChildScrollView(
                                                                                      scrollDirection: Axis.horizontal,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: List.generate(rowDetailsRecordList.length, (rowIndex) {
                                                                                          final rowDetailsRecord = rowDetailsRecordList[rowIndex];
                                                                                          return Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                                                                            child: StreamBuilder<DetailsRecord>(
                                                                                              stream: DetailsRecord.getDocument(rowDetailsRecord.reference),
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
                                                                                                final containerDetailsRecord = snapshot.data!;
                                                                                                return InkWell(
                                                                                                  onTap: () async {
                                                                                                    context.pushNamed(
                                                                                                      'catDetails2',
                                                                                                      queryParams: {
                                                                                                        'refDet': serializeParam(
                                                                                                          containerDetailsRecord.reference,
                                                                                                          ParamType.DocumentReference,
                                                                                                        ),
                                                                                                      }.withoutNulls,
                                                                                                    );
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    width: 250,
                                                                                                    height: 140,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      image: DecorationImage(
                                                                                                        fit: BoxFit.cover,
                                                                                                        image: Image.network(
                                                                                                          containerDetailsRecord.img!,
                                                                                                        ).image,
                                                                                                      ),
                                                                                                      borderRadius: BorderRadius.circular(20),
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
                                                                            ],
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              12,
                                                                              20,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'Nos Recommandations',
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'sf pro text',
                                                                                  fontSize: 15,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              20,
                                                                              0,
                                                                              100),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              ProduitsRecord>>(
                                                                        stream:
                                                                            queryProduitsRecord(
                                                                          queryBuilder: (produitsRecord) => produitsRecord.orderBy(
                                                                              'vue',
                                                                              descending: true),
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
                                                                              wrapProduitsRecordList =
                                                                              snapshot.data!;
                                                                          return Wrap(
                                                                            spacing:
                                                                                30,
                                                                            runSpacing:
                                                                                10,
                                                                            alignment:
                                                                                WrapAlignment.start,
                                                                            crossAxisAlignment:
                                                                                WrapCrossAlignment.start,
                                                                            direction:
                                                                                Axis.horizontal,
                                                                            runAlignment:
                                                                                WrapAlignment.start,
                                                                            verticalDirection:
                                                                                VerticalDirection.down,
                                                                            clipBehavior:
                                                                                Clip.none,
                                                                            children:
                                                                                List.generate(wrapProduitsRecordList.length, (wrapIndex) {
                                                                              final wrapProduitsRecord = wrapProduitsRecordList[wrapIndex];
                                                                              return Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                                                                                child: StreamBuilder<ProduitsRecord>(
                                                                                  stream: ProduitsRecord.getDocument(wrapProduitsRecord.reference),
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
                                                                                        maxHeight: 280,
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
                                                                                                height: 120,
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
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              16,
                                                                              0,
                                                                              0),
                                                                      child: FutureBuilder<
                                                                          List<
                                                                              CatRecord>>(
                                                                        future:
                                                                            queryCatRecordOnce(
                                                                          queryBuilder: (catRecord) => catRecord.where(
                                                                              'nom',
                                                                              isEqualTo: 'Ravitaillement'),
                                                                          singleRecord:
                                                                              true,
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
                                                                          List<CatRecord>
                                                                              columnCatRecordList =
                                                                              snapshot.data!;
                                                                          // Return an empty Container when the item does not exist.
                                                                          if (snapshot
                                                                              .data!
                                                                              .isEmpty) {
                                                                            return Container();
                                                                          }
                                                                          final columnCatRecord = columnCatRecordList.isNotEmpty
                                                                              ? columnCatRecordList.first
                                                                              : null;
                                                                          return Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Le meilleur du ravitaillement',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'sf pro text',
                                                                                            fontSize: 16,
                                                                                            useGoogleFonts: false,
                                                                                          ),
                                                                                    ),
                                                                                    InkWell(
                                                                                      onTap: () async {
                                                                                        context.pushNamed('Ravitaillemant');
                                                                                      },
                                                                                      child: Text(
                                                                                        'Voir plus',
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'sf pro text',
                                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(20, 16, 0, 0),
                                                                                child: StreamBuilder<List<ProduitsRecord>>(
                                                                                  stream: queryProduitsRecord(
                                                                                    queryBuilder: (produitsRecord) => produitsRecord.where('category', isEqualTo: 'Ravitaillement'),
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
                                                                                    List<ProduitsRecord> rowProduitsRecordList = snapshot.data!;
                                                                                    return SingleChildScrollView(
                                                                                      scrollDirection: Axis.horizontal,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: List.generate(rowProduitsRecordList.length, (rowIndex) {
                                                                                          final rowProduitsRecord = rowProduitsRecordList[rowIndex];
                                                                                          return Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                                                                                            child: StreamBuilder<ProduitsRecord>(
                                                                                              stream: ProduitsRecord.getDocument(rowProduitsRecord.reference),
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
                                                                                                  width: 230,
                                                                                                  height: 300,
                                                                                                  constraints: BoxConstraints(
                                                                                                    maxWidth: 400,
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
                                                                                                          Stack(
                                                                                                            children: [
                                                                                                              Container(
                                                                                                                width: double.infinity,
                                                                                                                height: 170,
                                                                                                                constraints: BoxConstraints(
                                                                                                                  maxHeight: 170,
                                                                                                                ),
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                  image: DecorationImage(
                                                                                                                    fit: BoxFit.fitHeight,
                                                                                                                    image: Image.network(
                                                                                                                      containerProduitsRecord.image!,
                                                                                                                    ).image,
                                                                                                                  ),
                                                                                                                  borderRadius: BorderRadius.circular(15),
                                                                                                                ),
                                                                                                              ),
                                                                                                              if (containerProduitsRecord.pourcentage != 0)
                                                                                                                Align(
                                                                                                                  alignment: AlignmentDirectional(0.96, -0.95),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                                                                                                    child: Container(
                                                                                                                      width: 50,
                                                                                                                      height: 40,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: Color(0xAC40249B),
                                                                                                                        borderRadius: BorderRadius.circular(2),
                                                                                                                      ),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                        children: [
                                                                                                                          SelectionArea(
                                                                                                                              child: Text(
                                                                                                                            '- ${containerProduitsRecord.pourcentage?.toString()} %',
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                  fontFamily: 'sf pro text',
                                                                                                                                  color: Colors.white,
                                                                                                                                  useGoogleFonts: false,
                                                                                                                                ),
                                                                                                                          )),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                            ],
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
                                                                                                              RatingBarIndicator(
                                                                                                                itemBuilder: (context, index) => Icon(
                                                                                                                  Icons.star_rounded,
                                                                                                                  color: Color(0xFFFFCC53),
                                                                                                                ),
                                                                                                                direction: Axis.horizontal,
                                                                                                                rating: functions.rate(containerProduitsRecord.note!.toList(), containerProduitsRecord.note!.toList().length),
                                                                                                                unratedColor: Color(0xFF9E9E9E),
                                                                                                                itemCount: 5,
                                                                                                                itemSize: 18,
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
                                                                                                                        return '${functions.reduce(functions.multippl(containerProduitsRecord.prix!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
                                                                                                                      } else if ((containerProduitsRecord.multi == true) && (FFAppState().prixDefaut == false)) {
                                                                                                                        return '${functions.reduce(functions.multippl(containerProduitsRecord.prixComplet!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
                                                                                                                      } else {
                                                                                                                        return '${functions.reduce(functions.multippl(containerProduitsRecord.prixDemi!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
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
                                                                            ],
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              16,
                                                                              0,
                                                                              0),
                                                                      child: FutureBuilder<
                                                                          List<
                                                                              CatRecord>>(
                                                                        future:
                                                                            queryCatRecordOnce(
                                                                          queryBuilder: (catRecord) => catRecord.where(
                                                                              'nom',
                                                                              isEqualTo: 'Ravitaillement'),
                                                                          singleRecord:
                                                                              true,
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
                                                                          List<CatRecord>
                                                                              columnCatRecordList =
                                                                              snapshot.data!;
                                                                          // Return an empty Container when the item does not exist.
                                                                          if (snapshot
                                                                              .data!
                                                                              .isEmpty) {
                                                                            return Container();
                                                                          }
                                                                          final columnCatRecord = columnCatRecordList.isNotEmpty
                                                                              ? columnCatRecordList.first
                                                                              : null;
                                                                          return Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Packages Ravitaillement',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'sf pro text',
                                                                                            fontSize: 16,
                                                                                            useGoogleFonts: false,
                                                                                          ),
                                                                                    ),
                                                                                    StreamBuilder<List<DetailsRecord>>(
                                                                                      stream: queryDetailsRecord(
                                                                                        parent: columnCatRecord!.reference,
                                                                                        queryBuilder: (detailsRecord) => detailsRecord.where('nom', isEqualTo: 'Packages'),
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
                                                                                        List<DetailsRecord> textDetailsRecordList = snapshot.data!;
                                                                                        // Return an empty Container when the item does not exist.
                                                                                        if (snapshot.data!.isEmpty) {
                                                                                          return Container();
                                                                                        }
                                                                                        final textDetailsRecord = textDetailsRecordList.isNotEmpty ? textDetailsRecordList.first : null;
                                                                                        return InkWell(
                                                                                          onTap: () async {
                                                                                            context.pushNamed(
                                                                                              'catDetails2',
                                                                                              queryParams: {
                                                                                                'refcat': serializeParam(
                                                                                                  columnCatRecord!.reference,
                                                                                                  ParamType.DocumentReference,
                                                                                                ),
                                                                                                'refDet': serializeParam(
                                                                                                  textDetailsRecord!.reference,
                                                                                                  ParamType.DocumentReference,
                                                                                                ),
                                                                                              }.withoutNulls,
                                                                                            );
                                                                                          },
                                                                                          child: Text(
                                                                                            'Voir plus',
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'sf pro text',
                                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                  useGoogleFonts: false,
                                                                                                ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(20, 16, 0, 0),
                                                                                child: StreamBuilder<List<ProduitsRecord>>(
                                                                                  stream: queryProduitsRecord(
                                                                                    queryBuilder: (produitsRecord) => produitsRecord.where('category', isEqualTo: 'Ravitaillement').where('catList', arrayContains: 'Packages'),
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
                                                                                    List<ProduitsRecord> rowProduitsRecordList = snapshot.data!;
                                                                                    return SingleChildScrollView(
                                                                                      scrollDirection: Axis.horizontal,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: List.generate(rowProduitsRecordList.length, (rowIndex) {
                                                                                          final rowProduitsRecord = rowProduitsRecordList[rowIndex];
                                                                                          return Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                                                                                            child: StreamBuilder<ProduitsRecord>(
                                                                                              stream: ProduitsRecord.getDocument(rowProduitsRecord.reference),
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
                                                                                                  width: 230,
                                                                                                  height: 300,
                                                                                                  constraints: BoxConstraints(
                                                                                                    maxWidth: 400,
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
                                                                                                          Stack(
                                                                                                            children: [
                                                                                                              Container(
                                                                                                                width: double.infinity,
                                                                                                                height: 170,
                                                                                                                constraints: BoxConstraints(
                                                                                                                  maxHeight: 170,
                                                                                                                ),
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                  image: DecorationImage(
                                                                                                                    fit: BoxFit.fitHeight,
                                                                                                                    image: Image.network(
                                                                                                                      containerProduitsRecord.image!,
                                                                                                                    ).image,
                                                                                                                  ),
                                                                                                                  borderRadius: BorderRadius.circular(15),
                                                                                                                ),
                                                                                                              ),
                                                                                                              if (containerProduitsRecord.pourcentage != 0)
                                                                                                                Align(
                                                                                                                  alignment: AlignmentDirectional(0.96, -0.95),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                                                                                                    child: Container(
                                                                                                                      width: 50,
                                                                                                                      height: 40,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: Color(0xAC40249B),
                                                                                                                        borderRadius: BorderRadius.circular(2),
                                                                                                                      ),
                                                                                                                      child: Column(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                        children: [
                                                                                                                          SelectionArea(
                                                                                                                              child: Text(
                                                                                                                            '- ${containerProduitsRecord.pourcentage?.toString()} %',
                                                                                                                            textAlign: TextAlign.center,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                  fontFamily: 'sf pro text',
                                                                                                                                  color: Colors.white,
                                                                                                                                  useGoogleFonts: false,
                                                                                                                                ),
                                                                                                                          )),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                            ],
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
                                                                                                              RatingBarIndicator(
                                                                                                                itemBuilder: (context, index) => Icon(
                                                                                                                  Icons.star_rounded,
                                                                                                                  color: Color(0xFFFFCC53),
                                                                                                                ),
                                                                                                                direction: Axis.horizontal,
                                                                                                                rating: functions.rate(containerProduitsRecord.note!.toList(), containerProduitsRecord.note!.toList().length),
                                                                                                                unratedColor: Color(0xFF9E9E9E),
                                                                                                                itemCount: 5,
                                                                                                                itemSize: 18,
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
                                                                                                                        return '${functions.reduce(functions.multippl(containerProduitsRecord.prix!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
                                                                                                                      } else if ((containerProduitsRecord.multi == true) && (FFAppState().prixDefaut == false)) {
                                                                                                                        return '${functions.reduce(functions.multippl(containerProduitsRecord.prixComplet!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
                                                                                                                      } else {
                                                                                                                        return '${functions.reduce(functions.multippl(containerProduitsRecord.prixDemi!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
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
                                                                            ],
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.97,
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxWidth: 300,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x00272B50),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
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
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
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
                                                                          StreamBuilder<
                                                                              List<BanniereRecord>>(
                                                                            stream:
                                                                                queryBanniereRecord(
                                                                              queryBuilder: (banniereRecord) => banniereRecord.orderBy('priorite', descending: true),
                                                                              singleRecord: true,
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
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
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
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12,
                                                                                0,
                                                                                0,
                                                                                0),
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
                                                                        child: StreamBuilder<
                                                                            List<ProduitsRecord>>(
                                                                          stream:
                                                                              queryProduitsRecord(
                                                                            queryBuilder: (produitsRecord) =>
                                                                                produitsRecord.orderBy('vue', descending: true),
                                                                            limit:
                                                                                10,
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
                                                                            List<ProduitsRecord>
                                                                                columnProduitsRecordList =
                                                                                snapshot.data!;
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
                                                                                                    height: 120,
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
                if (responsiveVisibility(
                  context: context,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  Align(
                    alignment: AlignmentDirectional(0, 1),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if ((Theme.of(context).brightness ==
                                Brightness.light) &&
                            responsiveVisibility(
                              context: context,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                          Align(
                            alignment: AlignmentDirectional(0, 1),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color: Color(0x00272B50),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 12,
                                          color: Color(0x33000000),
                                          offset: Offset(0, 5),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: ClipRRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 2,
                                          sigmaY: 2,
                                        ),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: Color(0xB9FFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 10, 10, 10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    context
                                                        .pushNamed('Accueil');
                                                  },
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.15,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x00272B50),
                                                    ),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30,
                                                      borderWidth: 1,
                                                      buttonSize: 30,
                                                      icon: FaIcon(
                                                        FontAwesomeIcons.home,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 20,
                                                      ),
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                            'Accueil');
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.15,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x00272B50),
                                                  ),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30,
                                                    borderWidth: 1,
                                                    buttonSize: 30,
                                                    icon: Icon(
                                                      FFIcons.kfiRrApps,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 20,
                                                    ),
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                          'category');
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.17,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.17,
                                                          decoration:
                                                              BoxDecoration(
                                                            gradient:
                                                                LinearGradient(
                                                              colors: [
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                Color(
                                                                    0x85202034)
                                                              ],
                                                              stops: [0, 1],
                                                              begin:
                                                                  AlignmentDirectional(
                                                                      0, -1),
                                                              end:
                                                                  AlignmentDirectional(
                                                                      0, 1),
                                                            ),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30,
                                                            borderWidth: 1,
                                                            buttonSize: 80,
                                                            icon: Icon(
                                                              FFIcons
                                                                  .kfiRrUtensils,
                                                              color:
                                                                  Colors.white,
                                                              size: 23,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                  'cart2');
                                                            },
                                                          ),
                                                        ),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.17,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.17,
                                                          decoration:
                                                              BoxDecoration(
                                                            gradient:
                                                                LinearGradient(
                                                              colors: [
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary400,
                                                                Color(
                                                                    0x85202034)
                                                              ],
                                                              stops: [0, 1],
                                                              begin:
                                                                  AlignmentDirectional(
                                                                      0, -1),
                                                              end:
                                                                  AlignmentDirectional(
                                                                      0, 1),
                                                            ),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30,
                                                            borderWidth: 1,
                                                            buttonSize: 80,
                                                            icon: Icon(
                                                              FFIcons
                                                                  .kfiRrShoppingCartAdd,
                                                              color:
                                                                  Colors.white,
                                                              size: 23,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                  'Ravitaillemant');
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.15,
                                                  height: 100,
                                                  decoration: BoxDecoration(),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30,
                                                    borderWidth: 1,
                                                    buttonSize: 30,
                                                    icon: Icon(
                                                      FFIcons.kfiRrHeart,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 20,
                                                    ),
                                                    onPressed: () async {
                                                      context
                                                          .pushNamed('favoris');
                                                    },
                                                  ),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.15,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x00272B50),
                                                  ),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30,
                                                    borderWidth: 1,
                                                    buttonSize: 40,
                                                    icon: Icon(
                                                      Icons.person_outline,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 25,
                                                    ),
                                                    onPressed: () async {
                                                      context.pushNamed('user');
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        if ((Theme.of(context).brightness == Brightness.dark) &&
                            responsiveVisibility(
                              context: context,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                          Align(
                            alignment: AlignmentDirectional(0, 1),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color: Color(0x00272B50),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 12,
                                          color: Color(0x33000000),
                                          offset: Offset(0, 5),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: ClipRRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 2,
                                          sigmaY: 2,
                                        ),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: Color(0xB915191C),
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 10, 10, 10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    context
                                                        .pushNamed('Accueil');
                                                  },
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.15,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x00272B50),
                                                    ),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30,
                                                      borderWidth: 1,
                                                      buttonSize: 30,
                                                      icon: FaIcon(
                                                        FontAwesomeIcons.home,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 20,
                                                      ),
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                            'Accueil');
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.15,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x00272B50),
                                                  ),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30,
                                                    borderWidth: 1,
                                                    buttonSize: 30,
                                                    icon: Icon(
                                                      FFIcons.kfiRrApps,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 20,
                                                    ),
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                          'category');
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.17,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.17,
                                                          decoration:
                                                              BoxDecoration(
                                                            gradient:
                                                                LinearGradient(
                                                              colors: [
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                Color(
                                                                    0x85202034)
                                                              ],
                                                              stops: [0, 1],
                                                              begin:
                                                                  AlignmentDirectional(
                                                                      0, -1),
                                                              end:
                                                                  AlignmentDirectional(
                                                                      0, 1),
                                                            ),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30,
                                                            borderWidth: 1,
                                                            buttonSize: 80,
                                                            icon: Icon(
                                                              FFIcons
                                                                  .kfiRrUtensils,
                                                              color:
                                                                  Colors.white,
                                                              size: 23,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                  'cart2');
                                                            },
                                                          ),
                                                        ),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.17,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.17,
                                                          decoration:
                                                              BoxDecoration(
                                                            gradient:
                                                                LinearGradient(
                                                              colors: [
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary400,
                                                                Color(
                                                                    0x85202034)
                                                              ],
                                                              stops: [0, 1],
                                                              begin:
                                                                  AlignmentDirectional(
                                                                      0, -1),
                                                              end:
                                                                  AlignmentDirectional(
                                                                      0, 1),
                                                            ),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30,
                                                            borderWidth: 1,
                                                            buttonSize: 80,
                                                            icon: Icon(
                                                              FFIcons
                                                                  .kfiRrShoppingCartAdd,
                                                              color:
                                                                  Colors.white,
                                                              size: 23,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                  'Ravitaillemant');
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.15,
                                                  height: 100,
                                                  decoration: BoxDecoration(),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30,
                                                    borderWidth: 1,
                                                    buttonSize: 30,
                                                    icon: Icon(
                                                      FFIcons.kfiRrHeart,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 20,
                                                    ),
                                                    onPressed: () async {
                                                      context
                                                          .pushNamed('favoris');
                                                    },
                                                  ),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.15,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x00272B50),
                                                  ),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30,
                                                    borderWidth: 1,
                                                    buttonSize: 40,
                                                    icon: Icon(
                                                      Icons.person_outline,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 25,
                                                    ),
                                                    onPressed: () async {
                                                      context.pushNamed('user');
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
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
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  Align(
                    alignment: AlignmentDirectional(0, 0.44),
                    child: StreamBuilder<List<ProduitsRecord>>(
                      stream: queryProduitsRecord(),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: SpinKitPulse(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 20,
                              ),
                            ),
                          );
                        }
                        List<ProduitsRecord> columnProduitsRecordList =
                            snapshot.data!;
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                              columnProduitsRecordList.length, (columnIndex) {
                            final columnProduitsRecord =
                                columnProduitsRecordList[columnIndex];
                            return Align(
                              alignment: AlignmentDirectional(0.02, 0.67),
                              child: StreamBuilder<ProduitsRecord>(
                                stream: ProduitsRecord.getDocument(
                                    columnProduitsRecord.reference),
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
                                  final buttonProduitsRecord = snapshot.data!;
                                  return FFButtonWidget(
                                    onPressed: () async {
                                      FFAppState().update(() {
                                        FFAppState().prixDefaut = false;
                                        FFAppState().refFav = null;
                                      });
                                      FFAppState().update(() {
                                        FFAppState().qty = 1;
                                      });
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: MediaQuery.of(context)
                                                .viewInsets,
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  1,
                                              child: DetailWidget(
                                                prodRef: buttonProduitsRecord
                                                    .reference,
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                    text: 'Button',
                                    options: FFButtonOptions(
                                      width: 130,
                                      height: 40,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
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
      ),
    );
  }
}
