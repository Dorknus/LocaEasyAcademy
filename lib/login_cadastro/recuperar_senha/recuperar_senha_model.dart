import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'recuperar_senha_widget.dart' show RecuperarSenhaWidget;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class RecuperarSenhaModel extends FlutterFlowModel<RecuperarSenhaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailRedefinicao widget.
  FocusNode? emailRedefinicaoFocusNode;
  TextEditingController? emailRedefinicaoTextController;
  String? Function(BuildContext, String?)?
      emailRedefinicaoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailRedefinicaoFocusNode?.dispose();
    emailRedefinicaoTextController?.dispose();
  }
}
