import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Detail2Widget extends StatefulWidget {
  const Detail2Widget({
    Key? key,
    this.prodRef,
  }) : super(key: key);

  final DocumentReference? prodRef;

  @override
  _Detail2WidgetState createState() => _Detail2WidgetState();
}

class _Detail2WidgetState extends State<Detail2Widget> {
  FavRecord? ref;
  int? countControllerValue;
  PanierRecord? refpanier;
  TextEditingController? textController;
  double? ratingBarValue;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: Color(0x00FFFFFF),
              ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0, 0),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 450,
            ),
            decoration: BoxDecoration(
              color: Color(0x00272B50),
            ),
            child: StreamBuilder<ProduitsRecord>(
              stream: ProduitsRecord.getDocument(widget.prodRef!),
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
                final stackProduitsRecord = snapshot.data!;
                return Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 1),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.7,
                        constraints: BoxConstraints(
                          maxWidth: 450,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(18, 55, 18, 10),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    if (stackProduitsRecord.favoris!
                                            .toList()
                                            .contains(currentUserEmail) ==
                                        true)
                                      StreamBuilder<List<FavRecord>>(
                                        stream: queryFavRecord(
                                          parent: currentUserReference,
                                          queryBuilder: (favRecord) =>
                                              favRecord.where('ref',
                                                  isEqualTo: stackProduitsRecord
                                                      .reference),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  size: 20,
                                                ),
                                              ),
                                            );
                                          }
                                          List<FavRecord>
                                              iconButtonFavRecordList =
                                              snapshot.data!;
                                          final iconButtonFavRecord =
                                              iconButtonFavRecordList.isNotEmpty
                                                  ? iconButtonFavRecordList
                                                      .first
                                                  : null;
                                          return FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30,
                                            borderWidth: 1,
                                            buttonSize: 60,
                                            icon: Icon(
                                              Icons.favorite_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 22,
                                            ),
                                            onPressed: () async {
                                              await iconButtonFavRecord!
                                                  .reference
                                                  .delete();

                                              final produitsUpdateData = {
                                                'favoris':
                                                    FieldValue.arrayRemove(
                                                        [currentUserEmail]),
                                                'nbreFav':
                                                    FieldValue.increment(-(1)),
                                              };
                                              await stackProduitsRecord
                                                  .reference
                                                  .update(produitsUpdateData);
                                            },
                                          );
                                        },
                                      ),
                                    if (stackProduitsRecord.favoris!
                                            .toList()
                                            .contains(currentUserEmail) ==
                                        false)
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30,
                                        borderWidth: 1,
                                        buttonSize: 40,
                                        icon: Icon(
                                          FFIcons.kfiRrHeart,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 20,
                                        ),
                                        onPressed: () async {
                                          final favCreateData =
                                              createFavRecordData(
                                            date: getCurrentTimestamp,
                                            ref: stackProduitsRecord.reference,
                                            qty: 1,
                                          );
                                          var favRecordReference =
                                              FavRecord.createDoc(
                                                  currentUserReference!);
                                          await favRecordReference
                                              .set(favCreateData);
                                          ref = FavRecord.getDocumentFromData(
                                              favCreateData,
                                              favRecordReference);
                                          FFAppState().update(() {
                                            FFAppState().refFav =
                                                ref!.reference;
                                          });

                                          final produitsUpdateData = {
                                            'favoris': FieldValue.arrayUnion(
                                                [currentUserEmail]),
                                            'nbreFav': FieldValue.increment(1),
                                          };
                                          await stackProduitsRecord.reference
                                              .update(produitsUpdateData);

                                          setState(() {});
                                        },
                                      ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        height: 80,
                                        constraints: BoxConstraints(
                                          maxWidth: 250,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      stackProduitsRecord.nom!,
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLines: 2,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'sf pro text',
                                                                fontSize: 20,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            () {
                                              if (stackProduitsRecord.multi ==
                                                  false) {
                                                return '${functions.multippl(stackProduitsRecord.prix!, FFAppState().qty).toString()} FCFA';
                                              } else if ((stackProduitsRecord
                                                          .multi ==
                                                      true) &&
                                                  (FFAppState().complet ==
                                                      true)) {
                                                return '${functions.multippl(stackProduitsRecord.prixComplet!, FFAppState().qty).toString()} FCFA';
                                              } else {
                                                return '${functions.multippl(stackProduitsRecord.prixDemi!, FFAppState().qty).toString()} FCFA';
                                              }
                                            }(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'sf pro text',
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 10),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    height: 1,
                                    decoration: BoxDecoration(
                                      color: Color(0x3EA0A4A8),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Ouverture - Fermeture',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'sf pro text',
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 10, 8, 10),
                                          child: Text(
                                            '${dateTimeFormat(
                                              'Hm',
                                              stackProduitsRecord.ouv,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )} - ${dateTimeFormat(
                                              'Hm',
                                              stackProduitsRecord.clo,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )}',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'sf pro text',
                                                  color: Colors.white,
                                                  fontSize: 14,
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Quantité',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'sf pro text',
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                      Container(
                                        width: 110,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: Color(0x819E9E9E),
                                          ),
                                        ),
                                        child: FlutterFlowCountController(
                                          decrementIconBuilder: (enabled) =>
                                              FaIcon(
                                            FontAwesomeIcons.minus,
                                            color: enabled
                                                ? Color(0xDD000000)
                                                : Color(0xFFEEEEEE),
                                            size: 15,
                                          ),
                                          incrementIconBuilder: (enabled) =>
                                              FaIcon(
                                            FontAwesomeIcons.plus,
                                            color: enabled
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryColor
                                                : Color(0xFFEEEEEE),
                                            size: 15,
                                          ),
                                          countBuilder: (count) => Text(
                                            count.toString(),
                                            style: GoogleFonts.getFont(
                                              'Roboto',
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13,
                                            ),
                                          ),
                                          count: countControllerValue ??= 1,
                                          updateCount: (count) async {
                                            setState(() =>
                                                countControllerValue = count);
                                            FFAppState().update(() {
                                              FFAppState().qty =
                                                  countControllerValue!;
                                            });
                                          },
                                          stepSize: 1,
                                          minimum: 1,
                                          maximum: 10,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 0, 8, 0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 10),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.85,
                                    height: 1,
                                    decoration: BoxDecoration(
                                      color: Color(0x3EA0A4A8),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Type de Plat',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'sf pro text',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (stackProduitsRecord.prix == 0)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 14, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                FFAppState().update(() {
                                                  FFAppState().complet = true;
                                                });
                                              },
                                              child: Container(
                                                width: 130,
                                                decoration: BoxDecoration(
                                                  color: FFAppState().complet ==
                                                          true
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primaryColor
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 20, 10, 20),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      stackProduitsRecord
                                                          .nomComplet,
                                                      'null',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'sf pro text',
                                                          color: FFAppState()
                                                                      .complet ==
                                                                  true
                                                              ? Colors.white
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                FFAppState().update(() {
                                                  FFAppState().complet = false;
                                                });
                                              },
                                              child: Container(
                                                width: 130,
                                                decoration: BoxDecoration(
                                                  color: FFAppState().complet ==
                                                          false
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primaryColor
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 20, 10, 20),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      stackProduitsRecord
                                                          .nomDemi,
                                                      'null',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'sf pro text',
                                                          color: FFAppState()
                                                                      .complet ==
                                                                  true
                                                              ? FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText
                                                              : Colors.white,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: false,
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child:
                                            StreamBuilder<List<PanierRecord>>(
                                          stream: queryPanierRecord(
                                            parent: currentUserReference,
                                            queryBuilder: (panierRecord) =>
                                                panierRecord.where('prodRef',
                                                    isEqualTo:
                                                        stackProduitsRecord
                                                            .reference),
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 20,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<PanierRecord>
                                                buttonPanierRecordList =
                                                snapshot.data!;
                                            final buttonPanierRecord =
                                                buttonPanierRecordList
                                                        .isNotEmpty
                                                    ? buttonPanierRecordList
                                                        .first
                                                    : null;
                                            return FFButtonWidget(
                                              onPressed: () async {
                                                if (FFAppState()
                                                        .panieRef
                                                        .length <
                                                    4) {
                                                  final panierCreateData =
                                                      createPanierRecordData(
                                                    prodRef: stackProduitsRecord
                                                        .reference,
                                                    qty: FFAppState().qty,
                                                    mt: functions.reduce(() {
                                                      if (stackProduitsRecord
                                                              .multi ==
                                                          false) {
                                                        return functions.multippl(
                                                            stackProduitsRecord
                                                                .prix!,
                                                            FFAppState().qty);
                                                      } else if ((stackProduitsRecord
                                                                  .multi ==
                                                              true) &&
                                                          (FFAppState()
                                                                  .complet ==
                                                              true)) {
                                                        return functions.multippl(
                                                            stackProduitsRecord
                                                                .prixComplet!,
                                                            FFAppState().qty);
                                                      } else {
                                                        return functions.multippl(
                                                            stackProduitsRecord
                                                                .prixDemi!,
                                                            FFAppState().qty);
                                                      }
                                                    }(),
                                                        stackProduitsRecord
                                                            .pourcentage!),
                                                    type: () {
                                                      if (stackProduitsRecord
                                                              .multi ==
                                                          false) {
                                                        return 'simple';
                                                      } else if ((stackProduitsRecord
                                                                  .multi ==
                                                              true) &&
                                                          (FFAppState()
                                                                  .complet ==
                                                              true)) {
                                                        return 'plat complet';
                                                      } else {
                                                        return 'demi plat';
                                                      }
                                                    }(),
                                                  );
                                                  var panierRecordReference =
                                                      PanierRecord.createDoc(
                                                          currentUserReference!);
                                                  await panierRecordReference
                                                      .set(panierCreateData);
                                                  refpanier = PanierRecord
                                                      .getDocumentFromData(
                                                          panierCreateData,
                                                          panierRecordReference);
                                                  FFAppState().update(() {
                                                    FFAppState().addToPanieRef(
                                                        refpanier!.reference);
                                                  });

                                                  final panierUpdateData =
                                                      createPanierRecordData(
                                                    ref: refpanier!.reference,
                                                  );
                                                  await refpanier!.reference
                                                      .update(panierUpdateData);
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Ajouté au panier',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                    ),
                                                  );

                                                  context.pushNamed('cart2');
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Maximum atteint',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                    ),
                                                  );
                                                }

                                                setState(() {});
                                              },
                                              text: 'Ajouter au Panier',
                                              options: FFButtonOptions(
                                                width: 130,
                                                height: 40,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              'sf pro text',
                                                          color: Colors.white,
                                                          useGoogleFonts: false,
                                                        ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Stack(
                                        children: [
                                          if (stackProduitsRecord.noteUser!
                                                  .toList()
                                                  .contains(currentUserEmail) ==
                                              false)
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Votre note : ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                                RatingBar.builder(
                                                  onRatingUpdate:
                                                      (newValue) async {
                                                    setState(() =>
                                                        ratingBarValue =
                                                            newValue);

                                                    final noteCreateData =
                                                        createNoteRecordData(
                                                      prodRef:
                                                          stackProduitsRecord
                                                              .reference,
                                                      rate: ratingBarValue,
                                                    );
                                                    await NoteRecord.createDoc(
                                                            currentUserReference!)
                                                        .set(noteCreateData);

                                                    final produitsUpdateData = {
                                                      ...createProduitsRecordData(
                                                        moyenne: functions.rate(
                                                            stackProduitsRecord
                                                                .note!
                                                                .toList(),
                                                            stackProduitsRecord
                                                                .note!
                                                                .toList()
                                                                .length),
                                                      ),
                                                      'note':
                                                          FieldValue.arrayUnion(
                                                              [ratingBarValue]),
                                                      'noteUser': FieldValue
                                                          .arrayUnion([
                                                        currentUserEmail
                                                      ]),
                                                    };
                                                    await stackProduitsRecord
                                                        .reference
                                                        .update(
                                                            produitsUpdateData);
                                                  },
                                                  itemBuilder:
                                                      (context, index) => Icon(
                                                    Icons.star_rounded,
                                                    color: Color(0xFFFFCC53),
                                                  ),
                                                  direction: Axis.horizontal,
                                                  initialRating:
                                                      ratingBarValue ??= 0,
                                                  unratedColor:
                                                      Color(0xFF9E9E9E),
                                                  itemCount: 5,
                                                  itemSize: 31,
                                                  glowColor: Color(0xFFFFCC53),
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Moyenne:',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  functions
                                                      .rate(
                                                          stackProduitsRecord
                                                              .note!
                                                              .toList(),
                                                          stackProduitsRecord
                                                              .note!
                                                              .toList()
                                                              .length)
                                                      .toString(),
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
                                                        fontSize: 18,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 0, 0),
                                                  child: Icon(
                                                    Icons.star_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 24,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Laisser un Commantaire:',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            TextFormField(
                                              controller: textController,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: 'Votre commentaire',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                              maxLines: 8,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 5, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      final avisCreateData =
                                                          createAvisRecordData(
                                                        pp: currentUserPhoto,
                                                        comment: textController!
                                                            .text,
                                                        nom:
                                                            currentUserDisplayName,
                                                        date:
                                                            getCurrentTimestamp,
                                                      );
                                                      await AvisRecord.createDoc(
                                                              stackProduitsRecord
                                                                  .reference)
                                                          .set(avisCreateData);

                                                      final produitsUpdateData =
                                                          {
                                                        'nbreAvis': FieldValue
                                                            .increment(1),
                                                      };
                                                      await stackProduitsRecord
                                                          .reference
                                                          .update(
                                                              produitsUpdateData);
                                                    },
                                                    text: 'Envoyer',
                                                    options: FFButtonOptions(
                                                      width: 130,
                                                      height: 40,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle2
                                                              .override(
                                                                fontFamily:
                                                                    'sf pro text',
                                                                color: Colors
                                                                    .white,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
                                        child: StreamBuilder<List<AvisRecord>>(
                                          stream: queryAvisRecord(
                                            parent:
                                                stackProduitsRecord.reference,
                                            queryBuilder: (avisRecord) =>
                                                avisRecord.orderBy('date',
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
                                            List<AvisRecord>
                                                columnAvisRecordList =
                                                snapshot.data!;
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                  columnAvisRecordList.length,
                                                  (columnIndex) {
                                                final columnAvisRecord =
                                                    columnAvisRecordList[
                                                        columnIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 12, 0, 0),
                                                  child:
                                                      StreamBuilder<AvisRecord>(
                                                    stream:
                                                        AvisRecord.getDocument(
                                                            columnAvisRecord
                                                                .reference),
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
                                                      final menuItemAvisRecord =
                                                          snapshot.data!;
                                                      return Container(
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 500,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 3,
                                                              color: Color(
                                                                  0x411D2429),
                                                              offset:
                                                                  Offset(0, 1),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      8, 8, 8),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            1,
                                                                            1,
                                                                            1),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
                                                                  child: Image
                                                                      .network(
                                                                    menuItemAvisRecord
                                                                        .pp!,
                                                                    width: 40,
                                                                    height: 40,
                                                                    fit: BoxFit
                                                                        .fill,
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          0,
                                                                          4,
                                                                          0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                4,
                                                                                8),
                                                                            child:
                                                                                Text(
                                                                              dateTimeFormat(
                                                                                'relative',
                                                                                menuItemAvisRecord.date!,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              textAlign: TextAlign.end,
                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                    fontFamily: 'sf pro text',
                                                                                    fontSize: 12,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Text(
                                                                        menuItemAvisRecord
                                                                            .nom!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .subtitle1
                                                                            .override(
                                                                              fontFamily: 'sf pro text',
                                                                              fontSize: 15,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            flex:
                                                                                2,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 4, 8, 0),
                                                                              child: AutoSizeText(
                                                                                menuItemAvisRecord.comment!,
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                      fontFamily: 'sf pro text',
                                                                                      fontSize: 12,
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.6, -0.5),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 25,
                              color: Color(0x335A5A5A),
                              offset: Offset(0, 20),
                              spreadRadius: 20,
                            )
                          ],
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          width: 210,
                          height: 210,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: CachedNetworkImage(
                            imageUrl: stackProduitsRecord.image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, -0.9),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 80,
                        icon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 60,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                          FFAppState().update(() {
                            FFAppState().prixDefaut = true;
                          });
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
