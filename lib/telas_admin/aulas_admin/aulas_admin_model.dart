import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/componentes/adicionar_aula/adicionar_aula_widget.dart';
import '/componentes/adicionar_modulo/adicionar_modulo_widget.dart';
import '/componentes/editar_aula/editar_aula_widget.dart';
import '/componentes/editar_curso/editar_curso_widget.dart';
import '/componentes/editar_modulo/editar_modulo_widget.dart';
import '/componentes/materiais_aula/materiais_aula_widget.dart';
import '/componentes/menu_lateral_admin/menu_lateral_admin_widget.dart';
import '/componentes/menu_lateral_admin_celular/menu_lateral_admin_celular_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'aulas_admin_widget.dart' show AulasAdminWidget;
import 'dart:async';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AulasAdminModel extends FlutterFlowModel<AulasAdminWidget> {
  ///  Local state fields for this page.

  int? idModuloAnterior;

  int? indiceAnterior;

  int? idModuloPosterior;

  int? indicePosterior;

  int? excluido;

  int? idAulaAnterior;

  int? indiceAulaAnterior;

  int? idAulaPosterior;

  int? indiceAulaPosterior;

  ///  State fields for stateful widgets in this page.

  // Model for menuLateralAdmin component.
  late MenuLateralAdminModel menuLateralAdminModel;
  Completer<List<AulasRow>>? requestCompleter2;
  Completer<List<CursoRow>>? requestCompleter1;
  Completer<List<ModulosRow>>? requestCompleter3;
  // Stores action output result for [Backend Call - Query Rows] action in Row widget.
  List<ParticipacaoAlunosRow>? alunos;
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
  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter3?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
