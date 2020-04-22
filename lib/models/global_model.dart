class GlobalModel {
  final int confirmed;
  final int recovered;
  final int deaths;
  final String lastUpdate;

  GlobalModel({
    this.confirmed,
    this.recovered,
    this.deaths,
    this.lastUpdate,
  });

  factory GlobalModel.fromJson(Map<String, dynamic> json) {
    return GlobalModel(
      confirmed: json['confirmed']['value'] as int ,
      recovered: json['recovered']['value'] as int ,
      deaths: json['deaths']['value'] as int,
      lastUpdate: json['lastUpdate'] ,
    );
  }
}
