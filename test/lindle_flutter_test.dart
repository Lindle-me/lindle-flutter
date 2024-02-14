import 'package:flutter_test/flutter_test.dart';
import 'package:lindle/lindle_flutter.dart';

void main() {
  const apiKey ="";
  var lindle = const Lindle(apiKey: apiKey);

  test('Testing Lindle', () async {
    await lindle.getUser();
    await lindle.getLinks();
    await lindle.getFolders();
    await lindle.getSyncedBookmarks();
    expect(true, true);
  });

  test('CRUD Links', () async {
    var res = await lindle.createLink(
      name: 'Z Test Link',
      url: 'https://google.com',
    );
    expect((res.link?.id ?? "").isNotEmpty && res.result, true);

    // Updating Link
    var response =
        await lindle.updateLink(id: (res.link?.id ?? ""), name: "ZZZ");
    expect(response.result, true);

    // Delete Link
    var response1 = await lindle.deleteLink(res.link?.id ?? "");
    expect(response1.result, true);
  });

  test('CRUD Folders', () async {
    var res = await lindle.createFolder(
      name: 'Z Test Folder',
    );
    expect((res.result) && res.result, true);

    // Updating Link
    var response =
        await lindle.updateFolder(id: (res.folder?.id ?? ""), name: "ZZZ");
    expect(response.result, true);

    // Delete Link
    var response1 = await lindle.deleteFolder(res.folder?.id ?? "");
    expect(response1.result, true);
  });
}
