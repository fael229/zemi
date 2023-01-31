// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paiement_rapp_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PaiementRappRecord> _$paiementRappRecordSerializer =
    new _$PaiementRappRecordSerializer();

class _$PaiementRappRecordSerializer
    implements StructuredSerializer<PaiementRappRecord> {
  @override
  final Iterable<Type> types = const [PaiementRappRecord, _$PaiementRappRecord];
  @override
  final String wireName = 'PaiementRappRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PaiementRappRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.prenom;
    if (value != null) {
      result
        ..add('prenom')
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
    value = object.nomProduit;
    if (value != null) {
      result
        ..add('nomProduit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.montant;
    if (value != null) {
      result
        ..add('montant')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tel;
    if (value != null) {
      result
        ..add('tel')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reseau;
    if (value != null) {
      result
        ..add('reseau')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.time;
    if (value != null) {
      result
        ..add('time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.lien;
    if (value != null) {
      result
        ..add('lien')
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
  PaiementRappRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PaiementRappRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'prenom':
          result.prenom = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nom':
          result.nom = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nomProduit':
          result.nomProduit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'montant':
          result.montant = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tel':
          result.tel = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'reseau':
          result.reseau = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'lien':
          result.lien = serializers.deserialize(value,
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

class _$PaiementRappRecord extends PaiementRappRecord {
  @override
  final String? prenom;
  @override
  final String? nom;
  @override
  final String? nomProduit;
  @override
  final double? montant;
  @override
  final String? email;
  @override
  final String? tel;
  @override
  final String? reseau;
  @override
  final DateTime? time;
  @override
  final String? lien;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PaiementRappRecord(
          [void Function(PaiementRappRecordBuilder)? updates]) =>
      (new PaiementRappRecordBuilder()..update(updates))._build();

  _$PaiementRappRecord._(
      {this.prenom,
      this.nom,
      this.nomProduit,
      this.montant,
      this.email,
      this.tel,
      this.reseau,
      this.time,
      this.lien,
      this.ffRef})
      : super._();

  @override
  PaiementRappRecord rebuild(
          void Function(PaiementRappRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaiementRappRecordBuilder toBuilder() =>
      new PaiementRappRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaiementRappRecord &&
        prenom == other.prenom &&
        nom == other.nom &&
        nomProduit == other.nomProduit &&
        montant == other.montant &&
        email == other.email &&
        tel == other.tel &&
        reseau == other.reseau &&
        time == other.time &&
        lien == other.lien &&
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
                                $jc($jc($jc(0, prenom.hashCode), nom.hashCode),
                                    nomProduit.hashCode),
                                montant.hashCode),
                            email.hashCode),
                        tel.hashCode),
                    reseau.hashCode),
                time.hashCode),
            lien.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaiementRappRecord')
          ..add('prenom', prenom)
          ..add('nom', nom)
          ..add('nomProduit', nomProduit)
          ..add('montant', montant)
          ..add('email', email)
          ..add('tel', tel)
          ..add('reseau', reseau)
          ..add('time', time)
          ..add('lien', lien)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PaiementRappRecordBuilder
    implements Builder<PaiementRappRecord, PaiementRappRecordBuilder> {
  _$PaiementRappRecord? _$v;

  String? _prenom;
  String? get prenom => _$this._prenom;
  set prenom(String? prenom) => _$this._prenom = prenom;

  String? _nom;
  String? get nom => _$this._nom;
  set nom(String? nom) => _$this._nom = nom;

  String? _nomProduit;
  String? get nomProduit => _$this._nomProduit;
  set nomProduit(String? nomProduit) => _$this._nomProduit = nomProduit;

  double? _montant;
  double? get montant => _$this._montant;
  set montant(double? montant) => _$this._montant = montant;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _tel;
  String? get tel => _$this._tel;
  set tel(String? tel) => _$this._tel = tel;

  String? _reseau;
  String? get reseau => _$this._reseau;
  set reseau(String? reseau) => _$this._reseau = reseau;

  DateTime? _time;
  DateTime? get time => _$this._time;
  set time(DateTime? time) => _$this._time = time;

  String? _lien;
  String? get lien => _$this._lien;
  set lien(String? lien) => _$this._lien = lien;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PaiementRappRecordBuilder() {
    PaiementRappRecord._initializeBuilder(this);
  }

  PaiementRappRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _prenom = $v.prenom;
      _nom = $v.nom;
      _nomProduit = $v.nomProduit;
      _montant = $v.montant;
      _email = $v.email;
      _tel = $v.tel;
      _reseau = $v.reseau;
      _time = $v.time;
      _lien = $v.lien;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaiementRappRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PaiementRappRecord;
  }

  @override
  void update(void Function(PaiementRappRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaiementRappRecord build() => _build();

  _$PaiementRappRecord _build() {
    final _$result = _$v ??
        new _$PaiementRappRecord._(
            prenom: prenom,
            nom: nom,
            nomProduit: nomProduit,
            montant: montant,
            email: email,
            tel: tel,
            reseau: reseau,
            time: time,
            lien: lien,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
