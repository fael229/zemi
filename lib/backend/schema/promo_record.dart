import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'promo_record.g.dart';

abstract class PromoRecord implements Built<PromoRecord, PromoRecordBuilder> {
  static Serializer<PromoRecord> get serializer => _$promoRecordSerializer;

  String? get nom;

  String? get img;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PromoRecordBuilder builder) => builder
    ..nom = ''
    ..img = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('promo');

  static Stream<PromoRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PromoRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PromoRecord._();
  factory PromoRecord([void Function(PromoRecordBuilder) updates]) =
      _$PromoRecord;

  static PromoRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPromoRecordData({
  String? nom,
  String? img,
}) {
  final firestoreData = serializers.toFirestore(
    PromoRecord.serializer,
    PromoRecord(
      (p) => p
        ..nom = nom
        ..img = img,
    ),
  );

  return firestoreData;
}
