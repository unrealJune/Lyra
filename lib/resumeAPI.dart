import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:urgh/contact.dart';
import 'package:urgh/job.dart';
import 'package:http/http.dart' as http;

class resumeAPI {
  static const String jobsEndpoint = "/jobs";

  String apiAddrBase (){
    if(kDebugMode){
      return "http://localhost:5000";
    } else {
      return "https://api.junephilip.com";
    }
  }

  Future<String> getAboutAsync() async {
    //make request
    var url = Uri.parse(apiAddrBase() + "/about");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      //parse response
      return response.body;
    } else {
      throw Exception('Failed to load about');
    }
  }

  Future<Contact> getContactAsync() async {
    //make request
    var url = Uri.parse(apiAddrBase() + "/contact");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      //parse response
      var jsonResponse = response.body;
      return Contact.fromJson(json.decode(jsonResponse));
    } else {
      throw Exception('Failed to load contact');
    }
  }

  Future<List<Job>> getJobsAsync() async{
    //make request
    var url = Uri.parse(apiAddrBase() + jobsEndpoint);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      //parse response
      List<Job> jobs = [];
      var jsonResponse = response.body;

      //convert to list of jobs
      Iterable l = json.decode(response.body);
      for (var job in l) {
        debugPrint("Processing: " + job.toString());
        jobs.add(Job.fromJson(job as Map<String, dynamic>));
      }

      return jobs;
    } else {
      throw Exception('Failed to load jobs');
    }
  }

  // create request

}