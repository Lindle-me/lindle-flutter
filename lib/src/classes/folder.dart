/// author: M2K Developments
/// github: https://github.com/m2kdevelopments

class Folder {
  final String id;
  final String name;
  final bool publicFolder;
  final String journeyLink;
  List<dynamic>? links = [];

  Folder({required this.id, required this.name, required this.publicFolder, required this.journeyLink, this.links});
  
}