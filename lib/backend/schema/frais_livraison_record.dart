import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'frais_livraison_record.g.dart';

abstract class FraisLivraisonRecord
    implements Built<FraisLivraisonRecord, FraisLivraisonRecordBuilder> {
  static Serializer<FraisLivraisonRecord> get serializer =>
      _$fraisLivraisonRecordSerializer;

  int? get nom;

  int? get abonnement;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FraisLivraisonRecordBuilder builder) => builder
    ..nom = 0
    ..abonnement = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('fraisLivraison');

  static Stream<FraisLivraisonRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FraisLivraisonRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FraisLivraisonRecord._();
  factory FraisLivraisonRecord(
          [void Function(FraisLivraisonRecordBuilder) updates]) =
      _$FraisLivraisonRecord;

  static FraisLivraisonRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFraisLivraisonRecordData({
  int? nom,
  int? abonnement,
}) {
  final firestoreData = serializers.toFirestore(
    FraisLivraisonRecord.serializer,
    FraisLivraisonRecord(
      (f) => f
        ..nom = nom
        ..abonnement = abonnement,
    ),
  );

  return firestoreData;
}
