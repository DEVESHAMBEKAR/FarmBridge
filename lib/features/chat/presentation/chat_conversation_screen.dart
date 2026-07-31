import 'package:flutter/material.dart';

class ChatConversationScreen extends StatelessWidget {
  final String id;
  const ChatConversationScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat $id')),
      body: const Center(child: Text('Chat Conversation UI')),
    );
  }
}
