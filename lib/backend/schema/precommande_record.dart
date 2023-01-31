import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'precommande_record.g.dart';

abstract class PrecommandeRecord
    implements Built<PrecommandeRecord, PrecommandeRecordBuilder> {
  static Serializer<PrecommandeRecord> get serializer =>
      _$precommandeRecordSerializer;

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

  bool? get aboLivre;

  LatLng? get positionClient;

  LatLng? get positionLivreur;

  String? get jour;

  LatLng? get lieu2;

  DocumentReference? get refride;

  BuiltList<LatLng>? get lan;

  BuiltList<DocumentReference>? get refcliList;

  String? get num;

  bool? get clienCoordonn;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PrecommandeRecordBuilder builder) => builder
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
    ..totalpaye = 0
    ..aboLivre = false
    ..jour = ''
    ..lan = ListBuilder()
    ..refcliList = ListBuilder()
    ..num = ''
    ..clienCoordonn = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('precommande');

  static Stream<PrecommandeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PrecommandeRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PrecommandeRecord._();
  factory PrecommandeRecord([void Function(PrecommandeRecordBuilder) updates]) =
      _$PrecommandeRecord;

  static PrecommandeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPrecommandeRecordData({
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
  bool? aboLivre,
  LatLng? positionClient,
  LatLng? positionLivreur,
  String? jour,
  LatLng? lieu2,
  DocumentReference? refride,
  String? num,
  bool? clienCoordonn,
}) {
  final firestoreData = serializers.toFirestore(
    PrecommandeRecord.serializer,
    PrecommandeRecord(
      (p) => p
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
        ..totalpaye = totalpaye
        ..aboLivre = aboLivre
        ..positionClient = positionClient
        ..positionLivreur = positionLivreur
        ..jour = jour
        ..lieu2 = lieu2
        ..refride = refride
        ..lan = null
        ..refcliList = null
        ..num = num
        ..clienCoordonn = clienCoordonn,
    ),
  );

  return firestoreData;
}
