import '/backend/supabase/supabase.dart';
import '/componentes/menu_lateral_admin/menu_lateral_admin_widget.dart';
import '/componentes/menu_lateral_admin_celular/menu_lateral_admin_celular_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'metricas_widget.dart' show MetricasWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MetricasModel extends FlutterFlowModel<MetricasWidget> {
  ///  Local state fields for this page.

  int? selecionaCurso;

  ///  State fields for stateful widgets in this page.

  // Model for menuLateralAdmin component.
  late MenuLateralAdminModel menuLateralAdminModel;
  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;
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
}
