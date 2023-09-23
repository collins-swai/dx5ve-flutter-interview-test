import 'package:dx5_interview/theme/app_style.dart';
import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> movie;

  MovieDetailsScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie['title'], style: AppStyle.txtInterBold24.copyWith(letterSpacing: 0.72),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Image.network(
            //     movie['poster_url'] != null &&
            //         movie['poster_url'].isNotEmpty
            //         ? Image.network(
            //       movie['poster_url'],
            //       fit: BoxFit.cover,
            //     )
            //         : Container()
            // ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Title: ${movie['title']}',
                    style: AppStyle.txtInterBold24,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Release Date: ${movie['release_date']}',
                    style: AppStyle.txtRobotoRegular20,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Overview: ${movie['overview']}',
                    style: AppStyle.txtRobotoRegular20,
                  ),
                  // Add more details as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
