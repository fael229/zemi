import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/chat/index.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllchatWidget extends StatefulWidget {
  const AllchatWidget({Key? key}) : super(key: key);

  @override
  _AllchatWidgetState createState() => _AllchatWidgetState();
}

class _AllchatWidgetState extends State<AllchatWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'allchat'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 50,
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 30,
                            ),
                            onPressed: () async {
                              context.pop();
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                          child: Text(
                            'Retour',
                            style: FlutterFlowTheme.of(context).title2.override(
                                  fontFamily: 'sf pro text',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                    child: Text(
                      'Messages',
                      style: FlutterFlowTheme.of(context).title2.override(
                            fontFamily: 'sf pro text',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 22,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          elevation: 2,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Visibility(
            visible:
                valueOrDefault<bool>(currentUserDocument?.admin, false) == true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
              child: AuthUserStreamWidget(
                builder: (context) => StreamBuilder<List<ChatsRecord>>(
                  stream: queryChatsRecord(
                    queryBuilder: (chatsRecord) => chatsRecord
                        .where('users', arrayContains: currentUserReference)
                        .orderBy('last_message_time', descending: true),
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
                    List<ChatsRecord> listViewChatsRecordList = snapshot.data!;
                    if (listViewChatsRecordList.isEmpty) {
                      return Center(
                        child: Image.asset(
                          'assets/images/72842-icon-2-chat.gif',
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      );
                    }
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewChatsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewChatsRecord =
                            listViewChatsRecordList[listViewIndex];
                        return StreamBuilder<FFChatInfo>(
                          stream: FFChatManager.instance
                              .getChatInfo(chatRecord: listViewChatsRecord),
                          builder: (context, snapshot) {
                            final chatInfo = snapshot.data ??
                                FFChatInfo(listViewChatsRecord);
                            return FFChatPreview(
                              onTap: () => context.pushNamed(
                                'Support',
                                queryParams: {
                                  'chatUser': serializeParam(
                                    chatInfo.otherUsers.length == 1
                                        ? chatInfo.otherUsersList.first
                                        : null,
                                    ParamType.Document,
                                  ),
                                  'chatRef': serializeParam(
                                    chatInfo.chatRecord.reference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'chatUser': chatInfo.otherUsers.length == 1
                                      ? chatInfo.otherUsersList.first
                                      : null,
                                },
                              ),
                              lastChatText: chatInfo.chatPreviewMessage(),
                              lastChatTime: listViewChatsRecord.lastMessageTime,
                              seen: listViewChatsRecord.lastMessageSeenBy!
                                  .contains(currentUserReference),
                              title: chatInfo.chatPreviewTitle(),
                              userProfilePic: chatInfo.chatPreviewPic(),
                              color: Color(0xFFEEF0F5),
                              unreadColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              titleTextStyle: GoogleFonts.getFont(
                                'DM Sans',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              dateTextStyle: GoogleFonts.getFont(
                                'DM Sans',
                                color: Color(0x73000000),
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                              previewTextStyle: GoogleFonts.getFont(
                                'DM Sans',
                                color: Color(0x73000000),
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                              borderRadius: BorderRadius.circular(0),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
