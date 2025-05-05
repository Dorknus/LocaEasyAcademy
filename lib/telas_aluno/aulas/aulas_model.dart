import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/componentes/aula_concluida/aula_concluida_widget.dart';
import '/componentes/componente_modulo_aulas/componente_modulo_aulas_widget.dart';
import '/componentes/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'aulas_widget.dart' show AulasWidget;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AulasModel extends FlutterFlowModel<AulasWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for topBar component.
  late TopBarModel topBarModel1;
  // Model for componenteModuloAulas component.
  late ComponenteModuloAulasModel componenteModuloAulasModel1;
  Completer<List<AulasConcluidasRow>>? requestCompleter;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<AulasRow>? aulaAnterior;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<AulasRow>? proximaAula;
  // Model for aulaConcluida component.
  late AulaConcluidaModel aulaConcluidaModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Model for topBar component.
  late TopBarModel topBarModel2;
  // Model for componenteModuloAulas component.
  late ComponenteModuloAulasModel componenteModuloAulasModel2;

  @override
  void initState(BuildContext context) {
    topBarModel1 = createModel(context, () => TopBarModel());
    componenteModuloAulasModel1 =
        createModel(context, () => ComponenteModuloAulasModel());
    aulaConcluidaModel = createModel(context, () => AulaConcluidaModel());
    topBarModel2 = createModel(context, () => TopBarModel());
    componenteModuloAulasModel2 =
        createModel(context, () => ComponenteModuloAulasModel());
  }

  @override
  void dispose() {
    topBarModel1.dispose();
    componenteModuloAulasModel1.dispose();
    aulaConcluidaModel.dispose();
    tabBarController?.dispose();
    topBarModel2.dispose();
    componenteModuloAulasModel2.dispose();
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
