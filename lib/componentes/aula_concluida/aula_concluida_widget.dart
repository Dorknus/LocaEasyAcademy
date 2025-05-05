import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'aula_concluida_model.dart';
export 'aula_concluida_model.dart';

class AulaConcluidaWidget extends StatefulWidget {
  const AulaConcluidaWidget({
    super.key,
    bool? aulaConcluida,
    required this.concluir,
    required this.desconcluir,
  }) : this.aulaConcluida = aulaConcluida ?? false;

  final bool aulaConcluida;
  final Future Function()? concluir;
  final Future Function()? desconcluir;

  @override
  State<AulaConcluidaWidget> createState() => _AulaConcluidaWidgetState();
}

class _AulaConcluidaWidgetState extends State<AulaConcluidaWidget> {
  late AulaConcluidaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AulaConcluidaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (!widget!.aulaConcluida)
            FFButtonWidget(
              onPressed: () async {
                await AulasConcluidasTable().insert({
                  'user_id': currentUserUid,
                  'aula_id': FFAppState().aulaCorrente,
                });
                await widget.concluir?.call();
              },
              text: 'Concluir aula',
              icon: FaIcon(
                FontAwesomeIcons.solidCheckCircle,
                color: FlutterFlowTheme.of(context).secondary,
                size: 18.0,
              ),
              options: FFButtonOptions(
                height: 50.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconPadding:
                    EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                color: FlutterFlowTheme.of(context).secondaryBackground,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.poppins(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).secondary,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          if (widget!.aulaConcluida)
            FFButtonWidget(
              onPressed: () async {
                await AulasConcluidasTable().delete(
                  matchingRows: (rows) => rows
                      .eqOrNull(
                        'user_id',
                        currentUserUid,
                      )
                      .eqOrNull(
                        'aula_id',
                        FFAppState().aulaCorrente,
                      ),
                );
                await widget.desconcluir?.call();
              },
              text: 'Aula concluida',
              icon: Icon(
                Icons.close,
                color: FlutterFlowTheme.of(context).primary,
                size: 28.0,
              ),
              options: FFButtonOptions(
                height: 50.0,
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                iconAlignment: IconAlignment.start,
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                color: FlutterFlowTheme.of(context).alternate,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.poppins(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).primary,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
        ],
      ),
    );
  }
}
