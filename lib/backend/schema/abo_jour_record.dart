import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'abo_jour_record.g.dart';

abstract class AboJourRecord
    implements Built<AboJourRecord, AboJourRecordBuilder> {
  static Serializer<AboJourRecord> get serializer => _$aboJourRecordSerializer;

  BuiltList<DocumentReference>? get listecom;

  DocumentReference? get refcli;

  DateTime? get date;

  String? get nom;

  String? get statut;

  bool? get livrer;

  DateTime? get dateAjout;

  DateTime? get datepay;

  String? get lieu;

  DocumentReference? get livreur;

  bool? get e1;

  bool? get e2;

  bool? get e3;

  bool? get e4;

  bool? get e5;

  String? get numero;

  String? get indication;

  bool? get attribution;

  String? get signature;

  DocumentReference? get commandeSuiviRef;

  DateTime? get heurelivre;

  int? get soustot;

  int? get totalpaye;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(AboJourRecordBuilder builder) => builder
    ..listecom = ListBuilder()
    ..nom = ''
    ..statut = ''
    ..livrer = false
    ..lieu = ''
    ..e1 = false
    ..e2 = false
    ..e3 = false
    ..e4 = false
    ..e5 = false
    ..numero = ''
    ..indication = ''
    ..attribution = false
    ..signature = ''
    ..soustot = 0
    ..totalpaye = 0;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('aboJour')
          : FirebaseFirestore.instance.collectionGroup('aboJour');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('aboJour').doc();

  static Stream<AboJourRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AboJourRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AboJourRecord._();
  factory AboJourRecord([void Function(AboJourRecordBuilder) updates]) =
      _$AboJourRecord;

  static AboJourRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAboJourRecordData({
  DocumentReference? refcli,
  DateTime? date,
  String? nom,
  String? statut,
  bool? livrer,
  DateTime? dateAjout,
  DateTime? datepay,
  String? lieu,
  DocumentReference? livreur,
  bool? e1,
  bool? e2,
  bool? e3,
  bool? e4,
  bool? e5,
  String? numero,
  String? indication,
  bool? attribution,
  String? signature,
  DocumentReference? commandeSuiviRef,
  DateTime? heurelivre,
  int? soustot,
  int? totalpaye,
}) {
  final firestoreData = serializers.toFirestore(
    AboJourRecord.serializer,
    AboJourRecord(
      (a) => a
        ..listecom = null
        ..refcli = refcli
        ..date = date
        ..nom = nom
        ..statut = statut
        ..livrer = livrer
        ..dateAjout = dateAjout
        ..datepay = datepay
        ..lieu = lieu
        ..livreur = livreur
        ..e1 = e1
        ..e2 = e2
        ..e3 = e3
        ..e4 = e4
        ..e5 = e5
        ..numero = numero
        ..indication = indication
        ..attribution = attribution
        ..signature = signature
        ..commandeSuiviRef = commandeSuiviRef
        ..heurelivre = heurelivre
        ..soustot = soustot
        ..totalpaye = totalpaye,
    ),
  );

  return firestoreData;
}
