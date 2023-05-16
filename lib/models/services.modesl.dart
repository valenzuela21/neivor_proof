import "package:flutter/material.dart";
class ServiceModel{
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Icon icon;

  ServiceModel({required this.title, required this.subtitle, required this.onTap, required this.icon});
}