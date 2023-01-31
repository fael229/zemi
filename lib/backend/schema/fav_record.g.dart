// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FavRecord> _$favRecordSerializer = new _$FavRecordSerializer();

class _$FavRecordSerializer implements StructuredSerializer<FavRecord> {
  @override
  final Iterable<Type> types = const [FavRecord, _$FavRecord];
  @override
  final String wireName = 'FavRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, FavRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.ref;
    if (value != null) {
      result
        ..add('ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.qty;
    if (value != null) {
      result
        ..add('qty')
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
  FavRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FavRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'ref':
          result.ref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'qty':
          result.qty = serializers.deserialize(value,
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

class _$FavRecord extends FavRecord {
  @override
  final DateTime? date;
  @override
  final DocumentReference<Object?>? ref;
  @override
  final int? qty;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FavRecord([void Function(FavRecordBuilder)? updates]) =>
      (new FavRecordBuilder()..update(updates))._build();

  _$FavRecord._({this.date, this.ref, this.qty, this.ffRef}) : super._();

  @override
  FavRecord rebuild(void Function(FavRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FavRecordBuilder toBuilder() => new FavRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FavRecord &&
        date == other.date &&
        ref == other.ref &&
        qty == other.qty &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc($jc(0, date.hashCode), ref.hashCode), qty.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FavRecord')
          ..add('date', date)
          ..add('ref', ref)
          ..add('qty', qty)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FavRecordBuilder implements Builder<FavRecord, FavRecordBuilder> {
  _$FavRecord? _$v;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  DocumentReference<Object?>? _ref;
  DocumentReference<Object?>? get ref => _$this._ref;
  set ref(DocumentReference<Object?>? ref) => _$this._ref = ref;

  int? _qty;
  int? get qty => _$this._qty;
  set qty(int? qty) => _$this._qty = qty;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FavRecordBuilder() {
    FavRecord._initializeBuilder(this);
  }

  FavRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _date = $v.date;
      _ref = $v.ref;
      _qty = $v.qty;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FavRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FavRecord;
  }

  @override
  void update(void Function(FavRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FavRecord build() => _build();

  _$FavRecord _build() {
    final _$result =
        _$v ?? new _$FavRecord._(date: date, ref: ref, qty: qty, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
