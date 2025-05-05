import '/backend/supabase/supabase.dart';
import '/componentes/menu_lateral_admin/menu_lateral_admin_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'detalhes_usuario_widget.dart' show DetalhesUsuarioWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DetalhesUsuarioModel extends FlutterFlowModel<DetalhesUsuarioWidget> {
  ///  Local state fields for this page.

  int? cursoSelecionadoId;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for menuLateralAdmin component.
  late MenuLateralAdminModel menuLateralAdminModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for txtNome widget.
  FocusNode? txtNomeFocusNode;
  TextEditingController? txtNomeTextController;
  String? Function(BuildContext, String?)? txtNomeTextControllerValidator;
  String? _txtNomeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'O campo do nome não pode estar vazio';
    }

    if (val.length < 3) {
      return 'Mínimo de 3 caracteres';
    }

    return null;
  }

  // State field(s) for txtEmail widget.
  FocusNode? txtEmailFocusNode;
  TextEditingController? txtEmailTextController;
  String? Function(BuildContext, String?)? txtEmailTextControllerValidator;
  String? _txtEmailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'O campo do email não pode estar vazio';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Email inválido!';
    }
    return null;
  }

  // State field(s) for txtTelefone widget.
  FocusNode? txtTelefoneFocusNode;
  TextEditingController? txtTelefoneTextController;
  String? Function(BuildContext, String?)? txtTelefoneTextControllerValidator;
  String? _txtTelefoneTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'O campo de telefone não pode estar vazio';
    }

    if (val.length < 9) {
      return 'Requires at least 9 characters.';
    }

    return null;
  }

  // State field(s) for txtCargo widget.
  String? txtCargoValue;
  FormFieldController<String>? txtCargoValueController;
  // State field(s) for switchAdmin widget.
  bool? switchAdminValue;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validaAlteracao;

  @override
  void initState(BuildContext context) {
    menuLateralAdminModel = createModel(context, () => MenuLateralAdminModel());
    txtNomeTextControllerValidator = _txtNomeTextControllerValidator;
    txtEmailTextControllerValidator = _txtEmailTextControllerValidator;
    txtTelefoneTextControllerValidator = _txtTelefoneTextControllerValidator;
  }

  @override
  void dispose() {
    menuLateralAdminModel.dispose();
    tabBarController?.dispose();
    txtNomeFocusNode?.dispose();
    txtNomeTextController?.dispose();

    txtEmailFocusNode?.dispose();
    txtEmailTextController?.dispose();

    txtTelefoneFocusNode?.dispose();
    txtTelefoneTextController?.dispose();
  }
}
