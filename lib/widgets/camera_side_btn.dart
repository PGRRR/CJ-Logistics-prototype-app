import 'package:flutter/material.dart';

class CameraSideBtn extends StatelessWidget {
  const CameraSideBtn({
    super.key,
    required bool isRecording,
    required this.icon,
  }) : _isRecording = isRecording;

  final bool _isRecording;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !_isRecording,
      child: Icon(
        icon,
        size: 35,
        color: Colors.white.withOpacity(0.8),
      ),
    );
  }
}
