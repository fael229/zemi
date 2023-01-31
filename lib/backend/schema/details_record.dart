import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'details_record.g.dart';

abstract class DetailsRecord
    implements Built<DetailsRecord, DetailsRecordBuilder> {
  static Serializer<DetailsRecord> get serializer => _$detailsRecordSerializer;

  String? get nom;

  String? get img;

  int? get nbr;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(DetailsRecordBuilder builder) => builder
    ..nom = ''
    ..img = ''
    ..nbr = 0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Details')
          : FirebaseFirestore.instance.collectionGroup('Details');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Details').doc();

  static Stream<DetailsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<DetailsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  DetailsRecord._();
  factory DetailsRecord([void Function(DetailsRecordBuilder) updates]) =
      _$DetailsRecord;

  static DetailsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createDetailsRecordData({
  String? nom,
  String? img,
  int? nbr,
}) {
  final firestoreData = serializers.toFirestore(
    DetailsRecord.serializer,
    DetailsRecord(
      (d) => d
        ..nom = nom
        ..img = img
        ..nbr = nbr,
    ),
  );

  return firestoreData;
}
