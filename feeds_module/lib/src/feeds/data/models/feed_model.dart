import 'dart:convert';

import '../../domain/entities/feed.dart';

class FeedModel extends Feed {
  @override
  // ignore: overridden_fields
  final String hashdatetime;
  @override
  // ignore: overridden_fields
  final String type;
  @override
  // ignore: overridden_fields
  final String title;
  @override
  // ignore: overridden_fields
  final String subtitle;
  @override
  // ignore: overridden_fields
  final double? totalvalue; // nullable
  @override
  // ignore: overridden_fields
  final String? subdivision; // nullable

  FeedModel({
    required this.hashdatetime,
    required this.type,
    required this.title,
    required this.subtitle,
    this.totalvalue,
    this.subdivision,
  }) : super(
          hashdatetime: '',
          type: '',
          title: '',
          subtitle: '',
        );

  Map<String, dynamic> toMap() {
    return {
      'hashdatetime': hashdatetime,
      'type': type,
      'title': title,
      'subtitle': subtitle,
      'totalvalue': totalvalue ?? 0,
      'subdivision': subdivision ?? '',
    };
  }
  // Map<String, dynamic> toMap() {
  //   return {
  //     'hashdatetime': hashdatetime,
  //     'type': type,
  //     'title': title,
  //     'subtitle': subtitle,
  //     if (totalvalue != null) 'totalvalue': totalvalue as double,
  //     if (subdivision != null) 'subdivision': subdivision,
  //   };
  // }

  factory FeedModel.fromMap(Map<String, dynamic> map) {
    return FeedModel(
      hashdatetime: map['hashdatetime'],
      type: map['type'],
      title: map['title'],
      subtitle: map['subtitle'],
      totalvalue: map['totalvalue'] as double?,
      subdivision: map['subdivision'] as String?,
    );
  }
  // factory FeedModel.fromMap(Map<String, dynamic> data) {
  //   final hashdatetime = data['hashdatetime'] as String;
  //   final type = data['type'] as String;
  //   final title = data['title'] as String;
  //   final subtitle = data['subtitle'] as String;
  //   final totalvalue = data['totalvalue'] as double?;
  //   final subdivision = data['subdivision'] as String?;
  //   return FeedModel(
  //     hashdatetime: hashdatetime,
  //     type: type,
  //     title: title,
  //     subtitle: subtitle,
  //     totalvalue: totalvalue ?? 0.0,
  //     subdivision: subdivision,
  //   );
  // }

  String toJson() => json.encode(toMap());
  // Map<String, dynamic> toJson() {
  //   return {
  //     'hashdatetime': hashdatetime,
  //     'type': type,
  //     'title': title,
  //     'subtitle': subtitle,
  //     // here we use collection-if to account for null values
  //     if (totalvalue != null) 'totalvalue': totalvalue as double,
  //     if (subdivision != null) 'subdivision': subdivision,
  //   };
  // }

  factory FeedModel.fromJson(String source) =>
      FeedModel.fromMap(json.decode(source));
  // factory FeedModel.fromJson(Map<String, dynamic> data) {
  //   final hashdatetime = data['hashdatetime'] as String;
  //   final type = data['type'] as String;
  //   final title = data['title'] as String;
  //   final subtitle = data['subtitle'] as String;
  //   final totalvalue = data['totalvalue'] as double?;
  //   final subdivision = data['subdivision'] as String?;

  //   return FeedModel(
  //     hashdatetime: hashdatetime,
  //     type: type,
  //     title: title,
  //     subtitle: subtitle,
  //     totalvalue: totalvalue ?? 0.0,
  //     subdivision: subdivision ?? '',
  //   );
  // }
}
