// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PromoRecord> _$promoRecordSerializer = new _$PromoRecordSerializer();

class _$PromoRecordSerializer implements StructuredSerializer<PromoRecord> {
  @override
  final Iterable<Type> types = const [PromoRecord, _$PromoRecord];
  @override
  final String wireName = 'PromoRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PromoRecord object,
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
    value = object.img;
    if (value != null) {
      result
        ..add('img')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  PromoRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PromoRecordBuilder();

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
        case 'img':
          result.img = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$PromoRecord extends PromoRecord {
  @override
  final String? nom;
  @override
  final String? img;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PromoRecord([void Function(PromoRecordBuilder)? updates]) =>
      (new PromoRecordBuilder()..update(updates))._build();

  _$PromoRecord._({this.nom, this.img, this.ffRef}) : super._();

  @override
  PromoRecord rebuild(void Function(PromoRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PromoRecordBuilder toBuilder() => new PromoRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PromoRecord &&
        nom == other.nom &&
        img == other.img &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, nom.hashCode), img.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PromoRecord')
          ..add('nom', nom)
          ..add('img', img)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PromoRecordBuilder implements Builder<PromoRecord, PromoRecordBuilder> {
  _$PromoRecord? _$v;

  String? _nom;
  String? get nom => _$this._nom;
  set nom(String? nom) => _$this._nom = nom;

  String? _img;
  String? get img => _$this._img;
  set img(String? img) => _$this._img = img;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PromoRecordBuilder() {
    PromoRecord._initializeBuilder(this);
  }

  PromoRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nom = $v.nom;
      _img = $v.img;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PromoRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PromoRecord;
  }

  @override
  void update(void Function(PromoRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PromoRecord build() => _build();

  _$PromoRecord _build() {
    final _$result =
        _$v ?? new _$PromoRecord._(nom: nom, img: img, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
