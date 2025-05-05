// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';

Future<String> criarUser(String email, String senha) async {
  try {
    // URL para criação do usuário no Supabase Auth
    final signupUrl =
        Uri.parse('https://kjdgoyqiherkqmoblbzw.supabase.co/auth/v1/signup');

    // Headers de autenticação para criação de usuário no Auth
    final headers = {
      'apikey':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtqZGdveXFpaGVya3Ftb2JsYnp3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzgyNDg5MDEsImV4cCI6MjA1MzgyNDkwMX0.HHdxukojOXdxba1oiMd5ySR1dRaVq4mLwb3fNMo5nlY', // Substitua pela chave de API correta
      'Content-Type': 'application/json',
    };

    // Corpo da requisição para criação do usuário
    final body = json.encode({
      'email': email,
      'password': senha,
    });

    // Realizar o POST para criar o usuário no Supabase Auth
    final signupResponse =
        await http.post(signupUrl, headers: headers, body: body);

    // Debug para status e resposta de criação de usuário
    print('Status da resposta signup: ${signupResponse.statusCode}');
    print('Corpo da resposta signup: ${signupResponse.body}');

    if (signupResponse.statusCode == 200) {
      final responseJson = json.decode(signupResponse.body);
      final userId = responseJson['user']['id']; // ID do usuário criado no Auth
      final userEmail =
          responseJson['user']['email']; // Email do usuário criado

      print('Usuário criado no Supabase Auth: $userId, Email: $userEmail');

      // Obter o access token automaticamente da sessão atual
      final session = Supabase.instance.client.auth.currentSession;
      final accessToken = session?.accessToken;

      // Debug para verificar o token
      if (accessToken != null) {
        print('Access Token Obtido: $accessToken');
      } else {
        print('Token de acesso não encontrado');
        return 'Erro: Token de acesso não encontrado';
      }

      if (accessToken == null) {
        return 'Erro: Não foi possível obter o token de acesso. Usuário não autenticado?';
      }

      // URL para inserir na tabela public.users
      final insertUrl =
          Uri.parse('https://kjdgoyqiherkqmoblbzw.supabase.co/rest/v1/users');

      // Headers para a inserção na tabela public.users
      final insertHeaders = {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtqZGdveXFpaGVya3Ftb2JsYnp3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzgyNDg5MDEsImV4cCI6MjA1MzgyNDkwMX0.HHdxukojOXdxba1oiMd5ySR1dRaVq4mLwb3fNMo5nlY', // Substitua pela chave de API correta
        'Authorization': 'Bearer $accessToken', // Usando o access token
        'Content-Type': 'application/json',
      };

      // Corpo da requisição para inserção na tabela public.users
      final insertBody = json.encode({
        'user_id': userId, // ID do usuário
        'email': userEmail, // Email do usuário
      });

      // Realizar a requisição POST para inserir o usuário na tabela public.users
      final insertResponse =
          await http.post(insertUrl, headers: insertHeaders, body: insertBody);

      // Debug para status e resposta de inserção
      print('Status da resposta insert: ${insertResponse.statusCode}');
      print('Corpo da resposta insert: ${insertResponse.body}');

      if (insertResponse.statusCode == 201) {
        print('Usuário inserido na tabela public.users');
        return 'Usuário criado no Auth e inserido com sucesso na tabela public.users';
      } else {
        final errorMsg = json.decode(insertResponse.body);
        print(
            'Erro ao inserir usuário na tabela public.users: ${errorMsg['message']}');
        return 'Erro ao inserir usuário na tabela public.users: ${errorMsg['message']}';
      }
    } else {
      final errorMsg = json.decode(signupResponse.body);
      print('Erro ao criar usuário no Supabase Auth: ${errorMsg['message']}');
      return 'Erro ao criar usuário no Supabase Auth: ${errorMsg['message']}';
    }
  } catch (e) {
    print('Erro desconhecido: $e');
    return 'Erro desconhecido: $e';
  }
}
