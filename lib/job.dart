// model class for job object

import 'bullet.dart';

class Job
{
  int id;
  String title;
  String company;
  String location;
  String timerange;
  List<Bullet> bullets;

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'] as int,
      title: json['title'] as String,
      company: json['company'] as String,
      location: json['location'] as String,
      timerange: json['timerange'] as String,
      bullets: (json['bullets'] as List<dynamic>)
          .map((e) => Bullet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Job({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.timerange,
    required this.bullets
  });
}