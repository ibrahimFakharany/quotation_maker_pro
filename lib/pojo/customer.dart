class Customer {
  String id;
  String name;
  String companyCode;
  String companyName;
  String email;
  String mobile;

  Customer({
    required this.id,
    required this.name,
    required this.companyCode,
    required this.companyName,
    required this.email,
    required this.mobile,
  });

  Customer.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['_id'],
        companyCode = json['companyCode'],
        companyName = json['companyName'],
        email = json['email'],
        mobile = json['phone'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['companyCode'] = this.companyCode;
    data['companyName'] = this.companyName;
    data['email'] = this.email;
    data['phone'] = this.mobile;
    // data["addresses"] = List<String>.empty();
    return data;
  }
}


