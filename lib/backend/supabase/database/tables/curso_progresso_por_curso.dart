import '../database.dart';

class CursoProgressoPorCursoTable
    extends SupabaseTable<CursoProgressoPorCursoRow> {
  @override
  String get tableName => 'curso_progresso_por_curso';

  @override
  CursoProgressoPorCursoRow createRow(Map<String, dynamic> data) =>
      CursoProgressoPorCursoRow(data);
}

class CursoProgressoPorCursoRow extends SupabaseDataRow {
  CursoProgressoPorCursoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CursoProgressoPorCursoTable();

  String? get user => getField<String>('user');
  set user(String? value) => setField<String>('user', value);

  int? get cursoId => getField<int>('curso_id');
  set cursoId(int? value) => setField<int>('curso_id', value);

  double? get progressValue => getField<double>('progress_value');
  set progressValue(double? value) => setField<double>('progress_value', value);

  String? get progressText => getField<String>('progress_text');
  set progressText(String? value) => setField<String>('progress_text', value);
}
