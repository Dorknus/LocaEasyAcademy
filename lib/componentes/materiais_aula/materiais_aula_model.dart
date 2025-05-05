import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'dart:async';
import 'materiais_aula_widget.dart' show MateriaisAulaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MateriaisAulaModel extends FlutterFlowModel<MateriaisAulaWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nomeMaterial widget.
  FocusNode? nomeMaterialFocusNode;
  TextEditingController? nomeMaterialTextController;
  String? Function(BuildContext, String?)? nomeMaterialTextControllerValidator;
  String? _nomeMaterialTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe o nome do material';
    }

    return null;
  }

  // State field(s) for linkMaterial widget.
  FocusNode? linkMaterialFocusNode;
  TextEditingController? linkMaterialTextController;
  String? Function(BuildContext, String?)? linkMaterialTextControllerValidator;
  String? _linkMaterialTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Informe o link do material';
    }

    if (!RegExp(kTextValidatorWebsiteRegex).hasMatch(val)) {
      return 'Link inválido';
    }
    return null;
  }

  Completer<List<AulasMateriaisRow>>? requestCompleter;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<AulasMateriaisRow>();

  @override
  void initState(BuildContext context) {
    nomeMaterialTextControllerValidator = _nomeMaterialTextControllerValidator;
    linkMaterialTextControllerValidator = _linkMaterialTextControllerValidator;
  }

  @override
  void dispose() {
    nomeMaterialFocusNode?.dispose();
    nomeMaterialTextController?.dispose();

    linkMaterialFocusNode?.dispose();
    linkMaterialTextController?.dispose();

    paginatedDataTableController.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
