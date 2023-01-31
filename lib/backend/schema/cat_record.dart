import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'cat_record.g.dart';

abstract class CatRecord implements Built<CatRecord, CatRecordBuilder> {
  static Serializer<CatRecord> get serializer => _$catRecordSerializer;

  String? get nom;

  String? get img;

  int? get nbr;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CatRecordBuilder builder) => builder
    ..nom = ''
    ..img = ''
    ..nbr = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cat');

  static Stream<CatRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CatRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CatRecord._();
  factory CatRecord([void Function(CatRecordBuilder) updates]) = _$CatRecord;

  static CatRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCatRecordData({
  String? nom,
  String? img,
  int? nbr,
}) {
  final firestoreData = serializers.toFirestore(
    CatRecord.serializer,
    CatRecord(
      (c) => c
        ..nom = nom
        ..img = img
        ..nbr = nbr,
    ),
  );

  return firestoreData;
}
