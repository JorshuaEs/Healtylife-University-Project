import "package:flutter/material.dart";

class MenuOption {
  final String? route;
  final IconData? icon;
  final String? title;
  final Widget? screen;
  final VoidCallback? onTap;

  MenuOption({
    this.route,
    this.icon,
    this.title,
    this.screen,
    this.onTap,
  });
}
