class Movie {
  int id;
  String titulo;
  String tituloOriginal;
  String estreia;
  int duracao;
  String descricao;
  String diretor;
  String image;
  List<String> produtoras;
  List<String> categorias;
  List<String> elenco;
  double media;
  int orcamento;

  Movie({
    required this.id,
    required this.titulo,
    required this.tituloOriginal,
    required this.estreia,
    required this.duracao,
    required this.descricao,
    required this.image,
    required this.produtoras,
    required this.diretor,
    required this.categorias,
    required this.elenco,
    required this.media,
    required this.orcamento,
  });

  // factory Movie.fromJson(Map<String, dynamic> json) {
  //   return Movie(
  //     id: json['id'],
  //     titulo: json['title'],
  //     tituloOriginal: json['original_title'],
  //     estreia: json['release_date'],
  //     duracao: 'naosei', //json[''],
  //     descricao: json['overview'],
  //     produtoras: [],
  //     diretor: 'naosei',
  //     categorias: json['genre_ids'],
  //     elenco: ['naosei'],
  //     media: json['vote_average'],
  //     orcamento: 0,
  //   );
  // }

  factory Movie.fromJson(
      Map<String, dynamic> decodedDetails, Map<String, dynamic> decodedCast) {
    List<dynamic> productionCompanies =
        decodedDetails['production_companies'] as List;
    List<dynamic> crew = decodedCast['crew'] as List;
    String director =
        crew.firstWhere((element) => element['job'] == "Director")['name'];
    List<dynamic> wholeCast = decodedCast['cast'] as List;
    List<String> cast = wholeCast.map((e) => e['name'] as String).toList();
    List<dynamic> wholeCategory = decodedDetails['genres'] as List;

    return Movie(
        id: decodedDetails['id'],
        titulo: decodedDetails['title'],
        tituloOriginal: decodedDetails['original_title'],
        estreia: decodedDetails['release_date'],
        duracao: decodedDetails['runtime'],
        descricao: decodedDetails['overview'],
        image:
            'https://image.tmdb.org/t/p/w500${decodedDetails['poster_path']}',
        produtoras:
            productionCompanies.map((e) => e['name'] as String).toList(),
        diretor: director,
        categorias: wholeCategory.map((e) => e['name'] as String).toList(),
        elenco: cast,
        media: decodedDetails['vote_average'],
        orcamento: decodedDetails['budget']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': titulo,
        'original_title': tituloOriginal,
        'release_date': estreia,
        // 'length': duracao,
        'overview': descricao,
        // 'producers': produtoras,
        // 'director': diretor,
        'genre_ids': categorias,
        // 'casting': elenco,
        'vote_average': media,
        // 'budget': orcamento
      };
}
