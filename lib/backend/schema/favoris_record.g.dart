// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favoris_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FavorisRecord> _$favorisRecordSerializer =
    new _$FavorisRecordSerializer();

class _$FavorisRecordSerializer implements StructuredSerializer<FavorisRecord> {
  @override
  final Iterable<Type> types = const [FavorisRecord, _$FavorisRecord];
  @override
  final String wireName = 'FavorisRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, FavorisRecord object,
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
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.prix;
    if (value != null) {
      result
        ..add('prix')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.cat;
    if (value != null) {
      result
        ..add('cat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.variab;
    if (value != null) {
      result
        ..add('variab')
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
  FavorisRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FavorisRecordBuilder();

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
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'prix':
          result.prix = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'cat':
          result.cat = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'variab':
          result.variab = serializers.deserialize(value,
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

class _$FavorisRecord extends FavorisRecord {
  @override
  final String? nom;
  @override
  final String? image;
  @override
  final int? prix;
  @override
  final String? cat;
  @override
  final String? variab;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FavorisRecord([void Function(FavorisRecordBuilder)? updates]) =>
      (new FavorisRecordBuilder()..update(updates))._build();

  _$FavorisRecord._(
      {this.nom, this.image, this.prix, this.cat, this.variab, this.ffRef})
      : super._();

  @override
  FavorisRecord rebuild(void Function(FavorisRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FavorisRecordBuilder toBuilder() => new FavorisRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FavorisRecord &&
        nom == other.nom &&
        image == other.image &&
        prix == other.prix &&
        cat == other.cat &&
        variab == other.variab &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, nom.hashCode), image.hashCode), prix.hashCode),
                cat.hashCode),
            variab.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FavorisRecord')
          ..add('nom', nom)
          ..add('image', image)
          ..add('prix', prix)
          ..add('cat', cat)
          ..add('variab', variab)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FavorisRecordBuilder
    implements Builder<FavorisRecord, FavorisRecordBuilder> {
  _$FavorisRecord? _$v;

  String? _nom;
  String? get nom => _$this._nom;
  set nom(String? nom) => _$this._nom = nom;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  int? _prix;
  int? get prix => _$this._prix;
  set prix(int? prix) => _$this._prix = prix;

  String? _cat;
  String? get cat => _$this._cat;
  set cat(String? cat) => _$this._cat = cat;

  String? _variab;
  String? get variab => _$this._variab;
  set variab(String? variab) => _$this._variab = variab;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FavorisRecordBuilder() {
    FavorisRecord._initializeBuilder(this);
  }

  FavorisRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nom = $v.nom;
      _image = $v.image;
      _prix = $v.prix;
      _cat = $v.cat;
      _variab = $v.variab;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FavorisRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FavorisRecord;
  }

  @override
  void update(void Function(FavorisRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FavorisRecord build() => _build();

  _$FavorisRecord _build() {
    final _$result = _$v ??
        new _$FavorisRecord._(
            nom: nom,
            image: image,
            prix: prix,
            cat: cat,
            variab: variab,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
