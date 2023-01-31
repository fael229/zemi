// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'panier_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PanierRecord> _$panierRecordSerializer =
    new _$PanierRecordSerializer();

class _$PanierRecordSerializer implements StructuredSerializer<PanierRecord> {
  @override
  final Iterable<Type> types = const [PanierRecord, _$PanierRecord];
  @override
  final String wireName = 'PanierRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PanierRecord object,
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
    value = object.qty;
    if (value != null) {
      result
        ..add('qty')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.client;
    if (value != null) {
      result
        ..add('client')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ref;
    if (value != null) {
      result
        ..add('ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.mt;
    if (value != null) {
      result
        ..add('mt')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.jour;
    if (value != null) {
      result
        ..add('jour')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.heure;
    if (value != null) {
      result
        ..add('heure')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.lieu;
    if (value != null) {
      result
        ..add('lieu')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.abo;
    if (value != null) {
      result
        ..add('abo')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.nom;
    if (value != null) {
      result
        ..add('nom')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
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
  PanierRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PanierRecordBuilder();

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
        case 'qty':
          result.qty = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'client':
          result.client = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ref':
          result.ref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'mt':
          result.mt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'jour':
          result.jour = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'heure':
          result.heure = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'lieu':
          result.lieu = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'abo':
          result.abo = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'nom':
          result.nom = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
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

class _$PanierRecord extends PanierRecord {
  @override
  final DocumentReference<Object?>? prodRef;
  @override
  final int? qty;
  @override
  final String? type;
  @override
  final String? client;
  @override
  final DocumentReference<Object?>? ref;
  @override
  final int? mt;
  @override
  final String? jour;
  @override
  final DateTime? heure;
  @override
  final String? lieu;
  @override
  final bool? abo;
  @override
  final String? nom;
  @override
  final String? id;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PanierRecord([void Function(PanierRecordBuilder)? updates]) =>
      (new PanierRecordBuilder()..update(updates))._build();

  _$PanierRecord._(
      {this.prodRef,
      this.qty,
      this.type,
      this.client,
      this.ref,
      this.mt,
      this.jour,
      this.heure,
      this.lieu,
      this.abo,
      this.nom,
      this.id,
      this.ffRef})
      : super._();

  @override
  PanierRecord rebuild(void Function(PanierRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PanierRecordBuilder toBuilder() => new PanierRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PanierRecord &&
        prodRef == other.prodRef &&
        qty == other.qty &&
        type == other.type &&
        client == other.client &&
        ref == other.ref &&
        mt == other.mt &&
        jour == other.jour &&
        heure == other.heure &&
        lieu == other.lieu &&
        abo == other.abo &&
        nom == other.nom &&
        id == other.id &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, prodRef.hashCode),
                                                    qty.hashCode),
                                                type.hashCode),
                                            client.hashCode),
                                        ref.hashCode),
                                    mt.hashCode),
                                jour.hashCode),
                            heure.hashCode),
                        lieu.hashCode),
                    abo.hashCode),
                nom.hashCode),
            id.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PanierRecord')
          ..add('prodRef', prodRef)
          ..add('qty', qty)
          ..add('type', type)
          ..add('client', client)
          ..add('ref', ref)
          ..add('mt', mt)
          ..add('jour', jour)
          ..add('heure', heure)
          ..add('lieu', lieu)
          ..add('abo', abo)
          ..add('nom', nom)
          ..add('id', id)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PanierRecordBuilder
    implements Builder<PanierRecord, PanierRecordBuilder> {
  _$PanierRecord? _$v;

  DocumentReference<Object?>? _prodRef;
  DocumentReference<Object?>? get prodRef => _$this._prodRef;
  set prodRef(DocumentReference<Object?>? prodRef) => _$this._prodRef = prodRef;

  int? _qty;
  int? get qty => _$this._qty;
  set qty(int? qty) => _$this._qty = qty;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _client;
  String? get client => _$this._client;
  set client(String? client) => _$this._client = client;

  DocumentReference<Object?>? _ref;
  DocumentReference<Object?>? get ref => _$this._ref;
  set ref(DocumentReference<Object?>? ref) => _$this._ref = ref;

  int? _mt;
  int? get mt => _$this._mt;
  set mt(int? mt) => _$this._mt = mt;

  String? _jour;
  String? get jour => _$this._jour;
  set jour(String? jour) => _$this._jour = jour;

  DateTime? _heure;
  DateTime? get heure => _$this._heure;
  set heure(DateTime? heure) => _$this._heure = heure;

  String? _lieu;
  String? get lieu => _$this._lieu;
  set lieu(String? lieu) => _$this._lieu = lieu;

  bool? _abo;
  bool? get abo => _$this._abo;
  set abo(bool? abo) => _$this._abo = abo;

  String? _nom;
  String? get nom => _$this._nom;
  set nom(String? nom) => _$this._nom = nom;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PanierRecordBuilder() {
    PanierRecord._initializeBuilder(this);
  }

  PanierRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _prodRef = $v.prodRef;
      _qty = $v.qty;
      _type = $v.type;
      _client = $v.client;
      _ref = $v.ref;
      _mt = $v.mt;
      _jour = $v.jour;
      _heure = $v.heure;
      _lieu = $v.lieu;
      _abo = $v.abo;
      _nom = $v.nom;
      _id = $v.id;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PanierRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PanierRecord;
  }

  @override
  void update(void Function(PanierRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PanierRecord build() => _build();

  _$PanierRecord _build() {
    final _$result = _$v ??
        new _$PanierRecord._(
            prodRef: prodRef,
            qty: qty,
            type: type,
            client: client,
            ref: ref,
            mt: mt,
            jour: jour,
            heure: heure,
            lieu: lieu,
            abo: abo,
            nom: nom,
            id: id,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
