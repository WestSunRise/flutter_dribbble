class ImagesModel {
  final String hidpi;
  final String normal;
  final String teaser;

  ImagesModel({
    this.hidpi,
    this.normal,
    this.teaser
  });

  factory ImagesModel.fromJson(Map<String, dynamic> json) {
    return new ImagesModel(
      hidpi: json['hidpi'],
      normal: json['normal'],
      teaser: json['teaser']
    );
  }
}