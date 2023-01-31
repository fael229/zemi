import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'paiement_rapp_record.g.dart';

abstract class PaiementRappRecord
    implements Built<PaiementRappRecord, PaiementRappRecordBuilder> {
  static Serializer<PaiementRappRecord> get serializer =>
      _$paiementRappRecordSerializer;

  String? get prenom;

  String? get nom;

  String? get nomProduit;

  double? get montant;

  String? get email;

  String? get tel;

  String? get reseau;

  DateTime? get time;

  String? get lien;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PaiementRappRecordBuilder builder) => builder
    ..prenom = ''
    ..nom = ''
    ..nomProduit = ''
    ..montant = 0.0
    ..email = ''
    ..tel = ''
    ..reseau = ''
    ..lien = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PaiementRapp');

  static Stream<PaiementRappRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PaiementRappRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PaiementRappRecord._();
  factory PaiementRappRecord(
          [void Function(PaiementRappRecordBuilder) updates]) =
      _$PaiementRappRecord;

  static PaiementRappRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPaiementRappRecordData({
  String? prenom,
  String? nom,
  String? nomProduit,
  double? montant,
  String? email,
  String? tel,
  String? reseau,
  DateTime? time,
  String? lien,
}) {
  final firestoreData = serializers.toFirestore(
    PaiementRappRecord.serializer,
    PaiementRappRecord(
      (p) => p
        ..prenom = prenom
        ..nom = nom
        ..nomProduit = nomProduit
        ..montant = montant
        ..email = email
        ..tel = tel
        ..reseau = reseau
        ..time = time
        ..lien = lien,
    ),
  );

  return firestoreData;
}
