import 'package:lindle/src/classes/link.dart';

class APIResultLink {
  final bool result;
  final String message;
  final Link? link;
  APIResultLink({required this.result, required this.message, this.link});
}
