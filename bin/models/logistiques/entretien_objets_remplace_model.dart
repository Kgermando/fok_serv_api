class ObjetsRemplace {
  final String nomObjet;
  final String cout;
  final String caracteristique;
  final String observation;

  ObjetsRemplace(
      {required this.nomObjet,
      required this.cout,
      required this.caracteristique,
      required this.observation});

  factory ObjetsRemplace.fromJson(Map<String, dynamic> json) {
    return ObjetsRemplace(
        nomObjet: json['nomObjet'],
        cout: json['cout'],
        caracteristique: json['caracteristique'],
        observation: json['observation']);
  }
}
