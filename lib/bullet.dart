class Bullet
{
  String text;
  List<Bullet> subbullets;

  factory Bullet.fromJson(Map<String, dynamic> json) {
    return Bullet(
      text: json['text'] as String,
      subbullets: (json['subbullets'] as List<dynamic>)
          .map((e) => Bullet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Bullet({required this.text, required this.subbullets});
}