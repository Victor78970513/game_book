import 'package:flutter/material.dart';

class ModalShowImage extends StatefulWidget {
  final String imageUrl;
  const ModalShowImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<ModalShowImage> createState() => _ModalShowImageState();
}

class _ModalShowImageState extends State<ModalShowImage> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: const EdgeInsets.only(left: 10, right: 10),
        child: FadeInImage(
          // height: 200,
          // width: width,
          fit: BoxFit.cover,
          placeholder: const AssetImage("assets/img/placeholder.gif"),
          image: NetworkImage(widget.imageUrl),
        ));
  }
}
