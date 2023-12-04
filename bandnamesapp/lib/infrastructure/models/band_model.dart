class BandModel {
  final String id;
  final String name;
  final int votes;

  const BandModel({required this.id, required this.name, required this.votes});

  factory BandModel.fromJson(Map<String, dynamic> json) {
    return BandModel(id: json['id'], name: json['name'], votes: json['votes']);
  }
}
