// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frontchat/models/room.dart';
import 'package:frontchat/screen/roomchat.dart';
import 'package:frontchat/services/roomservice.dart';

class Home extends StatefulWidget {
  @override
  _RoomListState createState() => _RoomListState();
}

class _RoomListState extends State<Home> {
  List<Room> _rooms = [];

  @override
  void initState() {
    super.initState();
    _fetchRooms();
  }

  Future<void> _fetchRooms() async {
    try {
      final roomService = RoomService();
      final rooms = await roomService.getRooms();
      setState(() {
        _rooms = rooms;
      });
    } catch (e) {
      // Handle error
    }
  }

// *Django Code to check if Api was accessible to flutter
  // void checkAPIAccessibility() async {
  //   String MainURL = "http://localhost:8000/api/rooms/";
  //   var response = await http.get(Uri.parse(MainURL));

  //   if (response.statusCode == 200) {
  //     print('API is accessible from the Flutter network');
  //     // Display data using Flutter widgets
  //     // For example, use ListTile widget to display the data
  //   } else {
  //     print('Failed to access the API from the Flutter network');
  //   }
  // }

  // void main() {
  //   checkAPIAccessibility();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rooms'),
      ),
      body: _rooms.isEmpty
          // ignore:
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _rooms.length,
              itemBuilder: (context, index) {
                final room = _rooms[index];
                return ListTile(
                  title: Text(room.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RoomChat(room: room),
                      ),
                    ); // Navigate to the messages screen for this room
                  },
                );
              },
            ),
    );
  }
}
