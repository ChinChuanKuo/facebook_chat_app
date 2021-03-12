import 'package:facebook_chat_app/models/models.dart';
import 'package:facebook_chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TabletAppBar extends StatelessWidget {
  final String title;
  final User currentUser;

  const TabletAppBar({
    Key key,
    @required this.title,
    @required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              this.title,
              style: TextStyle(
                color: Color.fromARGB(255, 56, 88, 152),
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UserCard(user: currentUser),
                SizedBox(width: 12.0),
                CircleButton(
                  icon: Icons.search,
                  iconSize: 30.0,
                  onPressed: () => print("Search"),
                ),
                CircleButton(
                  icon: Icons.message_rounded,
                  iconSize: 30.0,
                  onPressed: () => print("Messager"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
