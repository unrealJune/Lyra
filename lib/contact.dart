class Contact
{
  String? email;
  String? location;
  String? webLink1;
  String? webLink2;

  Contact({this.email, this.location, this.webLink1, this.webLink2});

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      email: json['email'] as String?,
      location: json['location'] as String?,
      webLink1: json['weblink1'] as String?,
      webLink2: json['weblink2'] as String?,
    );
  }
}