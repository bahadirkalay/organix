import 'package:flutter/material.dart';

extension PageSize on BuildContext {
  double get sWidth => MediaQuery.of(this).size.width;
  double get sHeight => MediaQuery.of(this).size.height;
}

extension PagePadding on BuildContext {
  Padding get pageRLPadding => Padding(
      padding: EdgeInsets.only(right: sWidth * 0.02, left: sWidth * 0.02));
}

extension EmptyWidget on BuildContext {
  Widget get emptyWidget => SizedBox(
        height: sHeight * 0.02,
      );
  Widget emptyWidgetset(double value) => SizedBox(
        height: sHeight * value,
      );
}

extension PlatformExtension on BuildContext {
  bool get isMobile =>
      Theme.of(this).platform == TargetPlatform.iOS ||
      Theme.of(this).platform == TargetPlatform.android;

  bool get isDesktop =>
      Theme.of(this).platform == TargetPlatform.macOS ||
      Theme.of(this).platform == TargetPlatform.windows ||
      Theme.of(this).platform == TargetPlatform.linux;
}

extension TargetPlatformExtension on TargetPlatform {
  bool get isMobile =>
      this == TargetPlatform.iOS || this == TargetPlatform.android;

  bool get isDesktop =>
      this == TargetPlatform.linux ||
      this == TargetPlatform.macOS ||
      this == TargetPlatform.windows;
}
