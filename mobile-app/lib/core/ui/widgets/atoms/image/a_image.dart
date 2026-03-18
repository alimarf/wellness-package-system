// ignore_for_file: constant_identifier_names

import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../colors/colors.dart';
import '../clip_rect/a_clip_rect.dart';
import '../container/a_container.dart';

enum ImageSource { Memory, Network, Asset, File, Svg }

// ignore: must_be_immutable
class AImage extends StatelessWidget {
  String? url;
  String? path;
  Uint8List? bytes;
  ImageSource? source;
  double? height;
  double? width;
  double cornerRadius;
  BoxFit? fit;
  Color? backgroundColor;
  Function? onClick;
  bool enabledHero;
  bool enabledBorderRadiusTopLeft;
  bool enabledBorderRadiusTopRight;
  bool enabledBorderRadiusBottomLeft;
  bool enabledBorderRadiusBottomRight;
  bool repeat;

  AImage({
    Key? key,
    this.url,
    this.path,
    this.bytes,
    this.source = ImageSource.Network,
    this.height,
    this.width,
    this.fit = BoxFit.fitHeight,
    this.backgroundColor = AppColors.transparent,
    this.enabledHero = false,
    this.cornerRadius = 0,
    this.enabledBorderRadiusTopLeft = true,
    this.enabledBorderRadiusTopRight = true,
    this.enabledBorderRadiusBottomLeft = true,
    this.enabledBorderRadiusBottomRight = true,
    this.repeat = false,
    this.onClick,
  }) : super(key: key);

  Widget _buildImage() {
    Widget image;

    switch (source) {
      case ImageSource.File:
        image = Image.file(
          File(path!),
          fit: fit,
        );
        break;
      case ImageSource.Asset:
        image = Image.asset(
          url!,
          fit: fit,
        );
      case ImageSource.Svg:
        image = SvgPicture.asset(
          url!,
          fit: fit!,
        );
        break;
      case ImageSource.Memory:
        image = Image.memory(
          bytes!,
          fit: fit,
        );
        break;
      case ImageSource.Network:
        image = CachedNetworkImage(
          imageUrl: url!,
          alignment: Alignment.centerLeft,
          // TODO
          // progressIndicatorBuilder: (context, url, downloadProgress) =>
          //     ASkeleton(),
          errorWidget: (context, url, error) => Image.asset(
            'assets/icons/ic_app.png',
            fit: fit,
          ),
          fit: fit,
          height: height,
          width: width,
          repeat: repeat == true ? ImageRepeat.repeat : ImageRepeat.noRepeat,
        );
        break;
      default:
        image = Container();
    }

    if (enabledHero && url != null) {
      return Hero(
        tag: url!,
        child: image,
      );
    } else {
      return image;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AClipRRect(
      borderRadius: BorderRadius.only(
          topLeft:
              Radius.circular(enabledBorderRadiusTopLeft ? cornerRadius : 0),
          topRight:
              Radius.circular(enabledBorderRadiusTopRight ? cornerRadius : 0),
          bottomLeft:
              Radius.circular(enabledBorderRadiusBottomLeft ? cornerRadius : 0),
          bottomRight: Radius.circular(
              enabledBorderRadiusBottomRight ? cornerRadius : 0)),
      child: InkWell(
        onTap: () {
          if (onClick != null) {
            onClick!();
          }
        },
        child: AContainer(
          color: backgroundColor,
          padding: EdgeInsets.zero,
          child: _buildImage(),
          height: height,
          width: width,
        ),
      ),
    );
  }
}
