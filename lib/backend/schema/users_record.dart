import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  bool? get admin;

  bool? get livreur;

  bool? get client;

  String? get nom;

  String? get prenom;

  String? get localisation;

  String? get localisation2;

  String? get localisation3;

  BuiltList<String>? get nbreJour;

  bool? get abonnLivraison;

  DateTime? get debutAbo;

  String? get reseau;

  DocumentReference? get last;

  LatLng? get pos;

  bool? get approuv;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..admin = false
    ..livreur = false
    ..client = false
    ..nom = ''
    ..prenom = ''
    ..localisation = ''
    ..localisation2 = ''
    ..localisation3 = ''
    ..nbreJour = ListBuilder()
    ..abonnLivraison = false
    ..reseau = ''
    ..approuv = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? admin,
  bool? livreur,
  bool? client,
  String? nom,
  String? prenom,
  String? localisation,
  String? localisation2,
  String? localisation3,
  bool? abonnLivraison,
  DateTime? debutAbo,
  String? reseau,
  DocumentReference? last,
  LatLng? pos,
  bool? approuv,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..admin = admin
        ..livreur = livreur
        ..client = client
        ..nom = nom
        ..prenom = prenom
        ..localisation = localisation
        ..localisation2 = localisation2
        ..localisation3 = localisation3
        ..nbreJour = null
        ..abonnLivraison = abonnLivraison
        ..debutAbo = debutAbo
        ..reseau = reseau
        ..last = last
        ..pos = pos
        ..approuv = approuv,
    ),
  );

  return firestoreData;
}
