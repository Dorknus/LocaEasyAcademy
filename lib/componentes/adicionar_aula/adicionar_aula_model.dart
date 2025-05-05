import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'adicionar_aula_widget.dart' show AdicionarAulaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AdicionarAulaModel extends FlutterFlowModel<AdicionarAulaWidget> {
  ///  Local state fields for this component.

  String? urlBackend;

  DateTime? duracao;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for inserirAula widget.
  FocusNode? inserirAulaFocusNode;
  TextEditingController? inserirAulaTextController;
  String? Function(BuildContext, String?)? inserirAulaTextControllerValidator;
  String? _inserirAulaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe o nome da aula';
    }

    return null;
  }

  // State field(s) for descricaoAula widget.
  FocusNode? descricaoAulaFocusNode;
  TextEditingController? descricaoAulaTextController;
  String? Function(BuildContext, String?)? descricaoAulaTextControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for inserirLink widget.
  FocusNode? inserirLinkFocusNode;
  TextEditingController? inserirLinkTextController;
  String? Function(BuildContext, String?)? inserirLinkTextControllerValidator;
  String? _inserirLinkTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe o link da aula';
    }

    if (!RegExp(kTextValidatorWebsiteRegex).hasMatch(val)) {
      return 'URL inválido!';
    }
    return null;
  }

  // State field(s) for duracaoAula widget.
  FocusNode? duracaoAulaFocusNode;
  TextEditingController? duracaoAulaTextController;
  final duracaoAulaMask = MaskTextInputFormatter(mask: '##:##:##');
  String? Function(BuildContext, String?)? duracaoAulaTextControllerValidator;
  String? _duracaoAulaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe a duração da aula';
    }

    if (!RegExp('^([01]?[0-9]|2[0-3]):([0-5]?[0-9]):([0-5]?[0-9])\$')
        .hasMatch(val)) {
      return 'Tempo de duração inválido!';
    }
    return null;
  }

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<AulasRow>? ultimoIndice;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<AulasRow>? nomeAula;

  @override
  void initState(BuildContext context) {
    inserirAulaTextControllerValidator = _inserirAulaTextControllerValidator;
    inserirLinkTextControllerValidator = _inserirLinkTextControllerValidator;
    duracaoAulaTextControllerValidator = _duracaoAulaTextControllerValidator;
  }

  @override
  void dispose() {
    inserirAulaFocusNode?.dispose();
    inserirAulaTextController?.dispose();

    descricaoAulaFocusNode?.dispose();
    descricaoAulaTextController?.dispose();

    inserirLinkFocusNode?.dispose();
    inserirLinkTextController?.dispose();

    duracaoAulaFocusNode?.dispose();
    duracaoAulaTextController?.dispose();
  }
}
