class MovieModel {
  int? id;
  late String movieName;
  late int ticketQuantity;
  late String time;
  late int price;

  MovieModel({
    this.id,
    required this.movieName,
    required this.ticketQuantity,
    required this.time,
    required this.price,
  });

  factory MovieModel.fromMap(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        movieName: json["name"],
        ticketQuantity: json["address"],
        time: json["gender"],
        price: json["education"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": movieName,
        "address": ticketQuantity,
        "gender": time,
        "education": price,
      };
}
