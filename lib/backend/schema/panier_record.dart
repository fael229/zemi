import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'panier_record.g.dart';

abstract class PanierRecord
    implements Built<PanierRecord, PanierRecordBuilder> {
  static Serializer<PanierRecord> get serializer => _$panierRecordSerializer;

  DocumentReference? get prodRef;

  int? get qty;

  String? get type;

  String? get client;

  DocumentReference? get ref;

  int? get mt;

  String? get jour;

  DateTime? get heure;

  String? get lieu;

  bool? get abo;

  String? get nom;

  String? get id;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(PanierRecordBuilder builder) => builder
    ..qty = 0
    ..type = ''
    ..client = ''
    ..mt = 0
    ..jour = ''
    ..lieu = ''
    ..abo = false
    ..nom = ''
    ..id = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('panier')
          : FirebaseFirestore.instance.collectionGroup('panier');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('panier').doc();

  static Stream<PanierRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PanierRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PanierRecord._();
  factory PanierRecord([void Function(PanierRecordBuilder) updates]) =
      _$PanierRecord;

  static PanierRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPanierRecordData({
  DocumentReference? prodRef,
  int? qty,
  String? type,
  String? client,
  DocumentReference? ref,
  int? mt,
  String? jour,
  DateTime? heure,
  String? lieu,
  bool? abo,
  String? nom,
  String? id,
}) {
  final firestoreData = serializers.toFirestore(
    PanierRecord.serializer,
    PanierRecord(
      (p) => p
        ..prodRef = prodRef
        ..qty = qty
        ..type = type
        ..client = client
        ..ref = ref
        ..mt = mt
        ..jour = jour
        ..heure = heure
        ..lieu = lieu
        ..abo = abo
        ..nom = nom
        ..id = id,
    ),
  );

  return firestoreData;
}
