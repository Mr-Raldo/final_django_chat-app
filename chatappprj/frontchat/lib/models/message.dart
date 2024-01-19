class Message {
  final int id;
  final String content;
  final DateTime timestamp;
  final String user;

  Message({
    required this.id,
    required this.content,
    required this.timestamp,
    required this.user,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      content: json['content'],
      timestamp: DateTime.parse(json['date']),
      user: json['user'],
    );
  }
}