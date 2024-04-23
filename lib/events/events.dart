class Events {
  final String eventId;
  final String eventTitle;
  final String eventText;
  final bool eventReadStatus;
  final List<String> eventPictures;

  Events({
    required this.eventId,
    required this.eventTitle,
    required this.eventText,
    required this.eventReadStatus,
    required this.eventPictures,
  });

  static Events fromJson(json) => Events(
        eventId: json['eventId'],
        eventTitle: json['eventTitle'],
        eventText: json['eventText'],
        eventReadStatus: json['eventReadStatus'],
        eventPictures: List<String>.from(json['eventPictures']),
      );
}
