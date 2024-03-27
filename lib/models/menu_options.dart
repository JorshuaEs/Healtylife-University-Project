import "package:flutter/material.dart";

class MenuOption {
  final String route;
  final IconData icon;
  final String title;
  final Widget screen;

  MenuOption({
    required this.route,
    required this.icon,
    required this.title,
    required this.screen,
  });
}
