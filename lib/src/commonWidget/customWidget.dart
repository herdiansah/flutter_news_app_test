import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget customText(
  String msg, {
  TextStyle? style,
  TextAlign textAlign = TextAlign.justify,
  TextOverflow overflow = TextOverflow.clip,
  required BuildContext context,
}) {
  final baseStyle = style ?? Theme.of(context).textTheme.bodyLarge ?? const TextStyle();
  final baseFontSize = baseStyle.fontSize ?? 14.0;

  final adjusted = baseStyle.copyWith(
    fontSize: baseFontSize - (fullWidth(context) <= 375 ? 2 : 0),
  );

  return Text(
    msg,
    style: adjusted,
    textAlign: textAlign,
    overflow: overflow,
  );
}

double fullWidth(BuildContext context) => MediaQuery.of(context).size.width;

double fullHeight(BuildContext context) => MediaQuery.of(context).size.height;

double getDimention(BuildContext context, double unit) {
  if (fullWidth(context) <= 360.0) return unit / 1.3;
  return unit;
}

Image customImage(String path, {BoxFit fit = BoxFit.contain}) {
  return Image(
    image: customAdvanceNetworkImage(path),
    fit: fit,
    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
      return const SizedBox.shrink();
    },
  );
}

ImageProvider customAdvanceNetworkImage(String path) {
  return CachedNetworkImageProvider(path);
}

double getFontSize(BuildContext context, double size) {
  final scale = MediaQuery.textScalerOf(context).scale(1.0);
  if (scale < 1) return getDimention(context, size);
  return getDimention(context, size / scale);
}

String getTypeImage(String type) {
  switch (type) {
    case 'Fighting':
      return 'assets/images/types/Fight.png';
    default:
      return 'assets/images/types/$type.png';
  }
}
