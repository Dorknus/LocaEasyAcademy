import '../database.dart';

class CursoProgressoTable extends SupabaseTable<CursoProgressoRow> {
  @override
  String get tableName => 'curso_progresso';

  @override
  CursoProgressoRow createRow(Map<String, dynamic> data) =>
      CursoProgressoRow(data);
}

class CursoProgressoRow extends SupabaseDataRow {
  CursoProgressoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CursoProgressoTable();

  String? get user => getField<String>('user');
  set user(String? value) => setField<String>('user', value);

  double? get progressValue => getField<double>('progress_value');
  set progressValue(double? value) => setField<double>('progress_value', value);

  String? get progressText => getField<String>('progress_text');
  set progressText(String? value) => setField<String>('progress_text', value);
}
