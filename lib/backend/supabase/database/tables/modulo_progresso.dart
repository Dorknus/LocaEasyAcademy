import '../database.dart';

class ModuloProgressoTable extends SupabaseTable<ModuloProgressoRow> {
  @override
  String get tableName => 'modulo_progresso';

  @override
  ModuloProgressoRow createRow(Map<String, dynamic> data) =>
      ModuloProgressoRow(data);
}

class ModuloProgressoRow extends SupabaseDataRow {
  ModuloProgressoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ModuloProgressoTable();

  String? get user => getField<String>('user');
  set user(String? value) => setField<String>('user', value);

  int? get modulo => getField<int>('modulo');
  set modulo(int? value) => setField<int>('modulo', value);

  double? get progressValue => getField<double>('progress_value');
  set progressValue(double? value) => setField<double>('progress_value', value);

  String? get progressText => getField<String>('progress_text');
  set progressText(String? value) => setField<String>('progress_text', value);

  bool? get moduloConcluido => getField<bool>('modulo_concluido');
  set moduloConcluido(bool? value) => setField<bool>('modulo_concluido', value);
}
