import '../database.dart';

class CursoDetalhadoTable extends SupabaseTable<CursoDetalhadoRow> {
  @override
  String get tableName => 'curso_detalhado';

  @override
  CursoDetalhadoRow createRow(Map<String, dynamic> data) =>
      CursoDetalhadoRow(data);
}

class CursoDetalhadoRow extends SupabaseDataRow {
  CursoDetalhadoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CursoDetalhadoTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  String? get curso => getField<String>('curso');
  set curso(String? value) => setField<String>('curso', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);

  String? get mentor => getField<String>('mentor');
  set mentor(String? value) => setField<String>('mentor', value);

  String? get duracaoFormatada => getField<String>('duracao_formatada');
  set duracaoFormatada(String? value) =>
      setField<String>('duracao_formatada', value);

  String? get imagemUrl => getField<String>('imagem_url');
  set imagemUrl(String? value) => setField<String>('imagem_url', value);
}
