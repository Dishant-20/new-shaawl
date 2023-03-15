import 'package:flutter/material.dart';
import 'package:shaawl/classes/headers/utils/utils.dart';

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}

class PublicChatRoomChats extends StatefulWidget {
  const PublicChatRoomChats({super.key});

  @override
  State<PublicChatRoomChats> createState() => _PublicChatRoomChatsState();
}

class _PublicChatRoomChatsState extends State<PublicChatRoomChats> {
  //
  // ScrollController controller = ScrollController();
  //
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(
        messageContent:
            "How have you been? How have you been? How have you been?",
        messageType: "receiver"),
    ChatMessage(
        messageContent:
            "Hey Kriss, I am doing fine dude. wbu? Hey Kriss, I am doing fine dude. wbu? Hey Kriss, I am doing fine dude. wbu? Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong 2?", messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong 2?", messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong 2?", messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong 2?", messageType: "sender"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: const EdgeInsets.only(top: 120, bottom: 60),
      child: ListView.builder(
        // controller: controller,
        itemCount: messages.length,
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(
              left: 14,
              right: 14,
              //
              top: 10,
              bottom: 10,
            ),
            child: Align(
              alignment: (messages[index].messageType == "receiver"
                  ? Alignment.topLeft
                  : Alignment.topRight),
              child: (messages[index].messageType == "receiver")
                  ? receiverUI(index)
                  : senderUI(index),
            ),
          );
        },
      ),
    );
  }

  Column receiverUI(int index) {
    return Column(
      children: [
        //
        Align(
          alignment: Alignment.bottomLeft,
          child: textWithRegularStyle(
            'Dishant Rajput',
            12.0,
            Colors.black,
            'right',
          ),
        ),
        //
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            margin: const EdgeInsets.only(
              right: 40,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(
                  16,
                ),
                bottomLeft: Radius.circular(
                  0,
                ),
                topRight: Radius.circular(
                  16,
                ),
                bottomRight: Radius.circular(
                  16,
                ),
              ),
              color: (messages[index].messageType == "receiver"
                  ? Colors.grey.shade200
                  : Colors.blue[200]),
            ),
            padding: const EdgeInsets.all(16),
            child: Text(
              messages[index].messageContent,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ),
        //
        Align(
          alignment: Alignment.bottomLeft,
          child: textWithRegularStyle(
            '6:44 am',
            12.0,
            Colors.black,
            'left',
          ),
        ),
        //
      ],
    );
  }

  Column senderUI(int index) {
    return Column(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: const EdgeInsets.only(
              left: 40,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(
                  16,
                ),
                bottomLeft: Radius.circular(
                  16,
                ),
                topRight: Radius.circular(
                  16,
                ),
              ),
              color: (messages[index].messageType == "receiver"
                  ? Colors.grey.shade200
                  : Colors.blue[200]),
            ),
            padding: const EdgeInsets.all(
              16,
            ),
            child: Text(
              messages[index].messageContent,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
        ),
        //
        Align(
          alignment: Alignment.bottomRight,
          child: textWithRegularStyle(
            '6:44 am',
            12.0,
            Colors.black,
            'right',
          ),
        ),
        //
      ],
    );
  }
}
