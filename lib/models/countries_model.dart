class CountriesModel {
  final int confirmed;
  final int recovered;
  final int deaths;
  final String lastUpdate;

  CountriesModel({
    this.confirmed,
    this.recovered,
    this.deaths,
    this.lastUpdate,
  });

  factory CountriesModel.fromJson(Map<String, dynamic> json) {
    return CountriesModel(
      confirmed: json['confirmed']['value'] as int ,
      recovered: json['recovered']['value'] as int ,
      deaths: json['deaths']['value'] as int,
      lastUpdate: json['lastUpdate'] ,
    );
  }
}
