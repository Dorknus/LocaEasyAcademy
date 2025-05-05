import '../database.dart';

class AlunosCursosTable extends SupabaseTable<AlunosCursosRow> {
  @override
  String get tableName => 'alunos_cursos';

  @override
  AlunosCursosRow createRow(Map<String, dynamic> data) => AlunosCursosRow(data);
}

class AlunosCursosRow extends SupabaseDataRow {
  AlunosCursosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AlunosCursosTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get alunoId => getField<String>('aluno_id');
  set alunoId(String? value) => setField<String>('aluno_id', value);

  int? get cursoId => getField<int>('curso_id');
  set cursoId(int? value) => setField<int>('curso_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get alunoNome => getField<String>('aluno_nome');
  set alunoNome(String? value) => setField<String>('aluno_nome', value);

  bool? get totalCursos => getField<bool>('total_cursos');
  set totalCursos(bool? value) => setField<bool>('total_cursos', value);
}
