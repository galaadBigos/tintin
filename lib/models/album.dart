class Album {
  Album({required this.title, required this.number, required this.year, this.yearInColor, this.image, this.resume, this.isFavorite = false});
  String title;
  int number;
  int year;
  int? yearInColor;
  String? image;
  String? resume;
  bool isFavorite;

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      title: json['titre'] as String,
      number: json['numero'] as int, 
      year: json['parution'] as int,
      yearInColor: json['parutionEnCouleur'] != null ? json['yearInColor'] as int? : null,
      image: json['image'] != null ? 'images/${json['image']}' as String? : null,
      resume: json['resume'] != null ? json['resume'] as String? : null,);
  }

  @override
    String toString() {
          return 'Titre : $title\n'
            'Numéro : $number\n'
            'Année : $year\n'
            'Année en couleur : ${yearInColor ?? 'N/A'}\n'
            'Image : ${image ?? 'N/A'}\n'
            'Résumé : ${resume ?? 'N/A'}';
    }

    String toJson() {
    return '''
    {
      "title": "$title",
      "number": $number,
      "year": $year,
      "yearInColor": ${yearInColor != null ? '$yearInColor' : 'null'},
      "image": ${image != null ? '"$image"' : 'null'},
      "resume": ${resume != null ? '"$resume"' : 'null'}
    }
    ''';
  }
}