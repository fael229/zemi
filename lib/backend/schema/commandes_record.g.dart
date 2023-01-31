// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commandes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CommandesRecord> _$commandesRecordSerializer =
    new _$CommandesRecordSerializer();

class _$CommandesRecordSerializer
    implements StructuredSerializer<CommandesRecord> {
  @override
  final Iterable<Type> types = const [CommandesRecord, _$CommandesRecord];
  @override
  final String wireName = 'CommandesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CommandesRecord object,
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
    value = object.client;
    if (value != null) {
      result
        ..add('client')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.ref;
    if (value != null) {
      result
        ..add('ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.paye;
    if (value != null) {
      result
        ..add('paye')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.mt;
    if (value != null) {
      result
        ..add('mt')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.livreur;
    if (value != null) {
      result
        ..add('livreur')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.livraison;
    if (value != null) {
      result
        ..add('livraison')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.heurecommande;
    if (value != null) {
      result
        ..add('heurecommande')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.heurelivraison;
    if (value != null) {
      result
        ..add('heurelivraison')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.refRide;
    if (value != null) {
      result
        ..add('refRide')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  CommandesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CommandesRecordBuilder();

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
        case 'client':
          result.client = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'ref':
          result.ref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'paye':
          result.paye = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'mt':
          result.mt = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'livreur':
          result.livreur = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'livraison':
          result.livraison = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'heurecommande':
          result.heurecommande = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'heurelivraison':
          result.heurelivraison = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'refRide':
          result.refRide = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$CommandesRecord extends CommandesRecord {
  @override
  final String? nom;
  @override
  final DocumentReference<Object?>? client;
  @override
  final DocumentReference<Object?>? ref;
  @override
  final bool? paye;
  @override
  final int? mt;
  @override
  final DocumentReference<Object?>? livreur;
  @override
  final bool? livraison;
  @override
  final DateTime? heurecommande;
  @override
  final DateTime? heurelivraison;
  @override
  final DocumentReference<Object?>? refRide;
  @override
  final DateTime? date;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CommandesRecord([void Function(CommandesRecordBuilder)? updates]) =>
      (new CommandesRecordBuilder()..update(updates))._build();

  _$CommandesRecord._(
      {this.nom,
      this.client,
      this.ref,
      this.paye,
      this.mt,
      this.livreur,
      this.livraison,
      this.heurecommande,
      this.heurelivraison,
      this.refRide,
      this.date,
      this.ffRef})
      : super._();

  @override
  CommandesRecord rebuild(void Function(CommandesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommandesRecordBuilder toBuilder() =>
      new CommandesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CommandesRecord &&
        nom == other.nom &&
        client == other.client &&
        ref == other.ref &&
        paye == other.paye &&
        mt == other.mt &&
        livreur == other.livreur &&
        livraison == other.livraison &&
        heurecommande == other.heurecommande &&
        heurelivraison == other.heurelivraison &&
        refRide == other.refRide &&
        date == other.date &&
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
                                            $jc($jc(0, nom.hashCode),
                                                client.hashCode),
                                            ref.hashCode),
                                        paye.hashCode),
                                    mt.hashCode),
                                livreur.hashCode),
                            livraison.hashCode),
                        heurecommande.hashCode),
                    heurelivraison.hashCode),
                refRide.hashCode),
            date.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CommandesRecord')
          ..add('nom', nom)
          ..add('client', client)
          ..add('ref', ref)
          ..add('paye', paye)
          ..add('mt', mt)
          ..add('livreur', livreur)
          ..add('livraison', livraison)
          ..add('heurecommande', heurecommande)
          ..add('heurelivraison', heurelivraison)
          ..add('refRide', refRide)
          ..add('date', date)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CommandesRecordBuilder
    implements Builder<CommandesRecord, CommandesRecordBuilder> {
  _$CommandesRecord? _$v;

  String? _nom;
  String? get nom => _$this._nom;
  set nom(String? nom) => _$this._nom = nom;

  DocumentReference<Object?>? _client;
  DocumentReference<Object?>? get client => _$this._client;
  set client(DocumentReference<Object?>? client) => _$this._client = client;

  DocumentReference<Object?>? _ref;
  DocumentReference<Object?>? get ref => _$this._ref;
  set ref(DocumentReference<Object?>? ref) => _$this._ref = ref;

  bool? _paye;
  bool? get paye => _$this._paye;
  set paye(bool? paye) => _$this._paye = paye;

  int? _mt;
  int? get mt => _$this._mt;
  set mt(int? mt) => _$this._mt = mt;

  DocumentReference<Object?>? _livreur;
  DocumentReference<Object?>? get livreur => _$this._livreur;
  set livreur(DocumentReference<Object?>? livreur) => _$this._livreur = livreur;

  bool? _livraison;
  bool? get livraison => _$this._livraison;
  set livraison(bool? livraison) => _$this._livraison = livraison;

  DateTime? _heurecommande;
  DateTime? get heurecommande => _$this._heurecommande;
  set heurecommande(DateTime? heurecommande) =>
      _$this._heurecommande = heurecommande;

  DateTime? _heurelivraison;
  DateTime? get heurelivraison => _$this._heurelivraison;
  set heurelivraison(DateTime? heurelivraison) =>
      _$this._heurelivraison = heurelivraison;

  DocumentReference<Object?>? _refRide;
  DocumentReference<Object?>? get refRide => _$this._refRide;
  set refRide(DocumentReference<Object?>? refRide) => _$this._refRide = refRide;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CommandesRecordBuilder() {
    CommandesRecord._initializeBuilder(this);
  }

  CommandesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nom = $v.nom;
      _client = $v.client;
      _ref = $v.ref;
      _paye = $v.paye;
      _mt = $v.mt;
      _livreur = $v.livreur;
      _livraison = $v.livraison;
      _heurecommande = $v.heurecommande;
      _heurelivraison = $v.heurelivraison;
      _refRide = $v.refRide;
      _date = $v.date;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CommandesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CommandesRecord;
  }

  @override
  void update(void Function(CommandesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CommandesRecord build() => _build();

  _$CommandesRecord _build() {
    final _$result = _$v ??
        new _$CommandesRecord._(
            nom: nom,
            client: client,
            ref: ref,
            paye: paye,
            mt: mt,
            livreur: livreur,
            livraison: livraison,
            heurecommande: heurecommande,
            heurelivraison: heurelivraison,
            refRide: refRide,
            date: date,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
