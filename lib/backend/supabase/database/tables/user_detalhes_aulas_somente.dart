import '../database.dart';

class UserDetalhesAulasSomenteTable
    extends SupabaseTable<UserDetalhesAulasSomenteRow> {
  @override
  String get tableName => 'user_detalhes_aulas_somente';

  @override
  UserDetalhesAulasSomenteRow createRow(Map<String, dynamic> data) =>
      UserDetalhesAulasSomenteRow(data);
}

class UserDetalhesAulasSomenteRow extends SupabaseDataRow {
  UserDetalhesAulasSomenteRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserDetalhesAulasSomenteTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  double? get progressValue => getField<double>('progress_value');
  set progressValue(double? value) => setField<double>('progress_value', value);

  bool? get status => getField<bool>('status');
  set status(bool? value) => setField<bool>('status', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get foto => getField<String>('foto');
  set foto(String? value) => setField<String>('foto', value);

  String? get cargo => getField<String>('cargo');
  set cargo(String? value) => setField<String>('cargo', value);

  bool? get admin => getField<bool>('admin');
  set admin(bool? value) => setField<bool>('admin', value);
}
