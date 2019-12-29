import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: Image.asset(
        "assets/images/aec.jpg",
        height: 340.0,
        fit: BoxFit.cover,
      ),
    );
  }
}