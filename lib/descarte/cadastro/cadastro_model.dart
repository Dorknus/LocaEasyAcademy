import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'cadastro_widget.dart' show CadastroWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CadastroModel extends FlutterFlowModel<CadastroWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for servico widget.
  String? servicoValue;
  FormFieldController<String>? servicoValueController;
  // State field(s) for nomeAluno widget.
  FocusNode? nomeAlunoFocusNode;
  TextEditingController? nomeAlunoTextController;
  String? Function(BuildContext, String?)? nomeAlunoTextControllerValidator;
  String? _nomeAlunoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe o seu nome';
    }

    return null;
  }

  // State field(s) for emailAluno widget.
  FocusNode? emailAlunoFocusNode;
  TextEditingController? emailAlunoTextController;
  String? Function(BuildContext, String?)? emailAlunoTextControllerValidator;
  String? _emailAlunoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe seu e-mail';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Email inválido';
    }
    return null;
  }

  // State field(s) for senhaAluno widget.
  FocusNode? senhaAlunoFocusNode;
  TextEditingController? senhaAlunoTextController;
  late bool senhaAlunoVisibility;
  String? Function(BuildContext, String?)? senhaAlunoTextControllerValidator;
  String? _senhaAlunoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe a sua senha';
    }

    return null;
  }

  // State field(s) for confSenhaAluno widget.
  FocusNode? confSenhaAlunoFocusNode;
  TextEditingController? confSenhaAlunoTextController;
  late bool confSenhaAlunoVisibility;
  String? Function(BuildContext, String?)?
      confSenhaAlunoTextControllerValidator;
  String? _confSenhaAlunoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Confirme a sua senha';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Insert Row] action in confSenhaAluno widget.
  UsersRow? cadastroAlunoEnvio;
  // Stores action output result for [Backend Call - Insert Row] action in cadastroAluno widget.
  UsersRow? cadastroAluno;
  // State field(s) for nomeCompleto widget.
  FocusNode? nomeCompletoFocusNode;
  TextEditingController? nomeCompletoTextController;
  String? Function(BuildContext, String?)? nomeCompletoTextControllerValidator;
  String? _nomeCompletoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe o seu nome';
    }

    return null;
  }

  // State field(s) for emailCadastro widget.
  FocusNode? emailCadastroFocusNode;
  TextEditingController? emailCadastroTextController;
  String? Function(BuildContext, String?)? emailCadastroTextControllerValidator;
  String? _emailCadastroTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe seu e-mail';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'E-mail inválido';
    }
    return null;
  }

  // State field(s) for senhaCadastro widget.
  FocusNode? senhaCadastroFocusNode;
  TextEditingController? senhaCadastroTextController;
  late bool senhaCadastroVisibility;
  String? Function(BuildContext, String?)? senhaCadastroTextControllerValidator;
  String? _senhaCadastroTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe a sua senha';
    }

    return null;
  }

  // State field(s) for confSenhaCadastro widget.
  FocusNode? confSenhaCadastroFocusNode;
  TextEditingController? confSenhaCadastroTextController;
  late bool confSenhaCadastroVisibility;
  String? Function(BuildContext, String?)?
      confSenhaCadastroTextControllerValidator;
  String? _confSenhaCadastroTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Confirme a sua senha';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Insert Row] action in confSenhaCadastro widget.
  UsersRow? cadastroMentorEnvio;
  // Stores action output result for [Backend Call - Insert Row] action in cadastrarMentor widget.
  UsersRow? cadastroMentor;

  @override
  void initState(BuildContext context) {
    nomeAlunoTextControllerValidator = _nomeAlunoTextControllerValidator;
    emailAlunoTextControllerValidator = _emailAlunoTextControllerValidator;
    senhaAlunoVisibility = false;
    senhaAlunoTextControllerValidator = _senhaAlunoTextControllerValidator;
    confSenhaAlunoVisibility = false;
    confSenhaAlunoTextControllerValidator =
        _confSenhaAlunoTextControllerValidator;
    nomeCompletoTextControllerValidator = _nomeCompletoTextControllerValidator;
    emailCadastroTextControllerValidator =
        _emailCadastroTextControllerValidator;
    senhaCadastroVisibility = false;
    senhaCadastroTextControllerValidator =
        _senhaCadastroTextControllerValidator;
    confSenhaCadastroVisibility = false;
    confSenhaCadastroTextControllerValidator =
        _confSenhaCadastroTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    nomeAlunoFocusNode?.dispose();
    nomeAlunoTextController?.dispose();

    emailAlunoFocusNode?.dispose();
    emailAlunoTextController?.dispose();

    senhaAlunoFocusNode?.dispose();
    senhaAlunoTextController?.dispose();

    confSenhaAlunoFocusNode?.dispose();
    confSenhaAlunoTextController?.dispose();

    nomeCompletoFocusNode?.dispose();
    nomeCompletoTextController?.dispose();

    emailCadastroFocusNode?.dispose();
    emailCadastroTextController?.dispose();

    senhaCadastroFocusNode?.dispose();
    senhaCadastroTextController?.dispose();

    confSenhaCadastroFocusNode?.dispose();
    confSenhaCadastroTextController?.dispose();
  }
}
