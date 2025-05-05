import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'remover_aluno_widget.dart' show RemoverAlunoWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RemoverAlunoModel extends FlutterFlowModel<RemoverAlunoWidget> {
  ///  Local state fields for this component.

  String? arquivo;

  String? arquivoExclusao;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for removerEmail widget.
  FocusNode? removerEmailFocusNode;
  TextEditingController? removerEmailTextController;
  String? Function(BuildContext, String?)? removerEmailTextControllerValidator;
  String? _removerEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'O email não pode ser vazio';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Email invalido';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    removerEmailTextControllerValidator = _removerEmailTextControllerValidator;
  }

  @override
  void dispose() {
    removerEmailFocusNode?.dispose();
    removerEmailTextController?.dispose();
  }
}
