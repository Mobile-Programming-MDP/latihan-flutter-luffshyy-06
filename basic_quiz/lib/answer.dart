import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  const Answer(this.selectHandler, this.answerText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => selectHandler(),
          style: ButtonStyle(
            textStyle: WidgetStateProperty.all(
              const TextStyle(color: Colors.white),
            ),
            backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (states) {
                if (states.contains(WidgetState.pressed)) {
                  return Colors.white;
                }
                return Colors.green;
              },
            ),
          ),
          child: Text(answerText),
        ),
      ),
    );
  }
}
