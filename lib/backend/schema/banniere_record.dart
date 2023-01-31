import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'banniere_record.g.dart';

abstract class BanniereRecord
    implements Built<BanniereRecord, BanniereRecordBuilder> {
  static Serializer<BanniereRecord> get serializer =>
      _$banniereRecordSerializer;

  String? get img;

  int? get priorite;

  DocumentReference? get lien;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(BanniereRecordBuilder builder) => builder
    ..img = ''
    ..priorite = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('banniere');

  static Stream<BanniereRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<BanniereRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  BanniereRecord._();
  factory BanniereRecord([void Function(BanniereRecordBuilder) updates]) =
      _$BanniereRecord;

  static BanniereRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createBanniereRecordData({
  String? img,
  int? priorite,
  DocumentReference? lien,
}) {
  final firestoreData = serializers.toFirestore(
    BanniereRecord.serializer,
    BanniereRecord(
      (b) => b
        ..img = img
        ..priorite = priorite
        ..lien = lien,
    ),
  );

  return firestoreData;
}
