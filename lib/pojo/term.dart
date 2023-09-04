class Term {
  String id;
  String title;

  Term({
    required this.id,
    required this.title,
  });

  Term.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        title = json['title'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    return data;
  }
}
