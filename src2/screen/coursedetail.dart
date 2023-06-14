import 'package:flutter/material.dart';

class CoursedetailsScreen extends StatelessWidget {
  final String courseTitle;

  // ignore: use_key_in_widget_constructors
  const CoursedetailsScreen({required this.courseTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(courseTitle),
      ),
      body: const Center(
        child: Text('Course Details'),
      ),
    );
  }
}
