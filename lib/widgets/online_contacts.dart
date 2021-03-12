import 'package:facebook_chat_app/data/data.dart';
import 'package:facebook_chat_app/models/models.dart';
import 'package:facebook_chat_app/pages/pages.dart';
import 'package:facebook_chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OnlineContacts extends StatefulWidget {
  @override
  _OnlineContactsState createState() => _OnlineContactsState();
}

class _OnlineContactsState extends State<OnlineContacts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 10.0),
        scrollDirection: Axis.horizontal,
        itemCount: favorites.length,
        itemBuilder: (BuildContext context, int index) {
          final User favorite = favorites[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChatScreen(
                  user: favorite,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  ProfileAvatar(
                    imageUrl: favorite.imageUrl,
                    isActive: favorite.isActive,
                  ),
                  SizedBox(height: 6.0),
                  Text(
                    favorite.name,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
