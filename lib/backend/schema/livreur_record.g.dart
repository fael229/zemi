// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'livreur_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LivreurRecord> _$livreurRecordSerializer =
    new _$LivreurRecordSerializer();

class _$LivreurRecordSerializer implements StructuredSerializer<LivreurRecord> {
  @override
  final Iterable<Type> types = const [LivreurRecord, _$LivreurRecord];
  @override
  final String wireName = 'LivreurRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, LivreurRecord object,
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
    value = object.tot;
    if (value != null) {
      result
        ..add('tot')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.paye;
    if (value != null) {
      result
        ..add('paye')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
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
  LivreurRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LivreurRecordBuilder();

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
        case 'tot':
          result.tot = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'paye':
          result.paye = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
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

class _$LivreurRecord extends LivreurRecord {
  @override
  final String? nom;
  @override
  final int? tot;
  @override
  final bool? paye;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$LivreurRecord([void Function(LivreurRecordBuilder)? updates]) =>
      (new LivreurRecordBuilder()..update(updates))._build();

  _$LivreurRecord._({this.nom, this.tot, this.paye, this.ffRef}) : super._();

  @override
  LivreurRecord rebuild(void Function(LivreurRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LivreurRecordBuilder toBuilder() => new LivreurRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LivreurRecord &&
        nom == other.nom &&
        tot == other.tot &&
        paye == other.paye &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc($jc(0, nom.hashCode), tot.hashCode), paye.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LivreurRecord')
          ..add('nom', nom)
          ..add('tot', tot)
          ..add('paye', paye)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class LivreurRecordBuilder
    implements Builder<LivreurRecord, LivreurRecordBuilder> {
  _$LivreurRecord? _$v;

  String? _nom;
  String? get nom => _$this._nom;
  set nom(String? nom) => _$this._nom = nom;

  int? _tot;
  int? get tot => _$this._tot;
  set tot(int? tot) => _$this._tot = tot;

  bool? _paye;
  bool? get paye => _$this._paye;
  set paye(bool? paye) => _$this._paye = paye;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  LivreurRecordBuilder() {
    LivreurRecord._initializeBuilder(this);
  }

  LivreurRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nom = $v.nom;
      _tot = $v.tot;
      _paye = $v.paye;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LivreurRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LivreurRecord;
  }

  @override
  void update(void Function(LivreurRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LivreurRecord build() => _build();

  _$LivreurRecord _build() {
    final _$result = _$v ??
        new _$LivreurRecord._(nom: nom, tot: tot, paye: paye, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
