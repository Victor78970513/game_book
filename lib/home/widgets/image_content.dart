import 'package:flutter/material.dart';

class ImageContent extends StatelessWidget {
  final String imageUrl;
  final String placeholder;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Alignment alignment;
  final Widget? child;
  final void Function()? onPressed;

  const ImageContent(
      {Key? key,
      required this.imageUrl,
      this.width,
      this.height = 200,
      this.fit = BoxFit.cover,
      this.placeholder = "assets/img/placeholder.gif",
      this.alignment = const Alignment(0, 0.9),
      this.child,
      this.onPressed})
      : super(key: key);

  Widget contentImage() {
    return FadeInImage(
      height: height,
      width: width,
      fit: BoxFit.cover,
      placeholder: AssetImage(placeholder),
      image: NetworkImage(imageUrl),
    );
  }

  Widget degrade() {
    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: alignment,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              const Color(0xFF161B22).withOpacity(0.00),
              const Color(0xFF161B22).withOpacity(1.0),
            ],
            stops: const [0.0, 1.0],
          ),
        ),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0, 0),
      children: [
        contentImage(),
        degrade(),
      ],
    );
  }
}
