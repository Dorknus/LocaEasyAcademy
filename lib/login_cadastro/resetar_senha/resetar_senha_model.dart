import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'resetar_senha_widget.dart' show ResetarSenhaWidget;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ResetarSenhaModel extends FlutterFlowModel<ResetarSenhaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for senhaNova widget.
  FocusNode? senhaNovaFocusNode;
  TextEditingController? senhaNovaTextController;
  late bool senhaNovaVisibility;
  String? Function(BuildContext, String?)? senhaNovaTextControllerValidator;
  // State field(s) for confsenhaNova widget.
  FocusNode? confsenhaNovaFocusNode;
  TextEditingController? confsenhaNovaTextController;
  late bool confsenhaNovaVisibility;
  String? Function(BuildContext, String?)? confsenhaNovaTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in confsenhaNova widget.
  List<UsersRow>? userQuerySend;
  // Stores action output result for [Backend Call - Query Rows] action in Botao widget.
  List<UsersRow>? userQuery;

  @override
  void initState(BuildContext context) {
    senhaNovaVisibility = false;
    confsenhaNovaVisibility = false;
  }

  @override
  void dispose() {
    senhaNovaFocusNode?.dispose();
    senhaNovaTextController?.dispose();

    confsenhaNovaFocusNode?.dispose();
    confsenhaNovaTextController?.dispose();
  }
}
