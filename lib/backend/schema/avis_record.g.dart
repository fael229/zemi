// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avis_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AvisRecord> _$avisRecordSerializer = new _$AvisRecordSerializer();

class _$AvisRecordSerializer implements StructuredSerializer<AvisRecord> {
  @override
  final Iterable<Type> types = const [AvisRecord, _$AvisRecord];
  @override
  final String wireName = 'AvisRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AvisRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.pp;
    if (value != null) {
      result
        ..add('pp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.comment;
    if (value != null) {
      result
        ..add('comment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nom;
    if (value != null) {
      result
        ..add('nom')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  AvisRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AvisRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'pp':
          result.pp = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'comment':
          result.comment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nom':
          result.nom = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$AvisRecord extends AvisRecord {
  @override
  final String? pp;
  @override
  final String? comment;
  @override
  final String? nom;
  @override
  final DateTime? date;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AvisRecord([void Function(AvisRecordBuilder)? updates]) =>
      (new AvisRecordBuilder()..update(updates))._build();

  _$AvisRecord._({this.pp, this.comment, this.nom, this.date, this.ffRef})
      : super._();

  @override
  AvisRecord rebuild(void Function(AvisRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AvisRecordBuilder toBuilder() => new AvisRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AvisRecord &&
        pp == other.pp &&
        comment == other.comment &&
        nom == other.nom &&
        date == other.date &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, pp.hashCode), comment.hashCode), nom.hashCode),
            date.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AvisRecord')
          ..add('pp', pp)
          ..add('comment', comment)
          ..add('nom', nom)
          ..add('date', date)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AvisRecordBuilder implements Builder<AvisRecord, AvisRecordBuilder> {
  _$AvisRecord? _$v;

  String? _pp;
  String? get pp => _$this._pp;
  set pp(String? pp) => _$this._pp = pp;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  String? _nom;
  String? get nom => _$this._nom;
  set nom(String? nom) => _$this._nom = nom;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AvisRecordBuilder() {
    AvisRecord._initializeBuilder(this);
  }

  AvisRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pp = $v.pp;
      _comment = $v.comment;
      _nom = $v.nom;
      _date = $v.date;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AvisRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AvisRecord;
  }

  @override
  void update(void Function(AvisRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AvisRecord build() => _build();

  _$AvisRecord _build() {
    final _$result = _$v ??
        new _$AvisRecord._(
            pp: pp, comment: comment, nom: nom, date: date, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
