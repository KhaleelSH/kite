class Perspective {
  Perspective({required this.text, required this.sources});

  final String text;
  final List<PerspectiveSource> sources;
}

class PerspectiveSource {
  PerspectiveSource({required this.name, required this.url});

  final String name;
  final String url;
}
