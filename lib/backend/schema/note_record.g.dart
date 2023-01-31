// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NoteRecord> _$noteRecordSerializer = new _$NoteRecordSerializer();

class _$NoteRecordSerializer implements StructuredSerializer<NoteRecord> {
  @override
  final Iterable<Type> types = const [NoteRecord, _$NoteRecord];
  @override
  final String wireName = 'NoteRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, NoteRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.prodRef;
    if (value != null) {
      result
        ..add('prodRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.rate;
    if (value != null) {
      result
        ..add('rate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
  NoteRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NoteRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'prodRef':
          result.prodRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'rate':
          result.rate = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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

class _$NoteRecord extends NoteRecord {
  @override
  final DocumentReference<Object?>? prodRef;
  @override
  final double? rate;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$NoteRecord([void Function(NoteRecordBuilder)? updates]) =>
      (new NoteRecordBuilder()..update(updates))._build();

  _$NoteRecord._({this.prodRef, this.rate, this.ffRef}) : super._();

  @override
  NoteRecord rebuild(void Function(NoteRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NoteRecordBuilder toBuilder() => new NoteRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NoteRecord &&
        prodRef == other.prodRef &&
        rate == other.rate &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, prodRef.hashCode), rate.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NoteRecord')
          ..add('prodRef', prodRef)
          ..add('rate', rate)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class NoteRecordBuilder implements Builder<NoteRecord, NoteRecordBuilder> {
  _$NoteRecord? _$v;

  DocumentReference<Object?>? _prodRef;
  DocumentReference<Object?>? get prodRef => _$this._prodRef;
  set prodRef(DocumentReference<Object?>? prodRef) => _$this._prodRef = prodRef;

  double? _rate;
  double? get rate => _$this._rate;
  set rate(double? rate) => _$this._rate = rate;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  NoteRecordBuilder() {
    NoteRecord._initializeBuilder(this);
  }

  NoteRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _prodRef = $v.prodRef;
      _rate = $v.rate;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NoteRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NoteRecord;
  }

  @override
  void update(void Function(NoteRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NoteRecord build() => _build();

  _$NoteRecord _build() {
    final _$result =
        _$v ?? new _$NoteRecord._(prodRef: prodRef, rate: rate, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
