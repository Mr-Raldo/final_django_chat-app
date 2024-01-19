import 'package:flutter/material.dart';
import 'package:frontchat/models/message.dart';
import 'package:frontchat/models/room.dart';
import 'package:frontchat/services/messageservice.dart';

class RoomChat extends StatefulWidget {
  final Room room;

  RoomChat({required this.room});

  @override
  _RoomChatState createState() => _RoomChatState();
}

class _RoomChatState extends State<RoomChat> {
  List<Message> _messages = [];

  @override
  void initState() {
    super.initState();
    _fetchMessages();
  }

  Future<void> _fetchMessages() async {
    try {
      final messageService = MessageService();
      final messages =
          await messageService.getMessages(roomId: widget.room.toString());
      setState(() {
        _messages = messages;
      });
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.room.name),
      ),
      body: _messages.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Text(message.user),
                  subtitle: Text(message.content),
                );
              },
            ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(hintText: 'Type a message...'),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // Add code to send a message
            },
          ),
        ],
      ),
    );
  }
}
