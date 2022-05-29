class DevisListObjetsModel {
  late int? id;
  late String nombre;
  late String description;
  late String frais;

  DevisListObjetsModel({
    this.id,
    required this.nombre,
    required this.description,
    required this.frais,
  });

  factory DevisListObjetsModel.fromJson(Map<String, dynamic> json) {
    return DevisListObjetsModel(
      id: json['id'],
      nombre: json['nombre'],
      description: json['description'],
      frais: json['frais'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'description': description,
      'frais': frais,
    };
  }
}
