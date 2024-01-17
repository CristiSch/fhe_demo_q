import 'package:flutter/material.dart';

class File extends StatelessWidget {
  final String name;
  final void Function() onButtonPressed;

  const File({
    required this.name,
    required this.onButtonPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) => _row(
        children: [
          _fileName(name: name),
          _analyzeFileButton(),
        ],
      );

  Widget _row({required List<Widget> children}) => Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.black12),
          ),
        ),
        padding: EdgeInsets.only(bottom: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      );

  Widget _fileName({required String name}) => Container(
        padding: EdgeInsets.only(left: 16),
        child: Text(
          name,
          style: TextStyle(color: Colors.black54, fontSize: 24),
        ),
      );

  Widget _analyzeFileButton() => Container(
        padding: EdgeInsets.only(right: 16),
        child: OutlinedButton(
          child: Text('Analyze'),
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: Colors.purple,
            ),
          ),
          onPressed: onButtonPressed,
        ),
      );
}
