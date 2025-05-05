import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'editar_curso_widget.dart' show EditarCursoWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditarCursoModel extends FlutterFlowModel<EditarCursoWidget> {
  ///  Local state fields for this component.

  String? urlBackend;

  DateTime? duracao;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for inserirCurso widget.
  FocusNode? inserirCursoFocusNode;
  TextEditingController? inserirCursoTextController;
  String? Function(BuildContext, String?)? inserirCursoTextControllerValidator;
  String? _inserirCursoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe o nome do curso';
    }

    return null;
  }

  // State field(s) for descricaoCurso widget.
  FocusNode? descricaoCursoFocusNode;
  TextEditingController? descricaoCursoTextController;
  String? Function(BuildContext, String?)?
      descricaoCursoTextControllerValidator;
  String? _descricaoCursoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe a descrição do curso';
    }

    return null;
  }

  // State field(s) for informarMentor widget.
  FocusNode? informarMentorFocusNode;
  TextEditingController? informarMentorTextController;
  String? Function(BuildContext, String?)?
      informarMentorTextControllerValidator;
  String? _informarMentorTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe o nome do mentor do curso';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    inserirCursoTextControllerValidator = _inserirCursoTextControllerValidator;
    descricaoCursoTextControllerValidator =
        _descricaoCursoTextControllerValidator;
    informarMentorTextControllerValidator =
        _informarMentorTextControllerValidator;
  }

  @override
  void dispose() {
    inserirCursoFocusNode?.dispose();
    inserirCursoTextController?.dispose();

    descricaoCursoFocusNode?.dispose();
    descricaoCursoTextController?.dispose();

    informarMentorFocusNode?.dispose();
    informarMentorTextController?.dispose();
  }
}
