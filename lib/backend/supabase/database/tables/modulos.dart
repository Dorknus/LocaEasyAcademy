import '../database.dart';

class ModulosTable extends SupabaseTable<ModulosRow> {
  @override
  String get tableName => 'modulos';

  @override
  ModulosRow createRow(Map<String, dynamic> data) => ModulosRow(data);
}

class ModulosRow extends SupabaseDataRow {
  ModulosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ModulosTable();

  int get idModulo => getField<int>('id_modulo')!;
  set idModulo(int value) => setField<int>('id_modulo', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomeModulo => getField<String>('nome_modulo');
  set nomeModulo(String? value) => setField<String>('nome_modulo', value);

  String? get criadoPor => getField<String>('criado_por');
  set criadoPor(String? value) => setField<String>('criado_por', value);

  bool? get ativo => getField<bool>('ativo');
  set ativo(bool? value) => setField<bool>('ativo', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  int? get indice => getField<int>('indice');
  set indice(int? value) => setField<int>('indice', value);

  int? get cursoId => getField<int>('curso_id');
  set cursoId(int? value) => setField<int>('curso_id', value);
}
