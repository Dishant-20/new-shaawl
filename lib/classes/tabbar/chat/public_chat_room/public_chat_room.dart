import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shaawl/classes/headers/utils/utils.dart';
import 'package:shaawl/classes/tabbar/chat/public_chat_room/public_room_header/public_chat_room_chats/public_room_chats.dart';
import 'package:shaawl/classes/tabbar/chat/public_chat_room/public_room_header/public_room_header.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class PublicChatRoomScreen extends StatefulWidget {
  const PublicChatRoomScreen({super.key});

  @override
  State<PublicChatRoomScreen> createState() => _PublicChatRoomScreenState();
}

class _PublicChatRoomScreenState extends State<PublicChatRoomScreen> {
  //
  final formGlobalKey = GlobalKey<FormState>();
  ScrollController controller = ScrollController();
  //
  TextEditingController contTextSendMessage = TextEditingController();

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        // ======> HEADER <======
        // ========================
        const PublicRoomHeader(),
        // ========================
        // ========================

        // ======> ALL CHATS LIST <======
        // ========================
        const PublicChatRoomChats(),
        // ========================
        // ========================

        // ======> SEND MESSAGE UI <======
        // ========================
        Align(
          alignment: Alignment.bottomCenter,
          child: sendMessageUI(),
        ),
        // ========================
        // ========================
        //
      ],
    )
        /*SingleChildScrollView(
        scrollDirection: Axis.vertical,
        controller: controller,
        child: Form(
          key: formGlobalKey,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: sendMessageUI(),
          ),
        ),
      ),*/
        );
  }

/*

*/
  Container sendMessageUI() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: const Color.fromARGB(
        255,
        60,
        182,
        195,
      ),
      // height: 60,
      // width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: contTextSendMessage,
                minLines: 1,
                maxLines: 5,
                decoration: const InputDecoration(
                  // labelText: '',
                  hintText: 'write something',
                ),
              ),
            ),
          ),
          //
          IconButton(
            onPressed: () {
              if (kDebugMode) {
                print('send');
              }
              //
              controller.jumpTo(controller.position.maxScrollExtent);
              //
              if (formGlobalKey.currentState!.validate()) {
                if (kDebugMode) {
                  print('object');
                }
                //
                sendMessage(contTextSendMessage.text.toString());
                //
              }
            },
            icon: const Icon(
              Icons.send,
            ),
          ),
          //
        ],
      ),
    );
  }

  //
  // send message
  sendMessage(strGetMessage) async {
    // str_last_message = str_get_message.toString();
    // print(cont_txt_send_message.text);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    CollectionReference users = FirebaseFirestore.instance.collection(
      'message/shaawl/public_chats',
    );

    users
        .add(
          {
            'sender_name': 'test',
            'users': [
              'room_id',
              'reverse_room_id',
            ],
          },
        )
        .then((value) => print(
                "Message send successfully. Message id is =====>${value.id}")

            // func_scroll_to_bottom(),
            )
        .catchError(
          (error) => print("Failed to add user: $error"),
        );
  }
  //
}
