class Event {
  final String name;
  final String district;
  final String placeName;
  final String eventType;
  final DateTime date;
  final DateTime? startDate; // Nullable for date range
  final DateTime? endDate;   // Nullable for date range
  final String location;
  final String description;
  final String phone; // Keeping it as String to avoid issues with leading zeros
  final String imageUrl;

  Event({
    required this.name,
    required this.district,
    required this.placeName,
    required this.eventType,
    required this.date,
    this.startDate,
    this.endDate,
    required this.location,
    required this.description,
    required this.phone,
    required this.imageUrl,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      name: json['name'],
      district: json['district'],
      placeName: json['placename'],
      eventType: json['eventtype'],
      date: DateTime.parse(json['date']), // Assuming date is in ISO 8601 format
      startDate: json['daterange'] != null
          ? DateTime.parse(json['daterange']['start'])
          : null,
      endDate: json['daterange'] != null
          ? DateTime.parse(json['daterange']['end'])
          : null,
      location: json['location'],
      description: json['description'],
      phone: json['phone'].toString(), // Convert to String for consistency
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'district': district,
      'placename': placeName,
      'eventtype': eventType,
      'date': date.toIso8601String(),
      'daterange': {
        'start': startDate?.toIso8601String(),
        'end': endDate?.toIso8601String(),
      },
      'location': location,
      'description': description,
      'phone': phone,
      'imageUrl': imageUrl,
    };
  }
}
