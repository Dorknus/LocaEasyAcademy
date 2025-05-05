import '../database.dart';

class DuracaoTotalPorCursoTable extends SupabaseTable<DuracaoTotalPorCursoRow> {
  @override
  String get tableName => 'duracao_total_por_curso';

  @override
  DuracaoTotalPorCursoRow createRow(Map<String, dynamic> data) =>
      DuracaoTotalPorCursoRow(data);
}

class DuracaoTotalPorCursoRow extends SupabaseDataRow {
  DuracaoTotalPorCursoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DuracaoTotalPorCursoTable();

  int? get cursoId => getField<int>('curso_id');
  set cursoId(int? value) => setField<int>('curso_id', value);

  int? get duracaoTotal => getField<int>('duracao_total');
  set duracaoTotal(int? value) => setField<int>('duracao_total', value);

  int? get horas => getField<int>('horas');
  set horas(int? value) => setField<int>('horas', value);

  int? get minutos => getField<int>('minutos');
  set minutos(int? value) => setField<int>('minutos', value);

  String? get duracaoFormatada => getField<String>('duracao_formatada');
  set duracaoFormatada(String? value) =>
      setField<String>('duracao_formatada', value);
}
