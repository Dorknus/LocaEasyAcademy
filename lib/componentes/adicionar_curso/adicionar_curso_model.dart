import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'adicionar_curso_widget.dart' show AdicionarCursoWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AdicionarCursoModel extends FlutterFlowModel<AdicionarCursoWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nomeCurso widget.
  FocusNode? nomeCursoFocusNode;
  TextEditingController? nomeCursoTextController;
  String? Function(BuildContext, String?)? nomeCursoTextControllerValidator;
  String? _nomeCursoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe o nome do curso';
    }

    return null;
  }

  // State field(s) for descricao widget.
  FocusNode? descricaoFocusNode;
  TextEditingController? descricaoTextController;
  String? Function(BuildContext, String?)? descricaoTextControllerValidator;
  String? _descricaoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe a descrição do curso';
    }

    return null;
  }

  // State field(s) for nomeMentor widget.
  FocusNode? nomeMentorFocusNode;
  TextEditingController? nomeMentorTextController;
  String? Function(BuildContext, String?)? nomeMentorTextControllerValidator;
  String? _nomeMentorTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe o nome do mentor do curso';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    nomeCursoTextControllerValidator = _nomeCursoTextControllerValidator;
    descricaoTextControllerValidator = _descricaoTextControllerValidator;
    nomeMentorTextControllerValidator = _nomeMentorTextControllerValidator;
  }

  @override
  void dispose() {
    nomeCursoFocusNode?.dispose();
    nomeCursoTextController?.dispose();

    descricaoFocusNode?.dispose();
    descricaoTextController?.dispose();

    nomeMentorFocusNode?.dispose();
    nomeMentorTextController?.dispose();
  }
}
