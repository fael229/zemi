// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refcli_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RefcliRecord> _$refcliRecordSerializer =
    new _$RefcliRecordSerializer();

class _$RefcliRecordSerializer implements StructuredSerializer<RefcliRecord> {
  @override
  final Iterable<Type> types = const [RefcliRecord, _$RefcliRecord];
  @override
  final String wireName = 'RefcliRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RefcliRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.lan;
    if (value != null) {
      result
        ..add('lan')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.num;
    if (value != null) {
      result
        ..add('num')
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
  RefcliRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RefcliRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'lan':
          result.lan = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'num':
          result.num = serializers.deserialize(value,
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

class _$RefcliRecord extends RefcliRecord {
  @override
  final LatLng? lan;
  @override
  final String? num;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RefcliRecord([void Function(RefcliRecordBuilder)? updates]) =>
      (new RefcliRecordBuilder()..update(updates))._build();

  _$RefcliRecord._({this.lan, this.num, this.ffRef}) : super._();

  @override
  RefcliRecord rebuild(void Function(RefcliRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RefcliRecordBuilder toBuilder() => new RefcliRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RefcliRecord &&
        lan == other.lan &&
        num == other.num &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, lan.hashCode), num.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RefcliRecord')
          ..add('lan', lan)
          ..add('num', num)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RefcliRecordBuilder
    implements Builder<RefcliRecord, RefcliRecordBuilder> {
  _$RefcliRecord? _$v;

  LatLng? _lan;
  LatLng? get lan => _$this._lan;
  set lan(LatLng? lan) => _$this._lan = lan;

  String? _num;
  String? get num => _$this._num;
  set num(String? num) => _$this._num = num;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RefcliRecordBuilder() {
    RefcliRecord._initializeBuilder(this);
  }

  RefcliRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lan = $v.lan;
      _num = $v.num;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RefcliRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RefcliRecord;
  }

  @override
  void update(void Function(RefcliRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RefcliRecord build() => _build();

  _$RefcliRecord _build() {
    final _$result =
        _$v ?? new _$RefcliRecord._(lan: lan, num: num, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
