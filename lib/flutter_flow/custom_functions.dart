import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String nomeArquivo(String texto) {
  // Pegue o texto após a última barra "/"
  int lastSlashIndex = texto.lastIndexOf('/');
  return texto.substring(lastSlashIndex + 1);
}

String? encode(String? fileName) {
  final bytes = utf8.encode(fileName!);
  final base64Str = base64.encode(bytes);
  return base64Str;
}

DateTime textToTime(String texto) {
  // converta o texto em HH:MM:SS
  List<String> parts = texto.split(':');
  int hours = int.parse(parts[0]);
  int minutes = int.parse(parts[1]);
  int seconds = int.parse(parts[2]);
  return DateTime(0, 1, 1, hours, minutes, seconds);
}

String totalDuracao(List<DateTime> duracao) {
  Duration total = Duration();
  for (DateTime d in duracao) {
    total += Duration(hours: d.hour, minutes: d.minute);
  }

  int totalHours = total.inHours;
  int totalMinutes = total.inMinutes % 60;

  String hourString = totalHours == 1 ? 'hora' : 'horas';
  String minuteString = totalMinutes == 1 ? 'minuto' : 'minutos';

  return '$totalHours $hourString e $totalMinutes $minuteString de curso';
}

List<String>? filtrarAlunosPorNome(
  dynamic lista,
  String? buscaNome,
) {
  if (lista == null || buscaNome == null || buscaNome.trim().isEmpty) {
    return lista;
  }

  final search = buscaNome.toLowerCase().trim();

  return lista.where((item) {
    final nomeCompleto = (item['nome'] ?? '').toString().trim().toLowerCase();
    final primeiroNome = nomeCompleto.split(' ').first;
    return primeiroNome.contains(search);
  }).toList();
}
