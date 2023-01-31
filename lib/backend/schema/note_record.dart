import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'note_record.g.dart';

abstract class NoteRecord implements Built<NoteRecord, NoteRecordBuilder> {
  static Serializer<NoteRecord> get serializer => _$noteRecordSerializer;

  DocumentReference? get prodRef;

  double? get rate;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(NoteRecordBuilder builder) =>
      builder..rate = 0.0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('note')
          : FirebaseFirestore.instance.collectionGroup('note');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('note').doc();

  static Stream<NoteRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<NoteRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  NoteRecord._();
  factory NoteRecord([void Function(NoteRecordBuilder) updates]) = _$NoteRecord;

  static NoteRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createNoteRecordData({
  DocumentReference? prodRef,
  double? rate,
}) {
  final firestoreData = serializers.toFirestore(
    NoteRecord.serializer,
    NoteRecord(
      (n) => n
        ..prodRef = prodRef
        ..rate = rate,
    ),
  );

  return firestoreData;
}
