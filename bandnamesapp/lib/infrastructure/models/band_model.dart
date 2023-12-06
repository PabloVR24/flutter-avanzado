class BandModel {
  final String id;
  final String name;
  final int votes;

  const BandModel({required this.id, required this.name, required this.votes});

  factory BandModel.fromJson(Map<String, dynamic> json) {
    return BandModel(id: json['id'] ?? 'no-id', name: json['name'] ?? 'no-name', votes: json['votes'] ?? 0);
  }
}
