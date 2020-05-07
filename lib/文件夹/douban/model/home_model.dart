//class MovieList {
//  String title;
//  Rating rating;
//  Genres genres;
//  List<Casts> casts;
//  String durations;
//  bool has_Video;
//  Directors directors;
//  Images images;
//}
//
//class Rating {
//  double average;
//  String stars;
//  int max;
//  int min;
//}
//
//class Genres {}
//
//class Casts {
//  String name;
//  String name_en;
//  String alt;
//  String id;
//  Avators avators;
//}
//
//class Avators {
//
//  String small;
//  String large;
//  String medium;
//}
//
//
//
//class Directors {
//  String name;
//  String name_en;
//  Avators avators;
//}
//
//class Images {
//  String small;
//  String large;
//  String medium;
//}
//
//List<MovieList> fromJSONData(List list) {
//  List<MovieList> movieLists = [];
//
//  for (var sub in list) {
//    MovieList movieList = MovieList();
//    movieList.title = sub["title"];
//    movieList.images.small = sub["images"]["small"];
//    movieList.images.large = sub["images"]["large"];
//    movieList.images.medium = sub["images"]["medium"];
//    movieList.directors.name = (sub["directors"] as List).first["name"];
//    movieList.directors.name_en = (sub["directors"] as List).first["name_en"];
//    movieList.directors.avators.small =
//        (sub["directors"] as List).first["avator"]["snamll"];
//    movieList.directors.avators.large =
//        (sub["directors"] as List).first["avator"]["large"];
//    movieList.directors.avators.medium =
//        (sub["directors"] as List).first["avator"]["medium"];
//    movieList.rating.average = sub["rating"]["average"];
//    movieList.rating.max = sub["rating"]["max"];
//    movieList.rating.min = sub["rating"]["min"];
//    movieList.durations = (sub["durations"] as List).first;
//
//    for(var subject in sub["casts"]){
//      Casts casts = Casts();
//      casts.name = subject["name"];
//      casts.name_en = subject["name_en"];
//      casts.avators.large = subject["avator"]["large"];
//      casts.avators.small = subject["avator"]["small"];
//      casts.avators.medium = subject["avator"]["medium"];
//      movieList.casts.add(casts);
//    }
//    movieLists.add(movieList);
//  }
//
//  return movieLists;
//}
class Person {
  String name;
  String avatarURL;

  Person.fromMap(Map<String, dynamic> json) {
    this.name = json["name"];
    this.avatarURL = json["avatars"]["medium"];
  }
}

class Actor extends Person {
  Actor.fromMap(Map<String, dynamic> json): super.fromMap(json);
}

class Director extends Person {
  Director.fromMap(Map<String, dynamic> json): super.fromMap(json);
}

int counter = 1;

class MovieItem {
  int rank;
  String imageURL;
  String title;
  String playDate;
  double rating;
  List<String> genres;
  List<Actor> casts;
  Director director;
  String originalTitle;

  MovieItem.fromMap(Map<String, dynamic> json) {
    this.rank = counter++;
    this.imageURL = json["images"]["medium"];
    this.title = json["title"];
    this.playDate = json["year"];
    this.rating = json["rating"]["average"];
    this.genres = json["genres"].cast<String>();
    this.casts = (json["casts"] as List<dynamic>).map((item) {
      return Actor.fromMap(item);
    }).toList();
    this.director = Director.fromMap(json["directors"][0]);
    this.originalTitle = json["original_title"];
  }
}