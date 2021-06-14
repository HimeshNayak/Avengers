import 'package:avengers/widgets/description.dart';
import 'package:flutter/material.dart';

class ProjectDescriptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project Name'),
      ),
      bottomNavigationBar: Container(
        child: Center(
          child: Text('Enroll & Pay'),
        ),
        width: 200.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: Colors.yellowAccent,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Description(heading: 'Project Description', text: 'something'),
            Description(heading: 'Technology requirements', text: 'something'),
            Description(heading: 'Timeline & Deadlines', text: 'something'),
            Description(heading: 'Enrollment', text: 'something'),
            Description(heading: 'Certifications', text: 'something'),
            Description(heading: 'Charges', text: 'something'),
          ],
        ),
      ),
    );
  }
}
