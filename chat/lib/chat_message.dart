import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String txt;
  final Animation<double> animation;

  const ChatMessage(this.txt, {required this.animation});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: FadeTransition(
        opacity: animation,
        child: SizeTransition(
          sizeFactor: animation,
          axisAlignment: -1,
          child: Row(
            children: [CircleAvatar(
              child: Text("P"),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Name", style: TextStyle(fontWeight: FontWeight.bold),),
                Text(txt)
              ],),
            )
            ],
          ),
        ),
      ),
    );
  }
}
