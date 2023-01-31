// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_connexion_hour_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LastConnexionHourRecord> _$lastConnexionHourRecordSerializer =
    new _$LastConnexionHourRecordSerializer();

class _$LastConnexionHourRecordSerializer
    implements StructuredSerializer<LastConnexionHourRecord> {
  @override
  final Iterable<Type> types = const [
    LastConnexionHourRecord,
    _$LastConnexionHourRecord
  ];
  @override
  final String wireName = 'LastConnexionHourRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, LastConnexionHourRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.last;
    if (value != null) {
      result
        ..add('last')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
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
  LastConnexionHourRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LastConnexionHourRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'last':
          result.last = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
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

class _$LastConnexionHourRecord extends LastConnexionHourRecord {
  @override
  final DateTime? last;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$LastConnexionHourRecord(
          [void Function(LastConnexionHourRecordBuilder)? updates]) =>
      (new LastConnexionHourRecordBuilder()..update(updates))._build();

  _$LastConnexionHourRecord._({this.last, this.name, this.email, this.ffRef})
      : super._();

  @override
  LastConnexionHourRecord rebuild(
          void Function(LastConnexionHourRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LastConnexionHourRecordBuilder toBuilder() =>
      new LastConnexionHourRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LastConnexionHourRecord &&
        last == other.last &&
        name == other.name &&
        email == other.email &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, last.hashCode), name.hashCode), email.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LastConnexionHourRecord')
          ..add('last', last)
          ..add('name', name)
          ..add('email', email)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class LastConnexionHourRecordBuilder
    implements
        Builder<LastConnexionHourRecord, LastConnexionHourRecordBuilder> {
  _$LastConnexionHourRecord? _$v;

  DateTime? _last;
  DateTime? get last => _$this._last;
  set last(DateTime? last) => _$this._last = last;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  LastConnexionHourRecordBuilder() {
    LastConnexionHourRecord._initializeBuilder(this);
  }

  LastConnexionHourRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _last = $v.last;
      _name = $v.name;
      _email = $v.email;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LastConnexionHourRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LastConnexionHourRecord;
  }

  @override
  void update(void Function(LastConnexionHourRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LastConnexionHourRecord build() => _build();

  _$LastConnexionHourRecord _build() {
    final _$result = _$v ??
        new _$LastConnexionHourRecord._(
            last: last, name: name, email: email, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
