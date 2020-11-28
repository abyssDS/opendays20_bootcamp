import 'dart:convert';

class ActivityModel {
  String image;
  EntrepriseModel entreprise;
  String postName;
  String postNote;
  String nbVues;

  ActivityModel(
      {this.image, this.entreprise, this.postName, this.postNote, this.nbVues});

  factory ActivityModel.fromJSON(Map<String, dynamic> jsonModel) {
    EntrepriseModel _model = EntrepriseModel(
        name: jsonModel["entreprise"]["name"],
        image: jsonModel["entreprise"]["image"]);

    return ActivityModel(
        image: jsonModel["image"],
        entreprise: _model,
        postName: jsonModel["postName"],
        postNote: jsonModel["postNote"],
        nbVues: jsonModel["nbVues"]);
  }

  Map<String, dynamic> toJSON() {
    return {
      "image": "image",
      "entreprise": entreprise.toJSON(),
      "postName": postName,
      "postNote": "postNote",
      "nbVues": "nbVues"
    };
  }

  Map<String, String> toBodyJSON() {
    return {
      "image": "image",
      "entreprise": json.encode(entreprise.toJSON()),
      "postName": postName,
      "postNote": "postNote",
      "nbVues": "nbVues"
    };
  }
}

class EntrepriseModel {
  String name;
  String image;

  EntrepriseModel({this.name, this.image});

  factory EntrepriseModel.fromJSON(Map<String, dynamic> json) {
    return EntrepriseModel(name: json["name"], image: json["image"]);
  }

  Map<String, dynamic> toJSON() {
    return {"name": name, "image": ""};
  }
}
