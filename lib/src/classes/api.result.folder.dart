import 'package:lindle/src/classes/folder.dart';

class APIResultFolder {
  final bool result;
  final String message;
  final Folder? folder;
  APIResultFolder({required this.result, required this.message, this.folder});
}
