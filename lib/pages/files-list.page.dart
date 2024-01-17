import 'package:flutter/material.dart';
import 'package:qypt_tech_assign/pages/file-list.page.dart';
import 'package:qypt_tech_assign/state/files.state.dart';

class FilesListPage extends StatefulWidget {
  const FilesListPage();

  @override
  State<FilesListPage> createState() => _FilesListPageState();
}

class _FilesListPageState extends State<FilesListPage> {
  final _filesState = FilesState();

  @override
  Widget build(BuildContext context) => _scaffold(
        body: FileList(),
        floatingActionButton: _uploadFileButton(),
      );

  Widget _scaffold({required Widget body, required Widget floatingActionButton}) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('File List'),
        ),
        body: body,
        floatingActionButton: floatingActionButton,
      );

  Widget _uploadFileButton() => FilledButton(
        onPressed: () => _filesState.loadFileFromLocalStorage(),
        child: const Text('Load File'),
      );
}
