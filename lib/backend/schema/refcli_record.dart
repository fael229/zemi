import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'refcli_record.g.dart';

abstract class RefcliRecord
    implements Built<RefcliRecord, RefcliRecordBuilder> {
  static Serializer<RefcliRecord> get serializer => _$refcliRecordSerializer;

  LatLng? get lan;

  String? get num;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(RefcliRecordBuilder builder) =>
      builder..num = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('refcli')
          : FirebaseFirestore.instance.collectionGroup('refcli');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('refcli').doc();

  static Stream<RefcliRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RefcliRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RefcliRecord._();
  factory RefcliRecord([void Function(RefcliRecordBuilder) updates]) =
      _$RefcliRecord;

  static RefcliRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRefcliRecordData({
  LatLng? lan,
  String? num,
}) {
  final firestoreData = serializers.toFirestore(
    RefcliRecord.serializer,
    RefcliRecord(
      (r) => r
        ..lan = lan
        ..num = num,
    ),
  );

  return firestoreData;
}
