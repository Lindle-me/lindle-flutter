import 'package:lindle/src/classes/bookmark.dart';
import 'package:lindle/src/classes/bookmark.folder.dart';

class APIResultBookmark {
  final List<Bookmark> links;
  final List<BookmarkFolder> folders;
  APIResultBookmark({required this.links, required this.folders});
}
