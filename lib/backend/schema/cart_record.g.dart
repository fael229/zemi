// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CartRecord> _$cartRecordSerializer = new _$CartRecordSerializer();

class _$CartRecordSerializer implements StructuredSerializer<CartRecord> {
  @override
  final Iterable<Type> types = const [CartRecord, _$CartRecord];
  @override
  final String wireName = 'CartRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CartRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.nom;
    if (value != null) {
      result
        ..add('nom')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.qty;
    if (value != null) {
      result
        ..add('qty')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.des;
    if (value != null) {
      result
        ..add('des')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.img;
    if (value != null) {
      result
        ..add('img')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cat;
    if (value != null) {
      result
        ..add('cat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cod;
    if (value != null) {
      result
        ..add('cod')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.prix;
    if (value != null) {
      result
        ..add('prix')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  CartRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CartRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'nom':
          result.nom = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'qty':
          result.qty = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'des':
          result.des = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'img':
          result.img = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'cat':
          result.cat = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'cod':
          result.cod = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'prix':
          result.prix = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$CartRecord extends CartRecord {
  @override
  final String? nom;
  @override
  final int? qty;
  @override
  final String? des;
  @override
  final String? id;
  @override
  final String? img;
  @override
  final String? cat;
  @override
  final int? cod;
  @override
  final int? prix;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CartRecord([void Function(CartRecordBuilder)? updates]) =>
      (new CartRecordBuilder()..update(updates))._build();

  _$CartRecord._(
      {this.nom,
      this.qty,
      this.des,
      this.id,
      this.img,
      this.cat,
      this.cod,
      this.prix,
      this.ffRef})
      : super._();

  @override
  CartRecord rebuild(void Function(CartRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CartRecordBuilder toBuilder() => new CartRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CartRecord &&
        nom == other.nom &&
        qty == other.qty &&
        des == other.des &&
        id == other.id &&
        img == other.img &&
        cat == other.cat &&
        cod == other.cod &&
        prix == other.prix &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, nom.hashCode), qty.hashCode),
                                des.hashCode),
                            id.hashCode),
                        img.hashCode),
                    cat.hashCode),
                cod.hashCode),
            prix.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CartRecord')
          ..add('nom', nom)
          ..add('qty', qty)
          ..add('des', des)
          ..add('id', id)
          ..add('img', img)
          ..add('cat', cat)
          ..add('cod', cod)
          ..add('prix', prix)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CartRecordBuilder implements Builder<CartRecord, CartRecordBuilder> {
  _$CartRecord? _$v;

  String? _nom;
  String? get nom => _$this._nom;
  set nom(String? nom) => _$this._nom = nom;

  int? _qty;
  int? get qty => _$this._qty;
  set qty(int? qty) => _$this._qty = qty;

  String? _des;
  String? get des => _$this._des;
  set des(String? des) => _$this._des = des;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _img;
  String? get img => _$this._img;
  set img(String? img) => _$this._img = img;

  String? _cat;
  String? get cat => _$this._cat;
  set cat(String? cat) => _$this._cat = cat;

  int? _cod;
  int? get cod => _$this._cod;
  set cod(int? cod) => _$this._cod = cod;

  int? _prix;
  int? get prix => _$this._prix;
  set prix(int? prix) => _$this._prix = prix;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CartRecordBuilder() {
    CartRecord._initializeBuilder(this);
  }

  CartRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nom = $v.nom;
      _qty = $v.qty;
      _des = $v.des;
      _id = $v.id;
      _img = $v.img;
      _cat = $v.cat;
      _cod = $v.cod;
      _prix = $v.prix;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CartRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CartRecord;
  }

  @override
  void update(void Function(CartRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CartRecord build() => _build();

  _$CartRecord _build() {
    final _$result = _$v ??
        new _$CartRecord._(
            nom: nom,
            qty: qty,
            des: des,
            id: id,
            img: img,
            cat: cat,
            cod: cod,
            prix: prix,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
