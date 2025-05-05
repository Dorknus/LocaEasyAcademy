import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'comentario_curtida_model.dart';
export 'comentario_curtida_model.dart';

class ComentarioCurtidaWidget extends StatefulWidget {
  const ComentarioCurtidaWidget({
    super.key,
    required this.acao,
    required this.comentario,
  });

  final Future Function()? acao;
  final AulasComentariosViewRow? comentario;

  @override
  State<ComentarioCurtidaWidget> createState() =>
      _ComentarioCurtidaWidgetState();
}

class _ComentarioCurtidaWidgetState extends State<ComentarioCurtidaWidget> {
  late ComentarioCurtidaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComentarioCurtidaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
