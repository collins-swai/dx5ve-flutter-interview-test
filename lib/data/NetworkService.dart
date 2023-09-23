// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// Future<void> fetchData() async {
//   final response =
//       await http.get(Uri.parse('http://localhost:3000/api/movies'));
//   if (response.statusCode == 200) {
//     final data = json.decode(response.body);
//     setState(() {
//       movies = data;
//     });
//   } else {
//     throw Exception('Failed to load data');
//   }
// }
