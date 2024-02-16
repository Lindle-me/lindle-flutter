/// author: M2K Developments
/// github: https://github.com/m2kdevelopments

import 'package:lindle/src/classes/api.result.bookmark.dart';
import 'package:lindle/src/classes/api.result.dart';
import 'package:lindle/src/classes/api.result.folder.dart';
import 'package:lindle/src/classes/api.result.link.dart';
import 'package:lindle/src/classes/bookmark.dart';
import 'package:lindle/src/classes/bookmark.folder.dart';
import 'package:lindle/src/classes/folder.dart';
import 'package:lindle/src/classes/link.dart';
import 'package:lindle/src/classes/user.dart';
import 'package:lindle/src/utils/api.dart';

class Lindle {
  final String apiKey;

  // Constructor to initialize Lindle with an API key
  const Lindle({required this.apiKey});

  // GETTING LINKS AND FOLDERS

  /// Fetches user information.
  Future<User> getUser() async {
    Api.setAccessToken(apiKey);
    var res = await Api.get('/api/user');
    return User(
      id: res['_id'],
      name: res['name'],
      image: res['image'],
      linkLimit: res['count'],
    );
  }

  /// Fetches a list of links.
  Future<List<Link>> getLinks() async {
    Api.setAccessToken(apiKey);
    var list = await Api.get('/api/links');
    var links = <Link>[];
    for (var item in list) {
      links.add(Link(
        id: item['_id'],
        name: item['name'],
        url: item['url'],
        folder: item['folder'] ?? "",
        favourite: item['favourite'] ?? false,
      ));
    }
    return links;
  }

  /// Fetches a list of folders.
  ///
  /// If [withLinks] is true, also fetches associated links.
  Future<List<Folder>> getFolders({withLinks = false}) async {
    Api.setAccessToken(apiKey);
    var list = await Api.get('/api/folders');
    var folders = <Folder>[];
    var links = <Link>[];
    if (withLinks) {
      links = await getLinks();
    }

    for (var item in list) {
      if (item['public'] == null) {
        item['public'] = false;
      }

      folders.add(Folder(
        id: item['_id'],
        name: item['name'],
        publicFolder: item['public'],
        journeyLink: "https://lindle.click/${item['codename']}",
        links: links.where((element) => element.folder == item['_id']).toList(),
      ));
    }

    return folders;
  }

  /// Fetches synced bookmarks.
  Future<APIResultBookmark> getSyncedBookmarks() async {
    Api.setAccessToken(apiKey);
    var res = await Api.get('/api/links/bookmarks/sync');
    var links = <Bookmark>[];
    var folders = <BookmarkFolder>[];
    for (var item in res['folders']) {
      folders.add(BookmarkFolder(
        id: item['id'],
        name: item['name'],
        date: item['date'],
        folder: item['folder'],
      ));
    }
    for (var item in res['links']) {
      links.add(Bookmark(
        id: item['id'],
        name: item['name'],
        date: item['date'],
        folder: item['folder'],
        url: item['url'],
      ));
    }
    return APIResultBookmark(folders: folders, links: links);
  }

  // CREATING LINKS AND FOLDERS

  /// Creates a new link.
  Future<APIResultLink> createLink(
      {required String name,
      required String url,
      String? folder,
      bool? favourite}) async {
    Api.setAccessToken(apiKey);
    var res = await Api.post(
      '/api/links',
      {"name": name, "url": url, "folder": folder, "favourite": favourite},
    );
    var item = res['link'];
    var link = res['link'] != null
        ? Link(
            id: item['_id'],
            name: item['name'],
            url: item['url'],
            folder: item['folder'] ?? "",
            favourite: item['favourite'] ?? false,
          )
        : null;
    return APIResultLink(
        message: res['message'], result: res['result'], link: link);
  }

  /// Creates a new folder.
  Future<APIResultFolder> createFolder(
      {required String name, bool? publicFolder}) async {
    Api.setAccessToken(apiKey);
    var res = await Api.post(
      '/api/folders',
      {
        "name": name,
        "public": publicFolder,
      },
    );

    var item = res['folder'];
    var folder = item != null
        ? Folder(
            id: item['_id'],
            name: item['name'],
            publicFolder: item['public'] ?? false,
            journeyLink: "https://lindle.click/${item['codename']}",
            links: [],
          )
        : null;
    return APIResultFolder(
        message: res['message'], result: res['result'], folder: folder);
  }

  // UPDATING LINKS AND FOLDERS
  /// Updates an existing link.
  Future<APIResult> updateLink(
      {required String id,
      String? name,
      String? url,
      String? folder,
      bool? favourite}) async {
    Api.setAccessToken(apiKey);
    var res = await Api.patch(
      '/api/links/$id',
      {"name": name, "url": url, "folder": folder, "favourite": favourite},
    );
    return APIResult(message: res['message'], result: res['result']);
  }

  /// Updates an existing folder.
  Future<APIResult> updateFolder(
      {required String id, String? name, bool? publicFolder}) async {
    Api.setAccessToken(apiKey);
    var res = await Api.patch(
      '/api/folders/$id',
      {
        "name": name,
        "public": publicFolder,
      },
    );
    return APIResult(message: res['message'], result: res['result']);
  }

  // DELETE and REMOVAL
  /// Deletes a link by its ID.
  Future<APIResult> deleteLink(String id) async {
    Api.setAccessToken(apiKey);
    var res = await Api.delete('/api/links/$id');
    return APIResult(message: res['message'], result: res['result']);
  }

  /// Deletes a folder by its ID.
  Future<APIResult> deleteFolder(String id) async {
    Api.setAccessToken(apiKey);
    var res = await Api.delete('/api/folders/$id');
    return APIResult(message: res['message'], result: res['result']);
  }
}
