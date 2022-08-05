class SigninModel {
  String? name;
  String? email;
  String? image;
  String language;
  String hearAbout;
  String chooseKnowledge;
  String chooseLevels;
  String age;

  SigninModel(
      {required this.name,
      required this.email,
      required this.image,
      required this.language,
      required this.hearAbout,
      required this.chooseKnowledge,
      required this.chooseLevels,
      required this.age});

  // SigninModel.fromJson(Map<String, dynamic> json) {
  //   name = json['name'];
  //   id = json['_id'];
  //   email = json['email'];
  //   language = json['languages'];
  //   image = json['image'];
  // }

  // List<String, Starin> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['email'] = email;
  //   data['name'] = name;
  //   data['languages'][0]['public_id'] = language;
  //   data['age'] = age;
  //   data['hearAbout'] = hearAbout;
  //   data['knowledge'] = chooseKnowledge;
  //   data['level'] = chooseLevels;
  //   data['image'] = image;
  //   return data;
  // }
}
