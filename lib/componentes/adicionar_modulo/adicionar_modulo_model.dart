import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'adicionar_modulo_widget.dart' show AdicionarModuloWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AdicionarModuloModel extends FlutterFlowModel<AdicionarModuloWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Insira o nome do modulo';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Query Rows] action in TextField widget.
  List<ModulosRow>? queryModuloEnter;
  // Stores action output result for [Backend Call - Query Rows] action in TextField widget.
  List<ModulosRow>? totalModulosEnter;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ModulosRow>? queryModulo;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ModulosRow>? totalModulos;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
