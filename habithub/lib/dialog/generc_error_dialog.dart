import 'package:flutter/material.dart';

class GenercErrorDialog extends StatefulWidget {
  const GenercErrorDialog({super.key});

  @override
  State<GenercErrorDialog> createState() => _GenercErrorDialogState();
}

class _GenercErrorDialogState extends State<GenercErrorDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.55,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
      ),
    );
  }
}