/// adult : false
/// backdrop_path : "/7h6TqPB3ESmjuVbxCxAeB1c9OB1.jpg"
/// genre_ids : [27,878,35]
/// id : 933260
/// original_language : "en"
/// original_title : "The Substance"
/// overview : "A fading celebrity decides to use a black market drug, a cell-replicating substance that temporarily creates a younger, better version of herself."
/// popularity : 1233.556
/// poster_path : "/lqoMzCcZYEFK729d6qzt349fB4o.jpg"
/// release_date : "2024-09-07"
/// title : "The Substance"
/// video : false
/// vote_average : 7.215
/// vote_count : 165

class Movie {
  Movie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  Movie.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  bool? adult;
  String? backdropPath;
  List<num>? genreIds;
  num? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  num? voteAverage;
  num? voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

  Movie.fromFirestore(Map<String, dynamic>? data)
  :this(
      adult : data?['adult'],
      backdropPath : data?['backdrop_path'],
      genreIds : data?['genre_ids'] != null ? (data?['genre_ids'].cast<num>()) : [],
      id : data?['id'],
      originalLanguage : data?['original_language'],
      originalTitle : data?['original_title'],
      overview : data?['overview'],
      popularity : data?['popularity'],
      posterPath : data?['poster_path'],
      releaseDate : data?['release_date'],
      title : data?['title'],
      video : data?['video'],
      voteAverage : data?['vote_average'],
      voteCount : data?['vote_count'],

  );

  Map<String, dynamic> toFirestore() {
    final map = <String, dynamic>{};

    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }
}
