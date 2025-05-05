import '../database.dart';

class AulasMateriaisTable extends SupabaseTable<AulasMateriaisRow> {
  @override
  String get tableName => 'aulas_materiais';

  @override
  AulasMateriaisRow createRow(Map<String, dynamic> data) =>
      AulasMateriaisRow(data);
}

class AulasMateriaisRow extends SupabaseDataRow {
  AulasMateriaisRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AulasMateriaisTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomeMaterial => getField<String>('nome_material');
  set nomeMaterial(String? value) => setField<String>('nome_material', value);

  String? get link => getField<String>('link');
  set link(String? value) => setField<String>('link', value);

  int? get aulaId => getField<int>('aula_id');
  set aulaId(int? value) => setField<int>('aula_id', value);
}
