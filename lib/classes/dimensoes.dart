class Dimensoes {
  final double? altura;
  final double? largura;
  final double? profundidade;

  Dimensoes({this.altura, this.largura, this.profundidade});

  Map<String, dynamic> toJson() {
    return {
      'altura': altura,
      'largura': largura,
      'profundidade': profundidade,
    };
  }

  factory Dimensoes.fromJson(Map<String, dynamic> json) {
    return Dimensoes(
      altura: (json['altura'] as num?)?.toDouble(),
      largura: (json['largura'] as num?)?.toDouble(),
      profundidade: (json['profundidade'] as num?)?.toDouble(),
    );
  }
}
