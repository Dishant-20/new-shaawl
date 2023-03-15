import 'package:flutter/material.dart';
import 'package:shaawl/classes/tabbar/chat/all_chat_list/all_chats_list.dart';
import 'package:shaawl/classes/tabbar/chat/public_chat_room/public_chat_room.dart';

class TabbarChatScreen extends StatefulWidget {
  const TabbarChatScreen({super.key});

  @override
  State<TabbarChatScreen> createState() => _TabbarChatScreenState();
}

class _TabbarChatScreenState extends State<TabbarChatScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              TabBar(
                tabs: [
                  Tab(
                    text: 'Public Chat',
                  ),
                  Tab(
                    text: 'My Chats',
                  ),
                ],
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            //
            PublicChatRoomScreen(),
            // CHAT LIST
            AllChatsListScreen(),
          ],
        ),
      ),
    );
  }
}
