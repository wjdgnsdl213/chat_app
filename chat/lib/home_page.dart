import 'package:chat/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<AnimatedListState> _animListKey = GlobalKey<AnimatedListState>();
  TextEditingController _textEditingController = TextEditingController();
  List<String> _chats = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Chat App")
      ),
      body: Column(
        children: [
          Expanded(
              child: AnimatedList(
                key: _animListKey,
                reverse: true,
                itemBuilder: _buildItem,
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                        hintText: "send a message"
                    ),
                    onSubmitted: _handSubmitted,
                  ),
                ),
                SizedBox(
                  width:8.0,
                ),
                FlatButton(onPressed: () {
                  _handSubmitted(_textEditingController.text);
                }, child: Text("Send"), color: Colors.amberAccent,)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(context, index, animation){
    return ChatMessage(_chats[index], animation: animation);
  }

  void _handSubmitted(String text){
    Logger().d(text);
    _textEditingController.clear();
    _chats.insert(0, text);
    _animListKey.currentState?.insertItem(0);
  }
}

