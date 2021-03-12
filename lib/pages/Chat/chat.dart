import 'package:facebook_chat_app/data/data.dart';
import 'package:facebook_chat_app/models/models.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  const ChatScreen({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          widget.user.name,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz),
            color: Colors.black,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                      reverse: true,
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Message message = messages[index];
                        bool isMe = message.sender.id == currentUser.id;
                        return _BuildMessage(
                          message: message,
                          isMe: isMe,
                        );
                      }),
                ),
              ),
            ),
            _BuildMessageComposer(),
          ],
        ),
      ),
    );
  }
}

class _BuildMessage extends StatelessWidget {
  final Message message;
  final bool isMe;

  const _BuildMessage({
    Key key,
    @required this.message,
    @required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: isMe
              ? const EdgeInsets.only(
                  top: 8.0,
                  bottom: 8.0,
                  left: 80.0,
                )
              : const EdgeInsets.only(
                  top: 8.0,
                  bottom: 8.0,
                ),
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
          width: MediaQuery.of(context).size.width * 0.75,
          decoration: BoxDecoration(
            color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.time,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                message.text,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        !isMe
            ? IconButton(
                icon: message.isLiked
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border),
                iconSize: 30.0,
                color: message.isLiked ? Colors.red : Colors.blueGrey,
                onPressed: () {},
              )
            : SizedBox.shrink(),
      ],
    );
  }
}

class _BuildMessageComposer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        height: 70.0,
        color: Colors.white,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.camera_alt),
              color: Colors.black45,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.photo),
              color: Colors.black45,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.mic),
              color: Colors.black45,
              onPressed: () {},
            ),
            Expanded(
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration.collapsed(
                  hintText: 'Send a message...',
                ),
                onChanged: (value) => print(value),
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              color: Colors.black45,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
