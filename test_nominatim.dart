import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  final lat = 28.6139;
  final lng = 77.2090;
  try {
    final url = Uri.parse('https://nominatim.openstreetmap.org/reverse?format=json&lat=$lat&lon=$lng&zoom=18&addressdetails=1');
    final response = await http.get(url, headers: {'User-Agent': 'FarmBridgeApp/1.0'});
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data['display_name']);
    } else {
      print('Failed: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
