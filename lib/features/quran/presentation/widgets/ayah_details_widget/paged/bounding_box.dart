import 'package:flutter/material.dart';
import "dart:ui";



Rect polygonToRect(String polygon) {

  final points = polygon.trim().split(' ').where((s) => s.isNotEmpty).toList();

  double minX = double.infinity;
  double minY = double.infinity;
  double maxX = -double.infinity; // Use -infinity for the lower bound
  double maxY = -double.infinity;

  for (var p in points) {
    final coords = p.split(',');
    if (coords.length < 2) continue;

    final x = double.parse(coords[0].trim());
    final y = double.parse(coords[1].trim());

    if (x < minX) minX = x;
    if (y < minY) minY = y;
    if (x > maxX) maxX = x;
    if (y > maxY) maxY = y;
  }

  return Rect.fromLTRB(minX, minY, maxX, maxY);
}