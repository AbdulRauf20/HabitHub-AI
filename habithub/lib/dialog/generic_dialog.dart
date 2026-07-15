import 'package:flutter/material.dart';

class GenericDialog extends StatefulWidget {
  const GenericDialog({super.key});

  @override
  State<GenericDialog> createState() => _GenericDialogState();
}

class _GenericDialogState extends State<GenericDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white)));
  }
}