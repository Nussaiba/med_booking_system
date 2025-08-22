class CenterRatingsData {
  final CenterInfo center;
  final RatingSummary summary;
  final List<Rating> ratings;

  CenterRatingsData({
    required this.center,
    required this.summary,
    required this.ratings,
  });

  factory CenterRatingsData.fromJson(Map<String, dynamic> json) {
    return CenterRatingsData(
      center: CenterInfo.fromJson(json['center']),
      summary: RatingSummary.fromJson(json['summary']),
      ratings: (json['ratings'] as List)
          .map((e) => Rating.fromJson(e))
          .toList(),
    );
  }
}

class CenterInfo {
  final int id;
  final String name;

  CenterInfo({
    required this.id,
    required this.name,
  });

  factory CenterInfo.fromJson(Map<String, dynamic> json) {
    return CenterInfo(
      id: json['id'],
      name: json['name'],
    );
  }
}

class RatingSummary {
  final double average;
  final int count;

  RatingSummary({
    required this.average,
    required this.count,
  });

  factory RatingSummary.fromJson(Map<String, dynamic> json) {
    return RatingSummary(
      average: (json['average'] as num).toDouble(),
      count: json['count'],
    );
  }
}

class Rating {
 
  Rating();

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating();
  }
}
