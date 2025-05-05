import '/componentes/menu_lateral_admin/menu_lateral_admin_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'vendas_widget.dart' show VendasWidget;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VendasModel extends FlutterFlowModel<VendasWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for menuLateralAdmin component.
  late MenuLateralAdminModel menuLateralAdminModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;

  @override
  void initState(BuildContext context) {
    menuLateralAdminModel = createModel(context, () => MenuLateralAdminModel());
  }

  @override
  void dispose() {
    menuLateralAdminModel.dispose();
  }
}
