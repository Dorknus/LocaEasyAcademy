import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Importando dotenv
import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class UploadFotoCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? foto,
    String? token = '',
    String? pasta = '',
    String? arquivo = '',
  }) async {
    final baseUrl = dotenv.env['BASE_URL'] ?? 'https://kjdgoyqiherkqmoblbzw.supabase.co/storage/v1/object/';
    
    return ApiManager.instance.makeApiCall(
      callName: 'uploadFoto',
      apiUrl: '$baseUrl/alunos/${pasta}/${arquivo}',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'foto': foto,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteFotoCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? pasta = '',
    String? arquivo = '',
  }) async {
    final baseUrl = dotenv.env['BASE_URL'] ?? 'https://kjdgoyqiherkqmoblbzw.supabase.co/storage/v1/object/';
    
    return ApiManager.instance.makeApiCall(
      callName: 'deleteFoto',
      apiUrl: '$baseUrl/alunos/${pasta}/${arquivo}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadAulaCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? aula,
    String? token = '',
    String? pasta = '',
    String? arquivo = '',
  }) async {
    final baseUrl = dotenv.env['BASE_URL'] ?? 'https://kjdgoyqiherkqmoblbzw.supabase.co/storage/v1/object/';
    
    return ApiManager.instance.makeApiCall(
      callName: 'uploadAula',
      apiUrl: '$baseUrl/aulas/${pasta}/${arquivo}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'aula': aula,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteAulaCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? pasta = '',
    String? arquivo = '',
  }) async {
    final baseUrl = dotenv.env['BASE_URL'] ?? 'https://kjdgoyqiherkqmoblbzw.supabase.co/storage/v1/object/';
    
    return ApiManager.instance.makeApiCall(
      callName: 'deleteAula',
      apiUrl: '$baseUrl/aulas/${pasta}/${arquivo}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RenomearArquivoCall {
  static Future<ApiCallResponse> call({
    String? bucketId = '',
    String? sourceKey = '',
    String? destinationKey = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "bucketId": "${escapeStringForJson(bucketId)}",
  "sourceKey": "${escapeStringForJson(sourceKey)}",
  "destinationKey": "${escapeStringForJson(destinationKey)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'renomearArquivo',
      apiUrl: 'https://kjdgoyqiherkqmoblbzw.supabase.co/storage/v1/object/move',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CriarUserCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? senha = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "password": "${escapeStringForJson(senha)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'criarUser',
      apiUrl: 'https://kjdgoyqiherkqmoblbzw.supabase.co/auth/v1/signup',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            dotenv.env['SUPABASE_API_KEY'] ?? 'default_api_key', // Usando variáveis de ambiente
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? userid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.id''',
      ));
  static String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.email''',
      ));
}

class EnvioEmailCall {
  static Future<ApiCallResponse> call({
    String? userEmail = '',
    String? userNome = '',
    String? userTelefone = '',
  }) async {
    final ffApiRequestBody = '''
{
  "sender": {
    "email": "locaeasyacademysuporte@gmail.com"
  },
  "to": [
    {
      "email": "locaeasyacademysuporte@gmail.com"
    }
  ],
  "subject": "Formulário enviado",
  "htmlContent": "<h1 style='color: #233DFF;'>Criação de novo usuário!</h1><h3 style='color: #333333;'>Foi solicitado a criação de um novo usuário, segue os dados abaixo:</h3><p style='color: #333333;'><strong>Email:</strong> ${escapeStringForJson(userEmail)}</p><p style='color: #333333;'><strong>Nome:</strong> ${escapeStringForJson(userNome)}</p><p style='color: #333333;'><strong>Telefone:</strong> ${escapeStringForJson(userTelefone)}</p>"
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'envioEmail',
      apiUrl: 'https://api.brevo.com/v3/smtp/email',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'api-key': dotenv.env['BREVO_API_KEY'] ?? 'default_brevo_api_key', // Usando variável de ambiente
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AlteracaoEmailCall {
  static Future<ApiCallResponse> call({
    String? userEmail = '',
    String? userNome = '',
    String? userTelefone = '',
  }) async {
    final ffApiRequestBody = '''
{
  "sender": {
    "email": "locaeasyacademysuporte@gmail.com"
  },
  "to": [
    {
      "email": "locaeasyacademysuporte@gmail.com"
    }
  ],
  "subject": "Formulário enviado",
  "htmlContent": "<h1 style='color: #233DFF;'>Alteração de usuário!</h1><h3 style='color: #333333;'>Foi solicitado a alteração de usuário, segue os dados abaixo:</h3><p style='color: #333333;'><strong>Email:</strong> ${escapeStringForJson(userEmail)}</p><p style='color: #333333;'><strong>Nome:</strong> ${escapeStringForJson(userNome)}</p><p style='color: #333333;'><strong>Telefone:</strong> ${escapeStringForJson(userTelefone)}</p>"
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'alteracaoEmail',
      apiUrl: 'https://api.brevo.com/v3/smtp/email',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'api-key': dotenv.env['BREVO_API_KEY'] ?? 'default_brevo_api_key', // Usando variável de ambiente
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RemoverEmailCall {
  static Future<ApiCallResponse> call({
    String? userEmail = '',
    String? userNome = '',
    String? userTelefone = '',
  }) async {
    final ffApiRequestBody = '''
{
  "sender": {
    "email": "locaeasyacademysuporte@gmail.com"
  },
  "to": [
    {
      "email": "locaeasyacademysuporte@gmail.com"
    }
  ],
  "subject": "Formulário enviado",
  "htmlContent": "<h1 style='color: #233DFF;'>Remoção de usuário!</h1><h3 style='color: #333333;'>Foi solicitado a remoção de usuário, segue os dados abaixo:</h3><p style='color: #333333;'><strong>Email:</strong> ${escapeStringForJson(userEmail)}</p><p style='color: #333333;'><strong>Nome:</strong> ${escapeStringForJson(userNome)}</p>"
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'removerEmail',
      apiUrl: 'https://api.brevo.com/v3/smtp/email',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/json',
        'api-key': dotenv.env['BREVO_API_KEY'] ?? 'default_brevo_api_key', // Usando variável de ambiente
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteUserCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteUser',
      apiUrl: 'https://academy-production-a609.up.railway.app/delete-user',
      callType: ApiCallType.DELETE,
      headers: {
        'apikey': dotenv.env['DELETE_USER_API_KEY'] ?? 'default_api_key', // Usando variável de ambiente
        'Content-type': 'application/json',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse
