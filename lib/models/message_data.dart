import 'package:flutter/cupertino.dart';

//immutable means that, you can not change the object, ones object created - object can not be changed
@immutable
class MessageData {
  const MessageData(
      {required this.senderName,
      required this.message,
      required this.messageData,
      required this.dateMessage,
      required this.profilePicture});

  final String senderName;
  final String message;
  final String messageData;
  final String dateMessage;
  final String profilePicture;
}
