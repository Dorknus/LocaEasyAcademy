import '../database.dart';

class ParticipacaoAlunosTable extends SupabaseTable<ParticipacaoAlunosRow> {
  @override
  String get tableName => 'participacao_alunos';

  @override
  ParticipacaoAlunosRow createRow(Map<String, dynamic> data) =>
      ParticipacaoAlunosRow(data);
}

class ParticipacaoAlunosRow extends SupabaseDataRow {
  ParticipacaoAlunosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ParticipacaoAlunosTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get foto => getField<String>('foto');
  set foto(String? value) => setField<String>('foto', value);

  String? get telefone => getField<String>('telefone');
  set telefone(String? value) => setField<String>('telefone', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  bool? get admin => getField<bool>('admin');
  set admin(bool? value) => setField<bool>('admin', value);

  String? get bio => getField<String>('bio');
  set bio(String? value) => setField<String>('bio', value);

  bool? get status => getField<bool>('status');
  set status(bool? value) => setField<bool>('status', value);

  int? get idAula => getField<int>('id_aula');
  set idAula(int? value) => setField<int>('id_aula', value);

  String? get aulaTitulo => getField<String>('aula_titulo');
  set aulaTitulo(String? value) => setField<String>('aula_titulo', value);

  int? get idModulo => getField<int>('id_modulo');
  set idModulo(int? value) => setField<int>('id_modulo', value);

  String? get nomeModulo => getField<String>('nome_modulo');
  set nomeModulo(String? value) => setField<String>('nome_modulo', value);

  double? get porcentagemConclusaoModulo =>
      getField<double>('porcentagem_conclusao_modulo');
  set porcentagemConclusaoModulo(double? value) =>
      setField<double>('porcentagem_conclusao_modulo', value);

  String? get concluiuAula => getField<String>('concluiu_aula');
  set concluiuAula(String? value) => setField<String>('concluiu_aula', value);

  String? get cargo => getField<String>('cargo');
  set cargo(String? value) => setField<String>('cargo', value);

  int? get cursoId => getField<int>('curso_id');
  set cursoId(int? value) => setField<int>('curso_id', value);

  String? get nomeCurso => getField<String>('nome_curso');
  set nomeCurso(String? value) => setField<String>('nome_curso', value);
}
