import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'suporte_widget.dart' show SuporteWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SuporteModel extends FlutterFlowModel<SuporteWidget> {
  ///  Local state fields for this page.

  String? dropdownSelecionado = 'null';

  ///  State fields for stateful widgets in this page.

  final formKey3 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for servico widget.
  String? servicoValue;
  FormFieldController<String>? servicoValueController;
  // State field(s) for alterarNome widget.
  FocusNode? alterarNomeFocusNode;
  TextEditingController? alterarNomeTextController;
  String? Function(BuildContext, String?)? alterarNomeTextControllerValidator;
  String? _alterarNomeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Preencha este campo com o nome';
    }

    return null;
  }

  // State field(s) for alterarEmail widget.
  FocusNode? alterarEmailFocusNode;
  TextEditingController? alterarEmailTextController;
  String? Function(BuildContext, String?)? alterarEmailTextControllerValidator;
  String? _alterarEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Preencha este campo com e-mail';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'E-mail inserido inválido';
    }
    return null;
  }

  // State field(s) for alterarTelefone widget.
  FocusNode? alterarTelefoneFocusNode;
  TextEditingController? alterarTelefoneTextController;
  String? Function(BuildContext, String?)?
      alterarTelefoneTextControllerValidator;
  String? _alterarTelefoneTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Preencha este campo com o telefone';
    }

    return null;
  }

  // State field(s) for removerNome widget.
  FocusNode? removerNomeFocusNode;
  TextEditingController? removerNomeTextController;
  String? Function(BuildContext, String?)? removerNomeTextControllerValidator;
  String? _removerNomeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Preencha este campo com o nome';
    }

    return null;
  }

  // State field(s) for removerEmail widget.
  FocusNode? removerEmailFocusNode;
  TextEditingController? removerEmailTextController;
  String? Function(BuildContext, String?)? removerEmailTextControllerValidator;
  String? _removerEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Preencha este campo com o e-mail';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'E-mail inserido inválido';
    }
    return null;
  }

  // State field(s) for criarNome widget.
  FocusNode? criarNomeFocusNode;
  TextEditingController? criarNomeTextController;
  String? Function(BuildContext, String?)? criarNomeTextControllerValidator;
  String? _criarNomeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Preencha este campo com seu nome';
    }

    return null;
  }

  // State field(s) for criarEmail widget.
  FocusNode? criarEmailFocusNode;
  TextEditingController? criarEmailTextController;
  String? Function(BuildContext, String?)? criarEmailTextControllerValidator;
  String? _criarEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Preencha este campo com seu e-mail';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'E-mail inserido i';
    }
    return null;
  }

  // State field(s) for criarTelefone widget.
  FocusNode? criarTelefoneFocusNode;
  TextEditingController? criarTelefoneTextController;
  String? Function(BuildContext, String?)? criarTelefoneTextControllerValidator;
  String? _criarTelefoneTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Preencha este campo com seu telefone';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    alterarNomeTextControllerValidator = _alterarNomeTextControllerValidator;
    alterarEmailTextControllerValidator = _alterarEmailTextControllerValidator;
    alterarTelefoneTextControllerValidator =
        _alterarTelefoneTextControllerValidator;
    removerNomeTextControllerValidator = _removerNomeTextControllerValidator;
    removerEmailTextControllerValidator = _removerEmailTextControllerValidator;
    criarNomeTextControllerValidator = _criarNomeTextControllerValidator;
    criarEmailTextControllerValidator = _criarEmailTextControllerValidator;
    criarTelefoneTextControllerValidator =
        _criarTelefoneTextControllerValidator;
  }

  @override
  void dispose() {
    alterarNomeFocusNode?.dispose();
    alterarNomeTextController?.dispose();

    alterarEmailFocusNode?.dispose();
    alterarEmailTextController?.dispose();

    alterarTelefoneFocusNode?.dispose();
    alterarTelefoneTextController?.dispose();

    removerNomeFocusNode?.dispose();
    removerNomeTextController?.dispose();

    removerEmailFocusNode?.dispose();
    removerEmailTextController?.dispose();

    criarNomeFocusNode?.dispose();
    criarNomeTextController?.dispose();

    criarEmailFocusNode?.dispose();
    criarEmailTextController?.dispose();

    criarTelefoneFocusNode?.dispose();
    criarTelefoneTextController?.dispose();
  }
}
