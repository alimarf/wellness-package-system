import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class AHtml extends StatelessWidget {
  String? data;
  Map<String, Style>? style;

  AHtml({Key? key, this.data = '-', this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Html(
      data: data,
      onLinkTap: (url, _, __) {
        if (url != null) {
          launch(url);
        }
      },
      style: style != null
          ? style!
          : {
              '*': Style(padding: HtmlPaddings.zero, margin: Margins.zero),
              'body': Style(padding: HtmlPaddings.zero)
            },
    );
  }
}
