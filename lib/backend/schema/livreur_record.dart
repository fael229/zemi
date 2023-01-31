import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'livreur_record.g.dart';

abstract class LivreurRecord
    implements Built<LivreurRecord, LivreurRecordBuilder> {
  static Serializer<LivreurRecord> get serializer => _$livreurRecordSerializer;

  String? get nom;

  int? get tot;

  bool? get paye;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(LivreurRecordBuilder builder) => builder
    ..nom = ''
    ..tot = 0
    ..paye = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('livreur');

  static Stream<LivreurRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<LivreurRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  LivreurRecord._();
  factory LivreurRecord([void Function(LivreurRecordBuilder) updates]) =
      _$LivreurRecord;

  static LivreurRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createLivreurRecordData({
  String? nom,
  int? tot,
  bool? paye,
}) {
  final firestoreData = serializers.toFirestore(
    LivreurRecord.serializer,
    LivreurRecord(
      (l) => l
        ..nom = nom
        ..tot = tot
        ..paye = paye,
    ),
  );

  return firestoreData;
}
