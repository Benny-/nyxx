part of nyxx;

/// Video attached to embed. Can contain null elements.
class EmbedVideo implements Downloadable {
  /// The embed video's URL.
  String url;

  /// The embed video's height.
  int height;

  /// The embed video's width.
  int width;

  EmbedVideo._new(Map<String, dynamic> raw) {
    this.url = raw['url'] as String;
    this.height = raw['height'] as int;
    this.width = raw['width'] as int;
  }

  @override
  Future<List<int>> download() => utils.downloadFile(Uri.parse(url));

  @override
  Future<File> downloadFile(File file) async =>
      file.writeAsBytes(await download());

  @override
  String toString() => url;
}
