import 'package:dx5_interview/presentation/movie_details.dart';
import 'package:dx5_interview/theme/app_style.dart';
import 'package:dx5_interview/theme/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> movies = [];
  bool isLoading = true;
  String errorMessage = 'Error';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<List<dynamic>> fetchData() async {
    final response =
        await http.get(Uri.parse('http://192.168.100.18:3000/api/movies'));
    // Replace your ip address to run on your emulator or pyshical device
    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  bool isValidImageUrl(String imageUrl) {
    // Check if imageUrl is not null or empty and contains a valid hostname
    return imageUrl != null && imageUrl.isNotEmpty && Uri.tryParse(imageUrl)?.hasAuthority == true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.gray50,
        title: Text(
          "Movie App",
          style: AppStyle.txtInterBold24.copyWith(letterSpacing: 0.72),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final data = snapshot.data;
            return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (BuildContext context, int index) {

                final movie = data![index];
                return GestureDetector(
                  onTap: () => _onCardTap(context, movie),
                  child: Card(
                    child: ListTile(
                      title: Text(movie['title']),
                      subtitle: Text('Release Date: ${movie['release_date']}'),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  void _onCardTap(BuildContext context, Map<String, dynamic> movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailsScreen(movie: movie),
      ),
    );
  }
}
