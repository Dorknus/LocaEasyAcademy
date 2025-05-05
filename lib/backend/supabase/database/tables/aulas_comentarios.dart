import '../database.dart';

class AulasComentariosTable extends SupabaseTable<AulasComentariosRow> {
  @override
  String get tableName => 'aulas_comentarios';

  @override
  AulasComentariosRow createRow(Map<String, dynamic> data) =>
      AulasComentariosRow(data);
}

class AulasComentariosRow extends SupabaseDataRow {
  AulasComentariosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AulasComentariosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get aulaId => getField<int>('aula_id');
  set aulaId(int? value) => setField<int>('aula_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get comentario => getField<String>('comentario');
  set comentario(String? value) => setField<String>('comentario', value);

  String? get tipoComentario => getField<String>('tipo_comentario');
  set tipoComentario(String? value) =>
      setField<String>('tipo_comentario', value);

  int? get comentarioId => getField<int>('comentario_id');
  set comentarioId(int? value) => setField<int>('comentario_id', value);

  int? get curtidas => getField<int>('curtidas');
  set curtidas(int? value) => setField<int>('curtidas', value);
}
