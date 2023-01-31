// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DetailsRecord> _$detailsRecordSerializer =
    new _$DetailsRecordSerializer();

class _$DetailsRecordSerializer implements StructuredSerializer<DetailsRecord> {
  @override
  final Iterable<Type> types = const [DetailsRecord, _$DetailsRecord];
  @override
  final String wireName = 'DetailsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, DetailsRecord object,
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
  DetailsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DetailsRecordBuilder();

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

class _$DetailsRecord extends DetailsRecord {
  @override
  final String? nom;
  @override
  final String? img;
  @override
  final int? nbr;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$DetailsRecord([void Function(DetailsRecordBuilder)? updates]) =>
      (new DetailsRecordBuilder()..update(updates))._build();

  _$DetailsRecord._({this.nom, this.img, this.nbr, this.ffRef}) : super._();

  @override
  DetailsRecord rebuild(void Function(DetailsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DetailsRecordBuilder toBuilder() => new DetailsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DetailsRecord &&
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
    return (newBuiltValueToStringHelper(r'DetailsRecord')
          ..add('nom', nom)
          ..add('img', img)
          ..add('nbr', nbr)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class DetailsRecordBuilder
    implements Builder<DetailsRecord, DetailsRecordBuilder> {
  _$DetailsRecord? _$v;

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

  DetailsRecordBuilder() {
    DetailsRecord._initializeBuilder(this);
  }

  DetailsRecordBuilder get _$this {
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
  void replace(DetailsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DetailsRecord;
  }

  @override
  void update(void Function(DetailsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DetailsRecord build() => _build();

  _$DetailsRecord _build() {
    final _$result = _$v ??
        new _$DetailsRecord._(nom: nom, img: img, nbr: nbr, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
