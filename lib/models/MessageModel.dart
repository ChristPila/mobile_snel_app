

class MessageModel {
  final String text;
  final DateTime date;
  final bool isSentByMe;

  const MessageModel({
    required this.text,
    required this.date,
    required this.isSentByMe,
});

}