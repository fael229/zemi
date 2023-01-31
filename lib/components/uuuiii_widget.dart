import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class UuuiiiWidget extends StatefulWidget {
  const UuuiiiWidget({Key? key}) : super(key: key);

  @override
  _UuuiiiWidgetState createState() => _UuuiiiWidgetState();
}

class _UuuiiiWidgetState extends State<UuuiiiWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Lottie.asset(
              'assets/lottie_animations/lf30_editor_1sbokjwi.json',
              width: 200,
              height: 210,
              fit: BoxFit.cover,
              animate: true,
            ),
          ],
        ),
      ),
    );
  }
}
