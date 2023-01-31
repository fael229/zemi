// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'frais_livraison_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FraisLivraisonRecord> _$fraisLivraisonRecordSerializer =
    new _$FraisLivraisonRecordSerializer();

class _$FraisLivraisonRecordSerializer
    implements StructuredSerializer<FraisLivraisonRecord> {
  @override
  final Iterable<Type> types = const [
    FraisLivraisonRecord,
    _$FraisLivraisonRecord
  ];
  @override
  final String wireName = 'FraisLivraisonRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, FraisLivraisonRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.nom;
    if (value != null) {
      result
        ..add('nom')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.abonnement;
    if (value != null) {
      result
        ..add('abonnement')
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
  FraisLivraisonRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FraisLivraisonRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'nom':
          result.nom = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'abonnement':
          result.abonnement = serializers.deserialize(value,
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

class _$FraisLivraisonRecord extends FraisLivraisonRecord {
  @override
  final int? nom;
  @override
  final int? abonnement;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FraisLivraisonRecord(
          [void Function(FraisLivraisonRecordBuilder)? updates]) =>
      (new FraisLivraisonRecordBuilder()..update(updates))._build();

  _$FraisLivraisonRecord._({this.nom, this.abonnement, this.ffRef}) : super._();

  @override
  FraisLivraisonRecord rebuild(
          void Function(FraisLivraisonRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FraisLivraisonRecordBuilder toBuilder() =>
      new FraisLivraisonRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FraisLivraisonRecord &&
        nom == other.nom &&
        abonnement == other.abonnement &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, nom.hashCode), abonnement.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FraisLivraisonRecord')
          ..add('nom', nom)
          ..add('abonnement', abonnement)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FraisLivraisonRecordBuilder
    implements Builder<FraisLivraisonRecord, FraisLivraisonRecordBuilder> {
  _$FraisLivraisonRecord? _$v;

  int? _nom;
  int? get nom => _$this._nom;
  set nom(int? nom) => _$this._nom = nom;

  int? _abonnement;
  int? get abonnement => _$this._abonnement;
  set abonnement(int? abonnement) => _$this._abonnement = abonnement;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FraisLivraisonRecordBuilder() {
    FraisLivraisonRecord._initializeBuilder(this);
  }

  FraisLivraisonRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nom = $v.nom;
      _abonnement = $v.abonnement;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FraisLivraisonRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FraisLivraisonRecord;
  }

  @override
  void update(void Function(FraisLivraisonRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FraisLivraisonRecord build() => _build();

  _$FraisLivraisonRecord _build() {
    final _$result = _$v ??
        new _$FraisLivraisonRecord._(
            nom: nom, abonnement: abonnement, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
