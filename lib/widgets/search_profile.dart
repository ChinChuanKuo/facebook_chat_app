import 'package:flutter/material.dart';

class SearchProfile extends StatelessWidget {
  final Function(String) onChange;

  const SearchProfile({
    Key key,
    @required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(224, 224, 224, 0.8),
          hintText: 'Search',
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black45,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
        ),
        onChanged: onChange,
      ),
    );
  }
}
