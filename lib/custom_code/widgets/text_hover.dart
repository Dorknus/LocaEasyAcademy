// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class TextHover extends StatefulWidget {
  const TextHover({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<TextHover> createState() => _TextHoverState();
}

class _TextHoverState extends State<TextHover> {
  bool isHovered = false; // Variável para controle do hover

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true; // Quando o mouse entra, ativamos o hover
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false; // Quando o mouse sai, desativamos o hover
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: widget.width ?? 100, // Tamanho padrão ou o fornecido
        height: widget.height ?? 50, // Tamanho padrão ou o fornecido
        decoration: BoxDecoration(
          color: isHovered
              ? Colors.orangeAccent
              : Colors.transparent, // Cor alterada no hover
        ),
        child: Center(
          child: Text(
            'Aesthetic',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isHovered
                  ? Colors.white
                  : Colors.black, // Cor do texto alterada no hover
            ),
          ),
        ),
      ),
    );
  }
}
