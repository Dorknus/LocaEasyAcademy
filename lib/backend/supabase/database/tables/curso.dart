import '../database.dart';

class CursoTable extends SupabaseTable<CursoRow> {
  @override
  String get tableName => 'curso';

  @override
  CursoRow createRow(Map<String, dynamic> data) => CursoRow(data);
}

class CursoRow extends SupabaseDataRow {
  CursoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CursoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get curso => getField<String>('curso');
  set curso(String? value) => setField<String>('curso', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  String? get mentor => getField<String>('mentor');
  set mentor(String? value) => setField<String>('mentor', value);

  String? get imagemUrl => getField<String>('imagem_url');
  set imagemUrl(String? value) => setField<String>('imagem_url', value);
}
