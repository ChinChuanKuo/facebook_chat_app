import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Function onPressed;

  const CircleButton({
    Key key,
    @required this.icon,
    @required this.iconSize,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(this.icon),
        iconSize: this.iconSize,
        hoverColor: Colors.transparent,
        color: Colors.black,
        onPressed: this.onPressed,
      ),
    );
  }
}
