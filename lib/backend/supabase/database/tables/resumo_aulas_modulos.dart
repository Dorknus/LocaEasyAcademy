import '../database.dart';

class ResumoAulasModulosTable extends SupabaseTable<ResumoAulasModulosRow> {
  @override
  String get tableName => 'resumo_aulas_modulos';

  @override
  ResumoAulasModulosRow createRow(Map<String, dynamic> data) =>
      ResumoAulasModulosRow(data);
}

class ResumoAulasModulosRow extends SupabaseDataRow {
  ResumoAulasModulosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ResumoAulasModulosTable();

  String? get nomeModulo => getField<String>('nome_modulo');
  set nomeModulo(String? value) => setField<String>('nome_modulo', value);

  int? get moduloIndice => getField<int>('modulo_indice');
  set moduloIndice(int? value) => setField<int>('modulo_indice', value);

  String? get titulo => getField<String>('titulo');
  set titulo(String? value) => setField<String>('titulo', value);

  int? get aulaIndice => getField<int>('aula_indice');
  set aulaIndice(int? value) => setField<int>('aula_indice', value);

  int? get totalComentariosAula => getField<int>('total_comentarios_aula');
  set totalComentariosAula(int? value) =>
      setField<int>('total_comentarios_aula', value);

  int? get totalConclusoesAula => getField<int>('total_conclusoes_aula');
  set totalConclusoesAula(int? value) =>
      setField<int>('total_conclusoes_aula', value);

  bool? get statusAula => getField<bool>('status_aula');
  set statusAula(bool? value) => setField<bool>('status_aula', value);

  int? get cursoId => getField<int>('curso_id');
  set cursoId(int? value) => setField<int>('curso_id', value);
}
