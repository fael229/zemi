import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'produits_record.g.dart';

abstract class ProduitsRecord
    implements Built<ProduitsRecord, ProduitsRecordBuilder> {
  static Serializer<ProduitsRecord> get serializer =>
      _$produitsRecordSerializer;

  @BuiltValueField(wireName: 'Nom')
  String? get nom;

  String? get image;

  String? get description;

  @BuiltValueField(wireName: 'created_by')
  String? get createdBy;

  int? get prix;

  String? get category;

  DateTime? get date;

  bool? get fav;

  int? get cod;

  String? get dispo;

  int? get vue;

  BuiltList<String>? get favoris;

  int? get nbreAvis;

  bool? get multi;

  int? get prixDemi;

  int? get prixComplet;

  DateTime? get ouv;

  DateTime? get clo;

  bool? get defaut;

  BuiltList<double>? get note;

  BuiltList<String>? get noteUser;

  double? get moyenne;

  int? get nbreFav;

  String? get nomDemi;

  String? get nomComplet;

  int? get pourcentage;

  BuiltList<String>? get catList;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ProduitsRecordBuilder builder) => builder
    ..nom = ''
    ..image = ''
    ..description = ''
    ..createdBy = ''
    ..prix = 0
    ..category = ''
    ..fav = false
    ..cod = 0
    ..dispo = ''
    ..vue = 0
    ..favoris = ListBuilder()
    ..nbreAvis = 0
    ..multi = false
    ..prixDemi = 0
    ..prixComplet = 0
    ..defaut = false
    ..note = ListBuilder()
    ..noteUser = ListBuilder()
    ..moyenne = 0.0
    ..nbreFav = 0
    ..nomDemi = ''
    ..nomComplet = ''
    ..pourcentage = 0
    ..catList = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('produits');

  static Stream<ProduitsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ProduitsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static ProduitsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ProduitsRecord(
        (c) => c
          ..nom = snapshot.data['Nom']
          ..image = snapshot.data['image']
          ..description = snapshot.data['description']
          ..createdBy = snapshot.data['created_by']
          ..prix = snapshot.data['prix']?.round()
          ..category = snapshot.data['category']
          ..date = safeGet(
              () => DateTime.fromMillisecondsSinceEpoch(snapshot.data['date']))
          ..fav = snapshot.data['fav']
          ..cod = snapshot.data['cod']?.round()
          ..dispo = snapshot.data['dispo']
          ..vue = snapshot.data['vue']?.round()
          ..favoris = safeGet(() => ListBuilder(snapshot.data['favoris']))
          ..nbreAvis = snapshot.data['nbreAvis']?.round()
          ..multi = snapshot.data['multi']
          ..prixDemi = snapshot.data['prixDemi']?.round()
          ..prixComplet = snapshot.data['prixComplet']?.round()
          ..ouv = safeGet(
              () => DateTime.fromMillisecondsSinceEpoch(snapshot.data['ouv']))
          ..clo = safeGet(
              () => DateTime.fromMillisecondsSinceEpoch(snapshot.data['clo']))
          ..defaut = snapshot.data['defaut']
          ..note = safeGet(() => ListBuilder(
              snapshot.data['note'].map((d) => (d as num).toDouble())))
          ..noteUser = safeGet(() => ListBuilder(snapshot.data['noteUser']))
          ..moyenne = snapshot.data['moyenne']?.toDouble()
          ..nbreFav = snapshot.data['nbreFav']?.round()
          ..nomDemi = snapshot.data['nomDemi']
          ..nomComplet = snapshot.data['nomComplet']
          ..pourcentage = snapshot.data['pourcentage']?.round()
          ..catList = safeGet(() => ListBuilder(snapshot.data['catList']))
          ..ffRef = ProduitsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ProduitsRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'produits',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  ProduitsRecord._();
  factory ProduitsRecord([void Function(ProduitsRecordBuilder) updates]) =
      _$ProduitsRecord;

  static ProduitsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createProduitsRecordData({
  String? nom,
  String? image,
  String? description,
  String? createdBy,
  int? prix,
  String? category,
  DateTime? date,
  bool? fav,
  int? cod,
  String? dispo,
  int? vue,
  int? nbreAvis,
  bool? multi,
  int? prixDemi,
  int? prixComplet,
  DateTime? ouv,
  DateTime? clo,
  bool? defaut,
  double? moyenne,
  int? nbreFav,
  String? nomDemi,
  String? nomComplet,
  int? pourcentage,
}) {
  final firestoreData = serializers.toFirestore(
    ProduitsRecord.serializer,
    ProduitsRecord(
      (p) => p
        ..nom = nom
        ..image = image
        ..description = description
        ..createdBy = createdBy
        ..prix = prix
        ..category = category
        ..date = date
        ..fav = fav
        ..cod = cod
        ..dispo = dispo
        ..vue = vue
        ..favoris = null
        ..nbreAvis = nbreAvis
        ..multi = multi
        ..prixDemi = prixDemi
        ..prixComplet = prixComplet
        ..ouv = ouv
        ..clo = clo
        ..defaut = defaut
        ..note = null
        ..noteUser = null
        ..moyenne = moyenne
        ..nbreFav = nbreFav
        ..nomDemi = nomDemi
        ..nomComplet = nomComplet
        ..pourcentage = pourcentage
        ..catList = null,
    ),
  );

  return firestoreData;
}
