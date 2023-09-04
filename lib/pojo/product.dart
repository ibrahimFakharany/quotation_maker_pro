class Product {
  String id;
  String brand;
  String width;
  String ratio;
  String rimSize;
  String speedRating;
  String loadRating;
  String unitCost;
  int? count = 0;

  String get tyreSpecs {
    return "${brand}\n${rimSize} ${speedRating} (${loadRating}) ${width}/${ratio}";
  }

  Product({
    required this.id,
    required this.brand,
    required this.width,
    required this.ratio,
    required this.rimSize,
    required this.speedRating,
    required this.loadRating,
    required this.unitCost,
    this.count,
  });

  Product.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        brand = json['brand'],
        width = json['width'],
        ratio = json['ratio'],
        rimSize = json['rimSize'],
        speedRating = json['speedRating'],
        unitCost = json['unitCost'],
        loadRating = json['loadRating'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand'] = this.brand;
    data['width'] = this.width;
    data['ratio'] = this.ratio;
    data['rimSize'] = this.rimSize;
    data['speedRating'] = this.speedRating;
    data['unitCost'] = this.unitCost;
    data['loadRating'] = this.loadRating;
    return data;
  }
}
