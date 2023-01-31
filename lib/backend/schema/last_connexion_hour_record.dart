import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'last_connexion_hour_record.g.dart';

abstract class LastConnexionHourRecord
    implements Built<LastConnexionHourRecord, LastConnexionHourRecordBuilder> {
  static Serializer<LastConnexionHourRecord> get serializer =>
      _$lastConnexionHourRecordSerializer;

  DateTime? get last;

  String? get name;

  String? get email;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(LastConnexionHourRecordBuilder builder) =>
      builder
        ..name = ''
        ..email = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lastConnexionHour');

  static Stream<LastConnexionHourRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<LastConnexionHourRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  LastConnexionHourRecord._();
  factory LastConnexionHourRecord(
          [void Function(LastConnexionHourRecordBuilder) updates]) =
      _$LastConnexionHourRecord;

  static LastConnexionHourRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createLastConnexionHourRecordData({
  DateTime? last,
  String? name,
  String? email,
}) {
  final firestoreData = serializers.toFirestore(
    LastConnexionHourRecord.serializer,
    LastConnexionHourRecord(
      (l) => l
        ..last = last
        ..name = name
        ..email = email,
    ),
  );

  return firestoreData;
}
