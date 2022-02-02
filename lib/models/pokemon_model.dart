class PokemonEntity {
  int? id;
  String? num;
  String? name;
  String? img;
  List<String>? type;
  String? height;
  String? weight;
  List<String>? weaknesses;
  List<NextEvolution>? nextEvolution;
  bool? _isClicked;
  bool? _isPokemonReal;

  set isClicked(bool isClicked) {
    _isClicked = isClicked;
  }

  bool get isClicked {
    return _isClicked ?? false;
  }

  set isPokemonReal(bool isPokemonReal) {
    _isPokemonReal = isPokemonReal;
  }

  bool get isPokemonReal => _isPokemonReal ?? false;

  PokemonEntity(
      {this.id,
      this.num,
      this.name,
      this.img,
      this.type,
      this.height,
      this.weight,
      this.weaknesses,
      this.nextEvolution});

  PokemonEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    num = json['num'];
    name = json['name'];
    img = json['img'];
    type = json['type'].cast<String>();
    height = json['height'];
    weight = json['weight'];
    weaknesses = json['weaknesses'].cast<String>();
    if (json['next_evolution'] != null) {
      nextEvolution = <NextEvolution>[];
      json['next_evolution'].forEach((v) {
        nextEvolution!.add(NextEvolution.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['num'] = num;
    data['name'] = name;
    data['img'] = img;
    data['type'] = type;
    data['height'] = height;
    data['weight'] = weight;
    data['weaknesses'] = weaknesses;
    if (nextEvolution != null) {
      data['next_evolution'] = nextEvolution!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  String urlOfficialArt() =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
}

class NextEvolution {
  String? num;
  String? name;

  NextEvolution({this.num, this.name});

  NextEvolution.fromJson(Map<String, dynamic> json) {
    num = json['num'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num'] = num;
    data['name'] = name;
    return data;
  }
}
