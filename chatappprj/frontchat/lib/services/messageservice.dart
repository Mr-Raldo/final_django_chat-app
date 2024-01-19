import 'dart:convert';
import 'package:frontchat/models/message.dart';
import 'package:http/http.dart' as http;


class MessageService {
 static const String _baseUrl = 'http://localhost:8000/api/messages/';

 Future<List<Message>> getMessages({required String roomId}) async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((message) => Message.fromJson(message)).toList();
    } else {
      throw Exception('Failed to load messages');
    }
 }
}