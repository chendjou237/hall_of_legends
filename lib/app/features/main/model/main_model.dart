// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MainModel {
  // TODO: add your model here
  String noms;
  String profession;
  DateTime dateDeNaissance;
  DateTime dateDeDeces;
  String bioGraphie;
  String soumisPar;
  DateTime dateEnregistrement;
  String lienAvecLeCandidat;
  String pays;
  String numeroDeTelephone;
  String email;
  MainModel({
    required this.noms,
    required this.profession,
    required this.dateDeNaissance,
    required this.dateDeDeces,
    required this.bioGraphie,
    required this.soumisPar,
    required this.dateEnregistrement,
    required this.lienAvecLeCandidat,
    required this.pays,
    required this.numeroDeTelephone,
    required this.email,
  });

  MainModel copyWith({
    String? noms,
    String? profession,
    DateTime? dateDeNaissance,
    DateTime? dateDeDeces,
    String? bioGraphie,
    String? soumisPar,
    DateTime? dateEnregistrement,
    String? lienAvecLeCandidat,
    String? pays,
    String? numeroDeTelephone,
    String? email,
  }) {
    return MainModel(
      noms: noms ?? this.noms,
      profession: profession ?? this.profession,
      dateDeNaissance: dateDeNaissance ?? this.dateDeNaissance,
      dateDeDeces: dateDeDeces ?? this.dateDeDeces,
      bioGraphie: bioGraphie ?? this.bioGraphie,
      soumisPar: soumisPar ?? this.soumisPar,
      dateEnregistrement: dateEnregistrement ?? this.dateEnregistrement,
      lienAvecLeCandidat: lienAvecLeCandidat ?? this.lienAvecLeCandidat,
      pays: pays ?? this.pays,
      numeroDeTelephone: numeroDeTelephone ?? this.numeroDeTelephone,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'noms': noms,
      'profession': profession,
      'dateDeNaissance': dateDeNaissance.millisecondsSinceEpoch,
      'dateDeDeces': dateDeDeces.millisecondsSinceEpoch,
      'bioGraphie': bioGraphie,
      'soumisPar': soumisPar,
      'dateEnregistrement': dateEnregistrement.millisecondsSinceEpoch,
      'lienAvecLeCandidat': lienAvecLeCandidat,
      'pays': pays,
      'numeroDeTelephone': numeroDeTelephone,
      'email': email,
    };
  }

  factory MainModel.fromMap(Map<String, dynamic> map) {
    return MainModel(
      noms: map['noms'] as String,
      profession: map['profession'] as String,
      dateDeNaissance: DateTime.fromMillisecondsSinceEpoch(map['dateDeNaissance'] as int),
      dateDeDeces: DateTime.fromMillisecondsSinceEpoch(map['dateDeDeces'] as int),
      bioGraphie: map['bioGraphie'] as String,
      soumisPar: map['soumisPar'] as String,
      dateEnregistrement: DateTime.fromMillisecondsSinceEpoch(map['dateEnregistrement'] as int),
      lienAvecLeCandidat: map['lienAvecLeCandidat'] as String,
      pays: map['pays'] as String,
      numeroDeTelephone: map['numeroDeTelephone'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MainModel.fromJson(String source) => MainModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MainModel(noms: $noms, profession: $profession, dateDeNaissance: $dateDeNaissance, dateDeDeces: $dateDeDeces, bioGraphie: $bioGraphie, soumisPar: $soumisPar, dateEnregistrement: $dateEnregistrement, lienAvecLeCandidat: $lienAvecLeCandidat, pays: $pays, numeroDeTelephone: $numeroDeTelephone, email: $email)';
  }

  @override
  bool operator ==(covariant MainModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.noms == noms &&
      other.profession == profession &&
      other.dateDeNaissance == dateDeNaissance &&
      other.dateDeDeces == dateDeDeces &&
      other.bioGraphie == bioGraphie &&
      other.soumisPar == soumisPar &&
      other.dateEnregistrement == dateEnregistrement &&
      other.lienAvecLeCandidat == lienAvecLeCandidat &&
      other.pays == pays &&
      other.numeroDeTelephone == numeroDeTelephone &&
      other.email == email;
  }

  @override
  int get hashCode {
    return noms.hashCode ^
      profession.hashCode ^
      dateDeNaissance.hashCode ^
      dateDeDeces.hashCode ^
      bioGraphie.hashCode ^
      soumisPar.hashCode ^
      dateEnregistrement.hashCode ^
      lienAvecLeCandidat.hashCode ^
      pays.hashCode ^
      numeroDeTelephone.hashCode ^
      email.hashCode;
  }
}
