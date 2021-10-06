class Feed {
  final String hashdatetime;
  final String type;
  final String title;
  final String subtitle;
  final double? totalvalue; // nullable
  final String? subdivision; // nullable

  Feed({
    required this.hashdatetime,
    required this.type,
    required this.title,
    required this.subtitle,
    this.totalvalue,
    this.subdivision,
  });
}
