// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CatRecord> _$catRecordSerializer = new _$CatRecordSerializer();

class _$CatRecordSerializer implements StructuredSerializer<CatRecord> {
  @override
  final Iterable<Type> types = const [CatRecord, _$CatRecord];
  @override
  final String wireName = 'CatRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CatRecord object,
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
    value = object.nbr;
    if (value != null) {
      result
        ..add('nbr')
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
  CatRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CatRecordBuilder();

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
        case 'nbr':
          result.nbr = serializers.deserialize(value,
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

class _$CatRecord extends CatRecord {
  @override
  final String? nom;
  @override
  final String? img;
  @override
  final int? nbr;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CatRecord([void Function(CatRecordBuilder)? updates]) =>
      (new CatRecordBuilder()..update(updates))._build();

  _$CatRecord._({this.nom, this.img, this.nbr, this.ffRef}) : super._();

  @override
  CatRecord rebuild(void Function(CatRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CatRecordBuilder toBuilder() => new CatRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CatRecord &&
        nom == other.nom &&
        img == other.img &&
        nbr == other.nbr &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc($jc(0, nom.hashCode), img.hashCode), nbr.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CatRecord')
          ..add('nom', nom)
          ..add('img', img)
          ..add('nbr', nbr)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CatRecordBuilder implements Builder<CatRecord, CatRecordBuilder> {
  _$CatRecord? _$v;

  String? _nom;
  String? get nom => _$this._nom;
  set nom(String? nom) => _$this._nom = nom;

  String? _img;
  String? get img => _$this._img;
  set img(String? img) => _$this._img = img;

  int? _nbr;
  int? get nbr => _$this._nbr;
  set nbr(int? nbr) => _$this._nbr = nbr;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CatRecordBuilder() {
    CatRecord._initializeBuilder(this);
  }

  CatRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nom = $v.nom;
      _img = $v.img;
      _nbr = $v.nbr;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CatRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CatRecord;
  }

  @override
  void update(void Function(CatRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CatRecord build() => _build();

  _$CatRecord _build() {
    final _$result =
        _$v ?? new _$CatRecord._(nom: nom, img: img, nbr: nbr, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
