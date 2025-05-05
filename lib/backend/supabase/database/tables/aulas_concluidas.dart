import '../database.dart';

class AulasConcluidasTable extends SupabaseTable<AulasConcluidasRow> {
  @override
  String get tableName => 'aulas_concluidas';

  @override
  AulasConcluidasRow createRow(Map<String, dynamic> data) =>
      AulasConcluidasRow(data);
}

class AulasConcluidasRow extends SupabaseDataRow {
  AulasConcluidasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AulasConcluidasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get aulaId => getField<int>('aula_id');
  set aulaId(int? value) => setField<int>('aula_id', value);
}
