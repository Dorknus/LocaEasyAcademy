// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DataUserStruct extends BaseStruct {
  DataUserStruct({
    String? nome,
    String? foto,
    bool? admin,
    String? bio,
    String? cargo,
  })  : _nome = nome,
        _foto = foto,
        _admin = admin,
        _bio = bio,
        _cargo = cargo;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  set foto(String? val) => _foto = val;

  bool hasFoto() => _foto != null;

  // "admin" field.
  bool? _admin;
  bool get admin => _admin ?? false;
  set admin(bool? val) => _admin = val;

  bool hasAdmin() => _admin != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  set bio(String? val) => _bio = val;

  bool hasBio() => _bio != null;

  // "cargo" field.
  String? _cargo;
  String get cargo => _cargo ?? '';
  set cargo(String? val) => _cargo = val;

  bool hasCargo() => _cargo != null;

  static DataUserStruct fromMap(Map<String, dynamic> data) => DataUserStruct(
        nome: data['nome'] as String?,
        foto: data['foto'] as String?,
        admin: data['admin'] as bool?,
        bio: data['bio'] as String?,
        cargo: data['cargo'] as String?,
      );

  static DataUserStruct? maybeFromMap(dynamic data) =>
      data is Map ? DataUserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'nome': _nome,
        'foto': _foto,
        'admin': _admin,
        'bio': _bio,
        'cargo': _cargo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'foto': serializeParam(
          _foto,
          ParamType.String,
        ),
        'admin': serializeParam(
          _admin,
          ParamType.bool,
        ),
        'bio': serializeParam(
          _bio,
          ParamType.String,
        ),
        'cargo': serializeParam(
          _cargo,
          ParamType.String,
        ),
      }.withoutNulls;

  static DataUserStruct fromSerializableMap(Map<String, dynamic> data) =>
      DataUserStruct(
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        foto: deserializeParam(
          data['foto'],
          ParamType.String,
          false,
        ),
        admin: deserializeParam(
          data['admin'],
          ParamType.bool,
          false,
        ),
        bio: deserializeParam(
          data['bio'],
          ParamType.String,
          false,
        ),
        cargo: deserializeParam(
          data['cargo'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DataUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DataUserStruct &&
        nome == other.nome &&
        foto == other.foto &&
        admin == other.admin &&
        bio == other.bio &&
        cargo == other.cargo;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([nome, foto, admin, bio, cargo]);
}

DataUserStruct createDataUserStruct({
  String? nome,
  String? foto,
  bool? admin,
  String? bio,
  String? cargo,
}) =>
    DataUserStruct(
      nome: nome,
      foto: foto,
      admin: admin,
      bio: bio,
      cargo: cargo,
    );
