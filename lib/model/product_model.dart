class Product {
  final String pid;
  final String userId;
  final String pName;
  final double pPrice;
  final int pQty;
  final String? imageUrl;
  final DateTime createAt;

  Product({
    required this.pid,
    required this.userId,
    required this.pName,
    required this.pPrice,
    required this.pQty,
    this.imageUrl,
    required this.createAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      pid: json['pid'],
      userId: json['user_id'],
      pName: json['pname'],
      pPrice: (json['pprice'] as num).toDouble(),
      pQty: json['pqty'],
      imageUrl: json['imageurl'],
      createAt: DateTime.parse(json['create_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'pname': pName,
      'pprice': pPrice,
      'pqty': pQty,
      'imageurl': imageUrl,
    };
  }
}