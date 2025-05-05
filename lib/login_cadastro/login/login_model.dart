import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for emailLoginAluno widget.
  FocusNode? emailLoginAlunoFocusNode;
  TextEditingController? emailLoginAlunoTextController;
  String? Function(BuildContext, String?)?
      emailLoginAlunoTextControllerValidator;
  String? _emailLoginAlunoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe seu e-mail';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'E-mail inválido';
    }
    return null;
  }

  // State field(s) for senhaLoginAluno widget.
  FocusNode? senhaLoginAlunoFocusNode;
  TextEditingController? senhaLoginAlunoTextController;
  late bool senhaLoginAlunoVisibility;
  String? Function(BuildContext, String?)?
      senhaLoginAlunoTextControllerValidator;
  String? _senhaLoginAlunoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe sua senha';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in senhaLoginAluno widget.
  bool? validaFormEnter;
  // Stores action output result for [Backend Call - Query Rows] action in senhaLoginAluno widget.
  List<UsersRow>? consultaAlunoEnter;
  // Stores action output result for [Validate Form] action in BotaoLoginAluno widget.
  bool? validaForm;
  // Stores action output result for [Backend Call - Query Rows] action in BotaoLoginAluno widget.
  List<UsersRow>? consultaAluno;
  // State field(s) for emailLoginMentor widget.
  FocusNode? emailLoginMentorFocusNode;
  TextEditingController? emailLoginMentorTextController;
  String? Function(BuildContext, String?)?
      emailLoginMentorTextControllerValidator;
  String? _emailLoginMentorTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe seu e-mail';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'E-mail inválido';
    }
    return null;
  }

  // State field(s) for senhaLoginMentor widget.
  FocusNode? senhaLoginMentorFocusNode;
  TextEditingController? senhaLoginMentorTextController;
  late bool senhaLoginMentorVisibility;
  String? Function(BuildContext, String?)?
      senhaLoginMentorTextControllerValidator;
  String? _senhaLoginMentorTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe sua senha';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in senhaLoginMentor widget.
  bool? validaFormMentorEnter;
  // Stores action output result for [Backend Call - Query Rows] action in senhaLoginMentor widget.
  List<UsersRow>? consultaMentorEnter;
  // Stores action output result for [Validate Form] action in BotaoLoginMentor widget.
  bool? validaFormMentor;
  // Stores action output result for [Backend Call - Query Rows] action in BotaoLoginMentor widget.
  List<UsersRow>? consultaMentor;

  @override
  void initState(BuildContext context) {
    emailLoginAlunoTextControllerValidator =
        _emailLoginAlunoTextControllerValidator;
    senhaLoginAlunoVisibility = false;
    senhaLoginAlunoTextControllerValidator =
        _senhaLoginAlunoTextControllerValidator;
    emailLoginMentorTextControllerValidator =
        _emailLoginMentorTextControllerValidator;
    senhaLoginMentorVisibility = false;
    senhaLoginMentorTextControllerValidator =
        _senhaLoginMentorTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    emailLoginAlunoFocusNode?.dispose();
    emailLoginAlunoTextController?.dispose();

    senhaLoginAlunoFocusNode?.dispose();
    senhaLoginAlunoTextController?.dispose();

    emailLoginMentorFocusNode?.dispose();
    emailLoginMentorTextController?.dispose();

    senhaLoginMentorFocusNode?.dispose();
    senhaLoginMentorTextController?.dispose();
  }
}
