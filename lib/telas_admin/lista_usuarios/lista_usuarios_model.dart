import '/backend/supabase/supabase.dart';
import '/componentes/inserir_aluno/inserir_aluno_widget.dart';
import '/componentes/menu_lateral_admin/menu_lateral_admin_widget.dart';
import '/componentes/menu_lateral_admin_celular/menu_lateral_admin_celular_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'dart:async';
import 'lista_usuarios_widget.dart' show ListaUsuariosWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ListaUsuariosModel extends FlutterFlowModel<ListaUsuariosWidget> {
  ///  Local state fields for this page.

  String? buscaNome;

  String? selecionaCargo;

  ///  State fields for stateful widgets in this page.

  // Model for menuLateralAdmin component.
  late MenuLateralAdminModel menuLateralAdminModel;
  Completer<List<UserDetalhesAulasSomenteRow>>? requestCompleter;
  // Stores action output result for [Backend Call - Query Rows] action in Text widget.
  List<ParticipacaoAlunosRow>? alunos;
  // Stores action output result for [Backend Call - Query Rows] action in Text widget.
  List<CursoRow>? cursos;
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
