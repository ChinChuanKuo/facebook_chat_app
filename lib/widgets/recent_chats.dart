import 'package:facebook_chat_app/models/models.dart';
import 'package:facebook_chat_app/pages/pages.dart';
import 'package:facebook_chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
  final Message chat;

  const RecentChats({
    Key key,
    @required this.chat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ChatScreen(
            user: chat.sender,
          ),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(
          top: 5.0,
          bottom: 5.0,
          right: 20.0,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        decoration: BoxDecoration(
          color: chat.unread ? Color(0xFFFFEFEE) : Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ProfileAvatar(
                  imageUrl: chat.sender.imageUrl,
                  isActive: chat.sender.isActive,
                ),
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat.sender.name,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Text(
                        chat.text,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  chat.time,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                chat.unread
                    ? Container(
                        width: 40.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'NEW',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
