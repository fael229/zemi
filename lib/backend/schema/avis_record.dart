import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'avis_record.g.dart';

abstract class AvisRecord implements Built<AvisRecord, AvisRecordBuilder> {
  static Serializer<AvisRecord> get serializer => _$avisRecordSerializer;

  String? get pp;

  String? get comment;

  String? get nom;

  DateTime? get date;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(AvisRecordBuilder builder) => builder
    ..pp = ''
    ..comment = ''
    ..nom = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('avis')
          : FirebaseFirestore.instance.collectionGroup('avis');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('avis').doc();

  static Stream<AvisRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AvisRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AvisRecord._();
  factory AvisRecord([void Function(AvisRecordBuilder) updates]) = _$AvisRecord;

  static AvisRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAvisRecordData({
  String? pp,
  String? comment,
  String? nom,
  DateTime? date,
}) {
  final firestoreData = serializers.toFirestore(
    AvisRecord.serializer,
    AvisRecord(
      (a) => a
        ..pp = pp
        ..comment = comment
        ..nom = nom
        ..date = date,
    ),
  );

  return firestoreData;
}
