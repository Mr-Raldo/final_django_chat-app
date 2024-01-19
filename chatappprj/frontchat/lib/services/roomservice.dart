import 'dart:convert';
import 'package:frontchat/models/room.dart';
import 'package:http/http.dart' as http;

class RoomService {
 static const String _baseUrl = 'http://localhost:8000/api/rooms/';

 Future<List<Room>> getRooms() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((room) => Room.fromJson(room)).toList();
    } else {
      throw Exception('Failed to load rooms');
    }
 }
}