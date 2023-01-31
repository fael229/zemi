import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'favoris_record.g.dart';

abstract class FavorisRecord
    implements Built<FavorisRecord, FavorisRecordBuilder> {
  static Serializer<FavorisRecord> get serializer => _$favorisRecordSerializer;

  String? get nom;

  String? get image;

  int? get prix;

  String? get cat;

  String? get variab;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(FavorisRecordBuilder builder) => builder
    ..nom = ''
    ..image = ''
    ..prix = 0
    ..cat = ''
    ..variab = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('favoris');

  static Stream<FavorisRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<FavorisRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  FavorisRecord._();
  factory FavorisRecord([void Function(FavorisRecordBuilder) updates]) =
      _$FavorisRecord;

  static FavorisRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createFavorisRecordData({
  String? nom,
  String? image,
  int? prix,
  String? cat,
  String? variab,
}) {
  final firestoreData = serializers.toFirestore(
    FavorisRecord.serializer,
    FavorisRecord(
      (f) => f
        ..nom = nom
        ..image = image
        ..prix = prix
        ..cat = cat
        ..variab = variab,
    ),
  );

  return firestoreData;
}
