import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DashboardGridItem extends StatelessWidget {
  String title, description, iconPath;
  VoidCallback onTap;
  DashboardGridItem(this.iconPath, this.title, this.description,this.onTap, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x1b000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: AppIconImageSVG(iconPath),
            ),
            Container(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleGridItem(title),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.50,
                          color: Color(0x7F929292),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  DescriptionGridItem(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleGridItem extends StatelessWidget {
  String title;

  TitleGridItem(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class DescriptionGridItem extends StatelessWidget {
  String title;

  DescriptionGridItem(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.start,
      maxLines: 3,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Color(0xFF8A8A8A),
        fontSize: 13,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class AppIconImageSVG extends StatelessWidget {
  String path;

  AppIconImageSVG(this.path, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      height: 20.0,
      width: 20.0,
      allowDrawingOutsideViewBox: true,
    );
  }
}

class AppIconImageAsset extends StatelessWidget {
  String path;

  AppIconImageAsset(this.path, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
    );
  }
}
