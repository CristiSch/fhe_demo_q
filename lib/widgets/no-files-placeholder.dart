import 'package:flutter/material.dart';

class NoFilesPlaceholder extends StatelessWidget {
  const NoFilesPlaceholder({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have not uploaded any files.',
            ),
          ],
        ),
      );
}
