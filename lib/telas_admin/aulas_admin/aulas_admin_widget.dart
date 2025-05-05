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
import 'dart:async';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'aulas_admin_model.dart';
export 'aulas_admin_model.dart';

class AulasAdminWidget extends StatefulWidget {
  const AulasAdminWidget({
    super.key,
    required this.cursoId,
    required this.cursoSelecionado,
  });

  final int? cursoId;
  final CursoRow? cursoSelecionado;

  static String routeName = 'aulasAdmin';
  static String routePath = '/aulasAdmin';

  @override
  State<AulasAdminWidget> createState() => _AulasAdminWidgetState();
}

class _AulasAdminWidgetState extends State<AulasAdminWidget> {
  late AulasAdminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AulasAdminModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<ModulosRow>>(
      future: (_model.requestCompleter3 ??= Completer<List<ModulosRow>>()
            ..complete(ModulosTable().queryRows(
              queryFn: (q) => q.eqOrNull(
                'curso_id',
                widget!.cursoId,
              ),
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<ModulosRow> aulasAdminModulosRowList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            drawer: Drawer(
              elevation: 16.0,
              child: WebViewAware(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: wrapWithModel(
                            model: _model.menuLateralAdminCelularModel,
                            updateCallback: () => safeSetState(() {}),
                            child: MenuLateralAdminCelularWidget(
                              iconDashboardCelular: Icon(
                                Icons.dashboard_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 26.0,
                              ),
                              iconAulasCelular: Icon(
                                Icons.play_circle,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 26.0,
                              ),
                              colorAulasCelular:
                                  FlutterFlowTheme.of(context).primary,
                              iconUsuarioCelular: Icon(
                                Icons.group_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 26.0,
                              ),
                              iconPlataformaCelular: Icon(
                                Icons.pie_chart_outline,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 26.0,
                              ),
                              visivelDashboardCelular: false,
                              visivelAulaCelular: true,
                              visivelUsuarioCelular: false,
                              visivelPlataformaCelular: false,
                              acao: () async {},
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: SafeArea(
              top: true,
              child: FutureBuilder<List<AulasRow>>(
                future:
                    (_model.requestCompleter2 ??= Completer<List<AulasRow>>()
                          ..complete(AulasTable().queryRows(
                            queryFn: (q) => q,
                          )))
                        .future,
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<AulasRow> contAulasAulasRowList = snapshot.data!;

                  return Container(
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        wrapWithModel(
                          model: _model.menuLateralAdminModel,
                          updateCallback: () => safeSetState(() {}),
                          child: MenuLateralAdminWidget(
                            iconDashboard: Icon(
                              Icons.dashboard_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            iconAulas: Icon(
                              Icons.play_circle,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                            colorAulas: FlutterFlowTheme.of(context).primary,
                            iconUsuario: Icon(
                              Icons.group_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            iconPlataforma: Icon(
                              Icons.pie_chart_outline,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            visivelDashboard: false,
                            visivelAula: true,
                            visivelUsuario: false,
                            visivelPlataforma: false,
                            acao: () async {
                              safeSetState(
                                  () => _model.requestCompleter2 = null);
                              await _model.waitForRequestCompleted2();
                            },
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FutureBuilder<List<CursoRow>>(
                                  future: (_model.requestCompleter1 ??=
                                          Completer<List<CursoRow>>()
                                            ..complete(
                                                CursoTable().querySingleRow(
                                              queryFn: (q) => q.eqOrNull(
                                                'id',
                                                widget!.cursoId,
                                              ),
                                            )))
                                      .future,
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<CursoRow> contCursoCursoRowList =
                                        snapshot.data!;

                                    final contCursoCursoRow =
                                        contCursoCursoRowList.isNotEmpty
                                            ? contCursoCursoRowList.first
                                            : null;

                                    return Container(
                                      width: double.infinity,
                                      height: 380.83,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (responsiveVisibility(
                                            context: context,
                                            desktop: false,
                                          ))
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 20.0, 0.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    scaffoldKey.currentState!
                                                        .openDrawer();
                                                  },
                                                  child: Icon(
                                                    Icons.menu,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.all(44.0),
                                              child: Wrap(
                                                spacing: 24.0,
                                                runSpacing: 44.0,
                                                alignment:
                                                    WrapAlignment.spaceBetween,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                direction: Axis.horizontal,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.none,
                                                children: [
                                                  FutureBuilder<
                                                      List<CursoDetalhadoRow>>(
                                                    future:
                                                        CursoDetalhadoTable()
                                                            .queryRows(
                                                      queryFn: (q) => q,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<CursoDetalhadoRow>
                                                          containerCursoDetalhadoRowList =
                                                          snapshot.data!;

                                                      return Container(
                                                        width: 700.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  contCursoCursoRow
                                                                      ?.curso,
                                                                  '-',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          28.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          24.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child: Wrap(
                                                                      spacing:
                                                                          24.0,
                                                                      runSpacing:
                                                                          16.0,
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          WrapCrossAlignment
                                                                              .start,
                                                                      direction:
                                                                          Axis.horizontal,
                                                                      runAlignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      verticalDirection:
                                                                          VerticalDirection
                                                                              .down,
                                                                      clipBehavior:
                                                                          Clip.none,
                                                                      children: [
                                                                        Text(
                                                                          'Mentor: ${contCursoCursoRow?.mentor}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.access_time_rounded,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              functions.totalDuracao(contAulasAulasRowList.map((e) => e.duracao?.time).withoutNulls.toList()),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.poppins(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        24.0)),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            30.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    contCursoCursoRow
                                                                        ?.descricao,
                                                                    '-',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .poppins(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                        lineHeight:
                                                                            1.4,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Builder(
                                                              builder:
                                                                  (context) =>
                                                                      Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            20.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              WebViewAware(
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: EditarCursoWidget(
                                                                                curso: contCursoCursoRow!,
                                                                                acao: () async {
                                                                                  safeSetState(() => _model.requestCompleter1 = null);
                                                                                  await _model.waitForRequestCompleted1();
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        300.0,
                                                                    height:
                                                                        50.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(8.0),
                                                                        bottomRight:
                                                                            Radius.circular(8.0),
                                                                        topLeft:
                                                                            Radius.circular(8.0),
                                                                        topRight:
                                                                            Radius.circular(8.0),
                                                                      ),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        'Editar',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.poppins(
                                                                                fontWeight: FontWeight.w900,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: Colors.white,
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w900,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.all(32.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Aulas',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Builder(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showDialog(
                                              barrierColor: Color(0x80000000),
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                  elevation: 0,
                                                  insetPadding: EdgeInsets.zero,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              1.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child: WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Container(
                                                        height: double.infinity,
                                                        child:
                                                            AdicionarModuloWidget(
                                                          cursoId:
                                                              widget!.cursoId!,
                                                          acao: () async {
                                                            safeSetState(() =>
                                                                _model.requestCompleter3 =
                                                                    null);
                                                            await _model
                                                                .waitForRequestCompleted3();
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Container(
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(8.0),
                                                bottomRight:
                                                    Radius.circular(8.0),
                                                topLeft: Radius.circular(8.0),
                                                topRight: Radius.circular(8.0),
                                              ),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                child: Text(
                                                  'Adicionar módulo',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.poppins(
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      32.0, 0.0, 32.0, 32.0),
                                  child: Builder(
                                    builder: (context) {
                                      final listaModulos =
                                          aulasAdminModulosRowList
                                              .map((e) => e)
                                              .toList()
                                              .sortedList(
                                                  keyOf: (e) => e.indice!,
                                                  desc: false)
                                              .toList();

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: listaModulos.length,
                                        itemBuilder:
                                            (context, listaModulosIndex) {
                                          final listaModulosItem =
                                              listaModulos[listaModulosIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 24.0, 0.0, 0.0),
                                            child: FutureBuilder<
                                                List<CursoDetalhadoRow>>(
                                              future: CursoDetalhadoTable()
                                                  .queryRows(
                                                queryFn: (q) => q.eqOrNull(
                                                  'id',
                                                  widget!.cursoId,
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<CursoDetalhadoRow>
                                                    containerCursoDetalhadoRowList =
                                                    snapshot.data!;

                                                return Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    color: Color(0x00000000),
                                                    child: ExpandableNotifier(
                                                      initialExpanded: false,
                                                      child: ExpandablePanel(
                                                        header: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        16.0,
                                                                        16.0,
                                                                        16.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            14.0,
                                                                            0.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            if (listaModulosIndex ==
                                                                                0) {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return WebViewAware(
                                                                                    child: AlertDialog(
                                                                                      title: Text('locaEasyAcademy'),
                                                                                      content: Text('Não há mais niveis para subir neste módulo'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            } else {
                                                                              _model.idModuloAnterior = valueOrDefault<int>(
                                                                                aulasAdminModulosRowList.where((e) => e.indice == ((listaModulosItem.indice!) - 1)).toList().firstOrNull?.idModulo,
                                                                                0,
                                                                              );
                                                                              _model.indiceAnterior = valueOrDefault<int>(
                                                                                aulasAdminModulosRowList.where((e) => e.indice == ((listaModulosItem.indice!) - 1)).toList().firstOrNull?.indice,
                                                                                0,
                                                                              );
                                                                              safeSetState(() {});
                                                                              await ModulosTable().update(
                                                                                data: {
                                                                                  'indice': (_model.indiceAnterior!) + 1,
                                                                                },
                                                                                matchingRows: (rows) => rows.eqOrNull(
                                                                                  'id_modulo',
                                                                                  _model.idModuloAnterior,
                                                                                ),
                                                                              );
                                                                              await ModulosTable().update(
                                                                                data: {
                                                                                  'indice': _model.indiceAnterior,
                                                                                },
                                                                                matchingRows: (rows) => rows.eqOrNull(
                                                                                  'id_modulo',
                                                                                  listaModulosItem.idModulo,
                                                                                ),
                                                                              );
                                                                              safeSetState(() => _model.requestCompleter3 = null);
                                                                              await _model.waitForRequestCompleted3();
                                                                              _model.idModuloAnterior = null;
                                                                              _model.indiceAnterior = null;
                                                                              safeSetState(() {});
                                                                            }
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.keyboard_arrow_up,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            13.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            listaModulosItem.indice?.toString(),
                                                                            '- ',
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            14.0,
                                                                            0.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            if (aulasAdminModulosRowList.length ==
                                                                                listaModulosItem.indice) {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return WebViewAware(
                                                                                    child: AlertDialog(
                                                                                      title: Text('locaEasyAcademy'),
                                                                                      content: Text('Não há mais niveis para descer neste módulo'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                          child: Text('Ok'),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              );
                                                                            } else {
                                                                              _model.idModuloPosterior = valueOrDefault<int>(
                                                                                aulasAdminModulosRowList.where((e) => e.indice == ((listaModulosItem.indice!) + 1)).toList().firstOrNull?.idModulo,
                                                                                0,
                                                                              );
                                                                              _model.indicePosterior = valueOrDefault<int>(
                                                                                aulasAdminModulosRowList.where((e) => e.indice == ((listaModulosItem.indice!) + 1)).toList().firstOrNull?.indice,
                                                                                0,
                                                                              );
                                                                              safeSetState(() {});
                                                                              await ModulosTable().update(
                                                                                data: {
                                                                                  'indice': (_model.indicePosterior!) - 1,
                                                                                },
                                                                                matchingRows: (rows) => rows.eqOrNull(
                                                                                  'id_modulo',
                                                                                  _model.idModuloPosterior,
                                                                                ),
                                                                              );
                                                                              await ModulosTable().update(
                                                                                data: {
                                                                                  'indice': _model.indicePosterior,
                                                                                },
                                                                                matchingRows: (rows) => rows.eqOrNull(
                                                                                  'id_modulo',
                                                                                  listaModulosItem.idModulo,
                                                                                ),
                                                                              );
                                                                              safeSetState(() => _model.requestCompleter3 = null);
                                                                              await _model.waitForRequestCompleted3();
                                                                              _model.idModuloPosterior = null;
                                                                              _model.indicePosterior = null;
                                                                              safeSetState(() {});
                                                                            }
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.keyboard_arrow_down,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Expanded(
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      listaModulosItem
                                                                          .nomeModulo,
                                                                      '- ',
                                                                    ),
                                                                    maxLines: 2,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.poppins(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              18.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Builder(
                                                                      builder:
                                                                          (context) =>
                                                                              InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await showDialog(
                                                                            barrierColor:
                                                                                Color(0x7F000000),
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (dialogContext) {
                                                                              return Dialog(
                                                                                elevation: 0,
                                                                                insetPadding: EdgeInsets.zero,
                                                                                backgroundColor: Colors.transparent,
                                                                                alignment: AlignmentDirectional(1.0, 0.0).resolve(Directionality.of(context)),
                                                                                child: WebViewAware(
                                                                                  child: GestureDetector(
                                                                                    onTap: () {
                                                                                      FocusScope.of(dialogContext).unfocus();
                                                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                                                    },
                                                                                    child: Container(
                                                                                      height: double.infinity,
                                                                                      child: AdicionarAulaWidget(
                                                                                        modulo: listaModulosItem.idModulo,
                                                                                        curso: widget!.cursoId!,
                                                                                        acao: () async {
                                                                                          safeSetState(() => _model.requestCompleter2 = null);
                                                                                          await _model.waitForRequestCompleted2();
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .add_circle,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              28.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Builder(
                                                                      builder:
                                                                          (context) =>
                                                                              InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await showDialog(
                                                                            barrierColor:
                                                                                Color(0x80000000),
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (dialogContext) {
                                                                              return Dialog(
                                                                                elevation: 0,
                                                                                insetPadding: EdgeInsets.zero,
                                                                                backgroundColor: Colors.transparent,
                                                                                alignment: AlignmentDirectional(1.0, 0.0).resolve(Directionality.of(context)),
                                                                                child: WebViewAware(
                                                                                  child: GestureDetector(
                                                                                    onTap: () {
                                                                                      FocusScope.of(dialogContext).unfocus();
                                                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                                                    },
                                                                                    child: Container(
                                                                                      height: double.infinity,
                                                                                      child: EditarModuloWidget(
                                                                                        modulo: listaModulosItem,
                                                                                        acao: () async {
                                                                                          safeSetState(() => _model.requestCompleter3 = null);
                                                                                          await _model.waitForRequestCompleted3();
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .edit,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              28.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return WebViewAware(
                                                                                  child: AlertDialog(
                                                                                    title: Text('LocaEasyAcademy'),
                                                                                    content: Text('Deseja realmente excluir este módulo?'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                        child: Text('Cancelar'),
                                                                                      ),
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                        child: Text('Confirmar'),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                        if (confirmDialogResponse) {
                                                                          FFAppState().atual =
                                                                              1;
                                                                          safeSetState(
                                                                              () {});
                                                                          _model.excluido =
                                                                              listaModulosItem.indice;
                                                                          safeSetState(
                                                                              () {});
                                                                          await ModulosTable()
                                                                              .delete(
                                                                            matchingRows: (rows) =>
                                                                                rows.eqOrNull(
                                                                              'id_modulo',
                                                                              listaModulosItem.idModulo,
                                                                            ),
                                                                          );
                                                                          safeSetState(() =>
                                                                              _model.requestCompleter3 = null);
                                                                          await _model
                                                                              .waitForRequestCompleted3();
                                                                          while (FFAppState().atual <=
                                                                              aulasAdminModulosRowList.length) {
                                                                            await ModulosTable().update(
                                                                              data: {
                                                                                'indice': FFAppState().atual,
                                                                              },
                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                'indice',
                                                                                FFAppState().atual >= _model.excluido! ? (FFAppState().atual + 1) : FFAppState().atual,
                                                                              ),
                                                                            );
                                                                            FFAppState().atual =
                                                                                FFAppState().atual + 1;
                                                                            safeSetState(() {});
                                                                            safeSetState(() =>
                                                                                _model.requestCompleter3 = null);
                                                                            await _model.waitForRequestCompleted3();
                                                                          }
                                                                        }
                                                                      },
                                                                      child:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .trash,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          14.0)),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        collapsed: Opacity(
                                                          opacity: 0.0,
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                          ),
                                                        ),
                                                        expanded: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final listAulas = contAulasAulasRowList
                                                                      .map(
                                                                          (e) =>
                                                                              e)
                                                                      .toList()
                                                                      .where((e) =>
                                                                          e.moduloId ==
                                                                          listaModulosItem
                                                                              .idModulo)
                                                                      .toList()
                                                                      .sortedList(
                                                                          keyOf: (e) => e
                                                                              .indice!,
                                                                          desc:
                                                                              false)
                                                                      .toList();

                                                                  return ListView
                                                                      .builder(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    primary:
                                                                        false,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        listAulas
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            listAulasIndex) {
                                                                      final listAulasItem =
                                                                          listAulas[
                                                                              listAulasIndex];
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            24.0,
                                                                            6.0,
                                                                            0.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            _model.alunos =
                                                                                await ParticipacaoAlunosTable().queryRows(
                                                                              queryFn: (q) => q,
                                                                            );

                                                                            context.pushNamed(
                                                                              AulasWidget.routeName,
                                                                              queryParameters: {
                                                                                'aula': serializeParam(
                                                                                  listAulasItem,
                                                                                  ParamType.SupabaseRow,
                                                                                ),
                                                                                'cursoId': serializeParam(
                                                                                  containerCursoDetalhadoRowList.firstOrNull?.id,
                                                                                  ParamType.int,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );

                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          if (listAulasIndex == 0) {
                                                                                            await showDialog(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return WebViewAware(
                                                                                                  child: AlertDialog(
                                                                                                    title: Text('locaEasyAcademy'),
                                                                                                    content: Text('Não há mais niveis para subir esta aula'),
                                                                                                    actions: [
                                                                                                      TextButton(
                                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                        child: Text('Ok'),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          } else {
                                                                                            _model.idAulaAnterior = contAulasAulasRowList.where((e) => (e.indice == ((listAulasItem.indice!) - 1)) && (e.moduloId == listaModulosItem.idModulo)).toList().firstOrNull?.idAula;
                                                                                            _model.indiceAulaAnterior = contAulasAulasRowList.where((e) => (e.indice == ((listAulasItem.indice!) - 1)) && (e.moduloId == listaModulosItem.idModulo)).toList().firstOrNull?.indice;
                                                                                            safeSetState(() {});
                                                                                            await AulasTable().update(
                                                                                              data: {
                                                                                                'indice': (_model.indiceAulaAnterior!) + 1,
                                                                                              },
                                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                                'id_aula',
                                                                                                _model.idAulaAnterior,
                                                                                              ),
                                                                                            );
                                                                                            await AulasTable().update(
                                                                                              data: {
                                                                                                'indice': _model.indiceAulaAnterior,
                                                                                              },
                                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                                'id_aula',
                                                                                                listAulasItem.idAula,
                                                                                              ),
                                                                                            );
                                                                                            safeSetState(() => _model.requestCompleter2 = null);
                                                                                            await _model.waitForRequestCompleted2();
                                                                                            _model.indiceAulaAnterior = null;
                                                                                            _model.idAulaAnterior = null;
                                                                                            safeSetState(() {});
                                                                                          }
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.keyboard_arrow_up,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                        child: Text(
                                                                                          valueOrDefault<String>(
                                                                                            listAulasItem.indice?.toString(),
                                                                                            '-',
                                                                                          ),
                                                                                          textAlign: TextAlign.center,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          if (contAulasAulasRowList.where((e) => e.moduloId == listaModulosItem.idModulo).toList().length == listAulasItem.indice) {
                                                                                            await showDialog(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return WebViewAware(
                                                                                                  child: AlertDialog(
                                                                                                    title: Text('locaEasyAcademy'),
                                                                                                    content: Text('Não há mais niveis para descer esta aula'),
                                                                                                    actions: [
                                                                                                      TextButton(
                                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                        child: Text('Ok'),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          } else {
                                                                                            _model.idAulaPosterior = contAulasAulasRowList.where((e) => (e.indice == ((listAulasItem.indice!) + 1)) && (e.moduloId == listaModulosItem.idModulo)).toList().firstOrNull?.idAula;
                                                                                            _model.indiceAulaPosterior = contAulasAulasRowList.where((e) => (e.indice == ((listAulasItem.indice!) + 1)) && (e.moduloId == listaModulosItem.idModulo)).toList().firstOrNull?.indice;
                                                                                            safeSetState(() {});
                                                                                            await AulasTable().update(
                                                                                              data: {
                                                                                                'indice': (_model.indiceAulaPosterior!) - 1,
                                                                                              },
                                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                                'id_aula',
                                                                                                _model.idAulaPosterior,
                                                                                              ),
                                                                                            );
                                                                                            await AulasTable().update(
                                                                                              data: {
                                                                                                'indice': _model.indiceAulaPosterior,
                                                                                              },
                                                                                              matchingRows: (rows) => rows.eqOrNull(
                                                                                                'id_aula',
                                                                                                listAulasItem.idAula,
                                                                                              ),
                                                                                            );
                                                                                            safeSetState(() => _model.requestCompleter2 = null);
                                                                                            await _model.waitForRequestCompleted2();
                                                                                            _model.idAulaPosterior = null;
                                                                                            _model.indiceAulaPosterior = null;
                                                                                            safeSetState(() {});
                                                                                          }
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.keyboard_arrow_down,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Icon(
                                                                                Icons.play_circle,
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 24.0,
                                                                              ),
                                                                              Expanded(
                                                                                child: Text(
                                                                                  valueOrDefault<String>(
                                                                                    listAulasItem.titulo,
                                                                                    '-',
                                                                                  ),
                                                                                  maxLines: 2,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.poppins(
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                children: [
                                                                                  if (responsiveVisibility(
                                                                                    context: context,
                                                                                    phone: false,
                                                                                    tablet: false,
                                                                                    tabletLandscape: false,
                                                                                  ))
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                      child: Icon(
                                                                                        Icons.access_time_rounded,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    ),
                                                                                  Text(
                                                                                    valueOrDefault<String>(
                                                                                      dateTimeFormat(
                                                                                        "Hms",
                                                                                        listAulasItem.duracao?.time,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      ),
                                                                                      '0',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.poppins(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                children: [
                                                                                  Builder(
                                                                                    builder: (context) => InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        await showDialog(
                                                                                          barrierColor: Color(0x81000000),
                                                                                          context: context,
                                                                                          builder: (dialogContext) {
                                                                                            return Dialog(
                                                                                              elevation: 0,
                                                                                              insetPadding: EdgeInsets.zero,
                                                                                              backgroundColor: Colors.transparent,
                                                                                              alignment: AlignmentDirectional(1.0, 0.0).resolve(Directionality.of(context)),
                                                                                              child: WebViewAware(
                                                                                                child: GestureDetector(
                                                                                                  onTap: () {
                                                                                                    FocusScope.of(dialogContext).unfocus();
                                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    height: double.infinity,
                                                                                                    child: EditarAulaWidget(
                                                                                                      aula: listAulasItem,
                                                                                                      acao: () async {},
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.edit,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: 28.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Builder(
                                                                                    builder: (context) => Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          await showDialog(
                                                                                            context: context,
                                                                                            builder: (dialogContext) {
                                                                                              return Dialog(
                                                                                                elevation: 0,
                                                                                                insetPadding: EdgeInsets.zero,
                                                                                                backgroundColor: Colors.transparent,
                                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                child: WebViewAware(
                                                                                                  child: GestureDetector(
                                                                                                    onTap: () {
                                                                                                      FocusScope.of(dialogContext).unfocus();
                                                                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                                                                    },
                                                                                                    child: MateriaisAulaWidget(
                                                                                                      aula: valueOrDefault<int>(
                                                                                                        listAulasItem.idAula,
                                                                                                        0,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                        child: FaIcon(
                                                                                          FontAwesomeIcons.book,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      var confirmDialogResponse = await showDialog<bool>(
                                                                                            context: context,
                                                                                            builder: (alertDialogContext) {
                                                                                              return WebViewAware(
                                                                                                child: AlertDialog(
                                                                                                  title: Text('LocaEasyAcademy'),
                                                                                                  content: Text('Deseja excluir esta aula?'),
                                                                                                  actions: [
                                                                                                    TextButton(
                                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                      child: Text('Cancelar'),
                                                                                                    ),
                                                                                                    TextButton(
                                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                      child: Text('Confirmar'),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ) ??
                                                                                          false;
                                                                                      if (confirmDialogResponse) {
                                                                                        await AulasTable().delete(
                                                                                          matchingRows: (rows) => rows.eqOrNull(
                                                                                            'id_aula',
                                                                                            listAulasItem.idAula,
                                                                                          ),
                                                                                        );
                                                                                        FFAppState().atual = 1;
                                                                                        safeSetState(() {});
                                                                                        _model.excluido = listAulasItem.indice;
                                                                                        safeSetState(() {});
                                                                                        if (listAulasItem.tipoVideo == 'Backend') {
                                                                                          await DeleteAulaCall.call(
                                                                                            token: currentJwtToken,
                                                                                            pasta: listAulasItem.moduloId?.toString(),
                                                                                            arquivo: functions.nomeArquivo(listAulasItem.videoUrl!),
                                                                                          );

                                                                                          safeSetState(() => _model.requestCompleter2 = null);
                                                                                          await _model.waitForRequestCompleted2();
                                                                                          await showDialog(
                                                                                            context: context,
                                                                                            builder: (alertDialogContext) {
                                                                                              return WebViewAware(
                                                                                                child: AlertDialog(
                                                                                                  title: Text('LocaEasyAcademy'),
                                                                                                  content: Text('Aula excluida com sucesso!'),
                                                                                                  actions: [
                                                                                                    TextButton(
                                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                      child: Text('Ok'),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        } else {
                                                                                          safeSetState(() => _model.requestCompleter2 = null);
                                                                                          await _model.waitForRequestCompleted2();
                                                                                        }

                                                                                        while (FFAppState().atual <= contAulasAulasRowList.where((e) => e.moduloId == listaModulosItem.idModulo).toList().length) {
                                                                                          await AulasTable().update(
                                                                                            data: {
                                                                                              'indice': FFAppState().atual,
                                                                                            },
                                                                                            matchingRows: (rows) => rows.eqOrNull(
                                                                                              'indice',
                                                                                              FFAppState().atual >= _model.excluido! ? (FFAppState().atual + 1) : FFAppState().atual,
                                                                                            ),
                                                                                          );
                                                                                          FFAppState().atual = FFAppState().atual + 1;
                                                                                          safeSetState(() {});
                                                                                        }
                                                                                        safeSetState(() => _model.requestCompleter2 = null);
                                                                                        await _model.waitForRequestCompleted2();
                                                                                      }
                                                                                    },
                                                                                    child: FaIcon(
                                                                                      FontAwesomeIcons.trash,
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 4.0)),
                                                                              ),
                                                                            ].divide(SizedBox(width: 8.0)),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        theme:
                                                            ExpandableThemeData(
                                                          tapHeaderToExpand:
                                                              true,
                                                          tapBodyToExpand:
                                                              false,
                                                          tapBodyToCollapse:
                                                              false,
                                                          headerAlignment:
                                                              ExpandablePanelHeaderAlignment
                                                                  .center,
                                                          hasIcon: false,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
