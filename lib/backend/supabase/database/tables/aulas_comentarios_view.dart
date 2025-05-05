import '../database.dart';

class AulasComentariosViewTable extends SupabaseTable<AulasComentariosViewRow> {
  @override
  String get tableName => 'aulas_comentarios_view';

  @override
  AulasComentariosViewRow createRow(Map<String, dynamic> data) =>
      AulasComentariosViewRow(data);
}

class AulasComentariosViewRow extends SupabaseDataRow {
  AulasComentariosViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AulasComentariosViewTable();

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get foto => getField<String>('foto');
  set foto(String? value) => setField<String>('foto', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get aulaId => getField<int>('aula_id');
  set aulaId(int? value) => setField<int>('aula_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get tipoComentario => getField<String>('tipo_comentario');
  set tipoComentario(String? value) =>
      setField<String>('tipo_comentario', value);

  String? get comentario => getField<String>('comentario');
  set comentario(String? value) => setField<String>('comentario', value);

  int? get comentarioId => getField<int>('comentario_id');
  set comentarioId(int? value) => setField<int>('comentario_id', value);

  int? get curtidas => getField<int>('curtidas');
  set curtidas(int? value) => setField<int>('curtidas', value);

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);
}
