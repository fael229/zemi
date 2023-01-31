import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'fav_record.g.dart';

abstract class FavRecord implements Built<FavRecord, FavRecordBuilder> {
  static Serializer<FavRecord> get serializer => _$favRecordSerializer;

  DateTime? get date;

  DocumentReference? get ref;

  int? get qty;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(FavRecordBuilder builder) => builder..qty = 0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('fav')
          : FirebaseFirestore.instance.collectionGroup('fav');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('fav').doc();

  static Stream<FavRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FavRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FavRecord._();
  factory FavRecord([void Function(FavRecordBuilder) updates]) = _$FavRecord;

  static FavRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFavRecordData({
  DateTime? date,
  DocumentReference? ref,
  int? qty,
}) {
  final firestoreData = serializers.toFirestore(
    FavRecord.serializer,
    FavRecord(
      (f) => f
        ..date = date
        ..ref = ref
        ..qty = qty,
    ),
  );

  return firestoreData;
}
