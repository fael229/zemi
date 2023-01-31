import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'commandes_record.g.dart';

abstract class CommandesRecord
    implements Built<CommandesRecord, CommandesRecordBuilder> {
  static Serializer<CommandesRecord> get serializer =>
      _$commandesRecordSerializer;

  String? get nom;

  DocumentReference? get client;

  DocumentReference? get ref;

  bool? get paye;

  int? get mt;

  DocumentReference? get livreur;

  bool? get livraison;

  DateTime? get heurecommande;

  DateTime? get heurelivraison;

  DocumentReference? get refRide;

  DateTime? get date;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(CommandesRecordBuilder builder) => builder
    ..nom = ''
    ..paye = false
    ..mt = 0
    ..livraison = false;

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Commandes')
          : FirebaseFirestore.instance.collectionGroup('Commandes');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Commandes').doc();

  static Stream<CommandesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CommandesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CommandesRecord._();
  factory CommandesRecord([void Function(CommandesRecordBuilder) updates]) =
      _$CommandesRecord;

  static CommandesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCommandesRecordData({
  String? nom,
  DocumentReference? client,
  DocumentReference? ref,
  bool? paye,
  int? mt,
  DocumentReference? livreur,
  bool? livraison,
  DateTime? heurecommande,
  DateTime? heurelivraison,
  DocumentReference? refRide,
  DateTime? date,
}) {
  final firestoreData = serializers.toFirestore(
    CommandesRecord.serializer,
    CommandesRecord(
      (c) => c
        ..nom = nom
        ..client = client
        ..ref = ref
        ..paye = paye
        ..mt = mt
        ..livreur = livreur
        ..livraison = livraison
        ..heurecommande = heurecommande
        ..heurelivraison = heurelivraison
        ..refRide = refRide
        ..date = date,
    ),
  );

  return firestoreData;
}
