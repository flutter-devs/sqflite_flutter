class Model {
  int id;
  String fruitName;
  String quantity;

  Model({this.id, this.fruitName, this.quantity});

  Model fromJson(json) {
    return Model(
        id: json['id'], fruitName: json['fruitName'], quantity: json['quantity']);
  }
  Map<String, dynamic> toJson() {
    return {'fruitName': fruitName, 'quantity': quantity};
  }

}
