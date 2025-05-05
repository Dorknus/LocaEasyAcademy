import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_dataUserAluno')) {
        try {
          final serializedData = prefs.getString('ff_dataUserAluno') ?? '{}';
          _dataUserAluno =
              DataUserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _customActionResult =
          prefs.getString('ff_customActionResult') ?? _customActionResult;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_dataUserMentor')) {
        try {
          final serializedData = prefs.getString('ff_dataUserMentor') ?? '{}';
          _dataUserMentor =
              DataUserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _atual = 0;
  int get atual => _atual;
  set atual(int value) {
    _atual = value;
  }

  int _aulaCorrente = 0;
  int get aulaCorrente => _aulaCorrente;
  set aulaCorrente(int value) {
    _aulaCorrente = value;
  }

  int _qtdAulasModulo = 0;
  int get qtdAulasModulo => _qtdAulasModulo;
  set qtdAulasModulo(int value) {
    _qtdAulasModulo = value;
  }

  DataUserStruct _dataUserAluno =
      DataUserStruct.fromSerializableMap(jsonDecode('{\"cargo\":\"\"}'));
  DataUserStruct get dataUserAluno => _dataUserAluno;
  set dataUserAluno(DataUserStruct value) {
    _dataUserAluno = value;
    prefs.setString('ff_dataUserAluno', value.serialize());
  }

  void updateDataUserAlunoStruct(Function(DataUserStruct) updateFn) {
    updateFn(_dataUserAluno);
    prefs.setString('ff_dataUserAluno', _dataUserAluno.serialize());
  }

  String _customActionResult = '';
  String get customActionResult => _customActionResult;
  set customActionResult(String value) {
    _customActionResult = value;
    prefs.setString('ff_customActionResult', value);
  }

  String _servicoSelecionado = 'null';
  String get servicoSelecionado => _servicoSelecionado;
  set servicoSelecionado(String value) {
    _servicoSelecionado = value;
  }

  bool _formularioCriar = false;
  bool get formularioCriar => _formularioCriar;
  set formularioCriar(bool value) {
    _formularioCriar = value;
  }

  bool _respostaClicada = false;
  bool get respostaClicada => _respostaClicada;
  set respostaClicada(bool value) {
    _respostaClicada = value;
  }

  String _cargoSelecionado = '';
  String get cargoSelecionado => _cargoSelecionado;
  set cargoSelecionado(String value) {
    _cargoSelecionado = value;
  }

  bool _painelVisivel = false;
  bool get painelVisivel => _painelVisivel;
  set painelVisivel(bool value) {
    _painelVisivel = value;
  }

  DataUserStruct _dataUserMentor = DataUserStruct.fromSerializableMap(
      jsonDecode('{\"admin\":\"true\",\"cargo\":\"\"}'));
  DataUserStruct get dataUserMentor => _dataUserMentor;
  set dataUserMentor(DataUserStruct value) {
    _dataUserMentor = value;
    prefs.setString('ff_dataUserMentor', value.serialize());
  }

  void updateDataUserMentorStruct(Function(DataUserStruct) updateFn) {
    updateFn(_dataUserMentor);
    prefs.setString('ff_dataUserMentor', _dataUserMentor.serialize());
  }

  bool _cargoSetado = false;
  bool get cargoSetado => _cargoSetado;
  set cargoSetado(bool value) {
    _cargoSetado = value;
  }

  bool _aulaConcluida = false;
  bool get aulaConcluida => _aulaConcluida;
  set aulaConcluida(bool value) {
    _aulaConcluida = value;
  }

  bool _formularioRemover = false;
  bool get formularioRemover => _formularioRemover;
  set formularioRemover(bool value) {
    _formularioRemover = value;
  }

  bool _formularioAlterar = false;
  bool get formularioAlterar => _formularioAlterar;
  set formularioAlterar(bool value) {
    _formularioAlterar = value;
  }

  bool _aprendizSim = false;
  bool get aprendizSim => _aprendizSim;
  set aprendizSim(bool value) {
    _aprendizSim = value;
  }

  String _cursoSelecionadoNome = '';
  String get cursoSelecionadoNome => _cursoSelecionadoNome;
  set cursoSelecionadoNome(String value) {
    _cursoSelecionadoNome = value;
  }

  int _cursoSelecionado = 0;
  int get cursoSelecionado => _cursoSelecionado;
  set cursoSelecionado(int value) {
    _cursoSelecionado = value;
  }

  String _paginaAtual = '';
  String get paginaAtual => _paginaAtual;
  set paginaAtual(String value) {
    _paginaAtual = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
