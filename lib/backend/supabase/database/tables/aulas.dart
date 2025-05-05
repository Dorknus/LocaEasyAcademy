import '../database.dart';

class AulasTable extends SupabaseTable<AulasRow> {
  @override
  String get tableName => 'aulas';

  @override
  AulasRow createRow(Map<String, dynamic> data) => AulasRow(data);
}

class AulasRow extends SupabaseDataRow {
  AulasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AulasTable();

  int get idAula => getField<int>('id_aula')!;
  set idAula(int value) => setField<int>('id_aula', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get titulo => getField<String>('titulo')!;
  set titulo(String value) => setField<String>('titulo', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  int? get moduloId => getField<int>('modulo_id');
  set moduloId(int? value) => setField<int>('modulo_id', value);

  int? get indice => getField<int>('indice');
  set indice(int? value) => setField<int>('indice', value);

  String? get videoUrl => getField<String>('video_url');
  set videoUrl(String? value) => setField<String>('video_url', value);

  String? get tipoVideo => getField<String>('tipo_video');
  set tipoVideo(String? value) => setField<String>('tipo_video', value);

  String? get criadoPor => getField<String>('criado_por');
  set criadoPor(String? value) => setField<String>('criado_por', value);

  PostgresTime? get duracao => getField<PostgresTime>('duracao');
  set duracao(PostgresTime? value) => setField<PostgresTime>('duracao', value);

  int? get cursoId => getField<int>('curso_id');
  set cursoId(int? value) => setField<int>('curso_id', value);
}
