import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'cart_record.g.dart';

abstract class CartRecord implements Built<CartRecord, CartRecordBuilder> {
  static Serializer<CartRecord> get serializer => _$cartRecordSerializer;

  String? get nom;

  int? get qty;

  String? get des;

  String? get id;

  String? get img;

  String? get cat;

  int? get cod;

  int? get prix;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CartRecordBuilder builder) => builder
    ..nom = ''
    ..qty = 0
    ..des = ''
    ..id = ''
    ..img = ''
    ..cat = ''
    ..cod = 0
    ..prix = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cart');

  static Stream<CartRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CartRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CartRecord._();
  factory CartRecord([void Function(CartRecordBuilder) updates]) = _$CartRecord;

  static CartRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCartRecordData({
  String? nom,
  int? qty,
  String? des,
  String? id,
  String? img,
  String? cat,
  int? cod,
  int? prix,
}) {
  final firestoreData = serializers.toFirestore(
    CartRecord.serializer,
    CartRecord(
      (c) => c
        ..nom = nom
        ..qty = qty
        ..des = des
        ..id = id
        ..img = img
        ..cat = cat
        ..cod = cod
        ..prix = prix,
    ),
  );

  return firestoreData;
}
