import '/backend/supabase/supabase.dart';
import '/componentes/menu_lateral_admin/menu_lateral_admin_widget.dart';
import '/componentes/menu_lateral_admin_celular/menu_lateral_admin_celular_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'dart:async';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  Local state fields for this page.

  String? selecionaCargo;

  int? selecionaCurso;

  ///  State fields for stateful widgets in this page.

  // Model for menuLateralAdmin component.
  late MenuLateralAdminModel menuLateralAdminModel;
  Completer<List<UserDetalhesAulasRow>>? requestCompleter;
  // State field(s) for DropDownCurso widget.
  int? dropDownCursoValue;
  FormFieldController<int>? dropDownCursoValueController;
  // State field(s) for DropDownCargo widget.
  String? dropDownCargoValue;
  FormFieldController<String>? dropDownCargoValueController;
  // Model for menuLateralAdminCelular component.
  late MenuLateralAdminCelularModel menuLateralAdminCelularModel;

  @override
  void initState(BuildContext context) {
    menuLateralAdminModel = createModel(context, () => MenuLateralAdminModel());
    menuLateralAdminCelularModel =
        createModel(context, () => MenuLateralAdminCelularModel());
  }

  @override
  void dispose() {
    menuLateralAdminModel.dispose();
    menuLateralAdminCelularModel.dispose();
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
