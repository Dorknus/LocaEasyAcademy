import '../database.dart';

class ResumoGeralTable extends SupabaseTable<ResumoGeralRow> {
  @override
  String get tableName => 'resumo_geral';

  @override
  ResumoGeralRow createRow(Map<String, dynamic> data) => ResumoGeralRow(data);
}

class ResumoGeralRow extends SupabaseDataRow {
  ResumoGeralRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ResumoGeralTable();

  int? get totalModulos => getField<int>('total_modulos');
  set totalModulos(int? value) => setField<int>('total_modulos', value);

  int? get totalAulas => getField<int>('total_aulas');
  set totalAulas(int? value) => setField<int>('total_aulas', value);

  int? get totalComentarios => getField<int>('total_comentarios');
  set totalComentarios(int? value) => setField<int>('total_comentarios', value);

  int? get totalConclusoes => getField<int>('total_conclusoes');
  set totalConclusoes(int? value) => setField<int>('total_conclusoes', value);

  int? get totalAlunos => getField<int>('total_alunos');
  set totalAlunos(int? value) => setField<int>('total_alunos', value);

  int? get totalCursos => getField<int>('total_cursos');
  set totalCursos(int? value) => setField<int>('total_cursos', value);
}
