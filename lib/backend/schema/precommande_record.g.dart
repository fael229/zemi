// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'precommande_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PrecommandeRecord> _$precommandeRecordSerializer =
    new _$PrecommandeRecordSerializer();

class _$PrecommandeRecordSerializer
    implements StructuredSerializer<PrecommandeRecord> {
  @override
  final Iterable<Type> types = const [PrecommandeRecord, _$PrecommandeRecord];
  @override
  final String wireName = 'PrecommandeRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PrecommandeRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.listecom;
    if (value != null) {
      result
        ..add('listecom')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.refcli;
    if (value != null) {
      result
        ..add('refcli')
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
    value = object.nom;
    if (value != null) {
      result
        ..add('nom')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.statut;
    if (value != null) {
      result
        ..add('statut')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.livrer;
    if (value != null) {
      result
        ..add('livrer')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.dateAjout;
    if (value != null) {
      result
        ..add('dateAjout')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.datepay;
    if (value != null) {
      result
        ..add('datepay')
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
    value = object.livreur;
    if (value != null) {
      result
        ..add('livreur')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.e1;
    if (value != null) {
      result
        ..add('e1')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.e2;
    if (value != null) {
      result
        ..add('e2')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.e3;
    if (value != null) {
      result
        ..add('e3')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.e4;
    if (value != null) {
      result
        ..add('e4')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.e5;
    if (value != null) {
      result
        ..add('e5')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.numero;
    if (value != null) {
      result
        ..add('numero')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.indication;
    if (value != null) {
      result
        ..add('indication')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.attribution;
    if (value != null) {
      result
        ..add('attribution')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.signature;
    if (value != null) {
      result
        ..add('signature')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.commandeSuiviRef;
    if (value != null) {
      result
        ..add('commandeSuiviRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.heurelivre;
    if (value != null) {
      result
        ..add('heurelivre')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.soustot;
    if (value != null) {
      result
        ..add('soustot')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.totalpaye;
    if (value != null) {
      result
        ..add('totalpaye')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.aboLivre;
    if (value != null) {
      result
        ..add('aboLivre')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.positionClient;
    if (value != null) {
      result
        ..add('positionClient')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.positionLivreur;
    if (value != null) {
      result
        ..add('positionLivreur')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.jour;
    if (value != null) {
      result
        ..add('jour')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lieu2;
    if (value != null) {
      result
        ..add('lieu2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.refride;
    if (value != null) {
      result
        ..add('refride')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.lan;
    if (value != null) {
      result
        ..add('lan')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(LatLng)])));
    }
    value = object.refcliList;
    if (value != null) {
      result
        ..add('refcliList')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.num;
    if (value != null) {
      result
        ..add('num')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.clienCoordonn;
    if (value != null) {
      result
        ..add('clienCoordonn')
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
  PrecommandeRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PrecommandeRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'listecom':
          result.listecom.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'refcli':
          result.refcli = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'nom':
          result.nom = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'statut':
          result.statut = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'livrer':
          result.livrer = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'dateAjout':
          result.dateAjout = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'datepay':
          result.datepay = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'lieu':
          result.lieu = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'livreur':
          result.livreur = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'e1':
          result.e1 = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'e2':
          result.e2 = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'e3':
          result.e3 = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'e4':
          result.e4 = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'e5':
          result.e5 = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'numero':
          result.numero = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'indication':
          result.indication = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'attribution':
          result.attribution = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'signature':
          result.signature = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'commandeSuiviRef':
          result.commandeSuiviRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'heurelivre':
          result.heurelivre = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'soustot':
          result.soustot = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'totalpaye':
          result.totalpaye = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'aboLivre':
          result.aboLivre = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'positionClient':
          result.positionClient = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'positionLivreur':
          result.positionLivreur = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'jour':
          result.jour = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lieu2':
          result.lieu2 = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'refride':
          result.refride = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'lan':
          result.lan.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(LatLng)]))!
              as BuiltList<Object?>);
          break;
        case 'refcliList':
          result.refcliList.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'num':
          result.num = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'clienCoordonn':
          result.clienCoordonn = serializers.deserialize(value,
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

class _$PrecommandeRecord extends PrecommandeRecord {
  @override
  final BuiltList<DocumentReference<Object?>>? listecom;
  @override
  final DocumentReference<Object?>? refcli;
  @override
  final DateTime? date;
  @override
  final String? nom;
  @override
  final String? statut;
  @override
  final bool? livrer;
  @override
  final DateTime? dateAjout;
  @override
  final DateTime? datepay;
  @override
  final String? lieu;
  @override
  final DocumentReference<Object?>? livreur;
  @override
  final bool? e1;
  @override
  final bool? e2;
  @override
  final bool? e3;
  @override
  final bool? e4;
  @override
  final bool? e5;
  @override
  final String? numero;
  @override
  final String? indication;
  @override
  final bool? attribution;
  @override
  final String? signature;
  @override
  final DocumentReference<Object?>? commandeSuiviRef;
  @override
  final DateTime? heurelivre;
  @override
  final int? soustot;
  @override
  final int? totalpaye;
  @override
  final bool? aboLivre;
  @override
  final LatLng? positionClient;
  @override
  final LatLng? positionLivreur;
  @override
  final String? jour;
  @override
  final LatLng? lieu2;
  @override
  final DocumentReference<Object?>? refride;
  @override
  final BuiltList<LatLng>? lan;
  @override
  final BuiltList<DocumentReference<Object?>>? refcliList;
  @override
  final String? num;
  @override
  final bool? clienCoordonn;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PrecommandeRecord(
          [void Function(PrecommandeRecordBuilder)? updates]) =>
      (new PrecommandeRecordBuilder()..update(updates))._build();

  _$PrecommandeRecord._(
      {this.listecom,
      this.refcli,
      this.date,
      this.nom,
      this.statut,
      this.livrer,
      this.dateAjout,
      this.datepay,
      this.lieu,
      this.livreur,
      this.e1,
      this.e2,
      this.e3,
      this.e4,
      this.e5,
      this.numero,
      this.indication,
      this.attribution,
      this.signature,
      this.commandeSuiviRef,
      this.heurelivre,
      this.soustot,
      this.totalpaye,
      this.aboLivre,
      this.positionClient,
      this.positionLivreur,
      this.jour,
      this.lieu2,
      this.refride,
      this.lan,
      this.refcliList,
      this.num,
      this.clienCoordonn,
      this.ffRef})
      : super._();

  @override
  PrecommandeRecord rebuild(void Function(PrecommandeRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PrecommandeRecordBuilder toBuilder() =>
      new PrecommandeRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PrecommandeRecord &&
        listecom == other.listecom &&
        refcli == other.refcli &&
        date == other.date &&
        nom == other.nom &&
        statut == other.statut &&
        livrer == other.livrer &&
        dateAjout == other.dateAjout &&
        datepay == other.datepay &&
        lieu == other.lieu &&
        livreur == other.livreur &&
        e1 == other.e1 &&
        e2 == other.e2 &&
        e3 == other.e3 &&
        e4 == other.e4 &&
        e5 == other.e5 &&
        numero == other.numero &&
        indication == other.indication &&
        attribution == other.attribution &&
        signature == other.signature &&
        commandeSuiviRef == other.commandeSuiviRef &&
        heurelivre == other.heurelivre &&
        soustot == other.soustot &&
        totalpaye == other.totalpaye &&
        aboLivre == other.aboLivre &&
        positionClient == other.positionClient &&
        positionLivreur == other.positionLivreur &&
        jour == other.jour &&
        lieu2 == other.lieu2 &&
        refride == other.refride &&
        lan == other.lan &&
        refcliList == other.refcliList &&
        num == other.num &&
        clienCoordonn == other.clienCoordonn &&
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
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, listecom.hashCode), refcli.hashCode), date.hashCode), nom.hashCode), statut.hashCode), livrer.hashCode), dateAjout.hashCode), datepay.hashCode), lieu.hashCode), livreur.hashCode), e1.hashCode), e2.hashCode), e3.hashCode), e4.hashCode), e5.hashCode),
                                                                                numero.hashCode),
                                                                            indication.hashCode),
                                                                        attribution.hashCode),
                                                                    signature.hashCode),
                                                                commandeSuiviRef.hashCode),
                                                            heurelivre.hashCode),
                                                        soustot.hashCode),
                                                    totalpaye.hashCode),
                                                aboLivre.hashCode),
                                            positionClient.hashCode),
                                        positionLivreur.hashCode),
                                    jour.hashCode),
                                lieu2.hashCode),
                            refride.hashCode),
                        lan.hashCode),
                    refcliList.hashCode),
                num.hashCode),
            clienCoordonn.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PrecommandeRecord')
          ..add('listecom', listecom)
          ..add('refcli', refcli)
          ..add('date', date)
          ..add('nom', nom)
          ..add('statut', statut)
          ..add('livrer', livrer)
          ..add('dateAjout', dateAjout)
          ..add('datepay', datepay)
          ..add('lieu', lieu)
          ..add('livreur', livreur)
          ..add('e1', e1)
          ..add('e2', e2)
          ..add('e3', e3)
          ..add('e4', e4)
          ..add('e5', e5)
          ..add('numero', numero)
          ..add('indication', indication)
          ..add('attribution', attribution)
          ..add('signature', signature)
          ..add('commandeSuiviRef', commandeSuiviRef)
          ..add('heurelivre', heurelivre)
          ..add('soustot', soustot)
          ..add('totalpaye', totalpaye)
          ..add('aboLivre', aboLivre)
          ..add('positionClient', positionClient)
          ..add('positionLivreur', positionLivreur)
          ..add('jour', jour)
          ..add('lieu2', lieu2)
          ..add('refride', refride)
          ..add('lan', lan)
          ..add('refcliList', refcliList)
          ..add('num', num)
          ..add('clienCoordonn', clienCoordonn)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PrecommandeRecordBuilder
    implements Builder<PrecommandeRecord, PrecommandeRecordBuilder> {
  _$PrecommandeRecord? _$v;

  ListBuilder<DocumentReference<Object?>>? _listecom;
  ListBuilder<DocumentReference<Object?>> get listecom =>
      _$this._listecom ??= new ListBuilder<DocumentReference<Object?>>();
  set listecom(ListBuilder<DocumentReference<Object?>>? listecom) =>
      _$this._listecom = listecom;

  DocumentReference<Object?>? _refcli;
  DocumentReference<Object?>? get refcli => _$this._refcli;
  set refcli(DocumentReference<Object?>? refcli) => _$this._refcli = refcli;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  String? _nom;
  String? get nom => _$this._nom;
  set nom(String? nom) => _$this._nom = nom;

  String? _statut;
  String? get statut => _$this._statut;
  set statut(String? statut) => _$this._statut = statut;

  bool? _livrer;
  bool? get livrer => _$this._livrer;
  set livrer(bool? livrer) => _$this._livrer = livrer;

  DateTime? _dateAjout;
  DateTime? get dateAjout => _$this._dateAjout;
  set dateAjout(DateTime? dateAjout) => _$this._dateAjout = dateAjout;

  DateTime? _datepay;
  DateTime? get datepay => _$this._datepay;
  set datepay(DateTime? datepay) => _$this._datepay = datepay;

  String? _lieu;
  String? get lieu => _$this._lieu;
  set lieu(String? lieu) => _$this._lieu = lieu;

  DocumentReference<Object?>? _livreur;
  DocumentReference<Object?>? get livreur => _$this._livreur;
  set livreur(DocumentReference<Object?>? livreur) => _$this._livreur = livreur;

  bool? _e1;
  bool? get e1 => _$this._e1;
  set e1(bool? e1) => _$this._e1 = e1;

  bool? _e2;
  bool? get e2 => _$this._e2;
  set e2(bool? e2) => _$this._e2 = e2;

  bool? _e3;
  bool? get e3 => _$this._e3;
  set e3(bool? e3) => _$this._e3 = e3;

  bool? _e4;
  bool? get e4 => _$this._e4;
  set e4(bool? e4) => _$this._e4 = e4;

  bool? _e5;
  bool? get e5 => _$this._e5;
  set e5(bool? e5) => _$this._e5 = e5;

  String? _numero;
  String? get numero => _$this._numero;
  set numero(String? numero) => _$this._numero = numero;

  String? _indication;
  String? get indication => _$this._indication;
  set indication(String? indication) => _$this._indication = indication;

  bool? _attribution;
  bool? get attribution => _$this._attribution;
  set attribution(bool? attribution) => _$this._attribution = attribution;

  String? _signature;
  String? get signature => _$this._signature;
  set signature(String? signature) => _$this._signature = signature;

  DocumentReference<Object?>? _commandeSuiviRef;
  DocumentReference<Object?>? get commandeSuiviRef => _$this._commandeSuiviRef;
  set commandeSuiviRef(DocumentReference<Object?>? commandeSuiviRef) =>
      _$this._commandeSuiviRef = commandeSuiviRef;

  DateTime? _heurelivre;
  DateTime? get heurelivre => _$this._heurelivre;
  set heurelivre(DateTime? heurelivre) => _$this._heurelivre = heurelivre;

  int? _soustot;
  int? get soustot => _$this._soustot;
  set soustot(int? soustot) => _$this._soustot = soustot;

  int? _totalpaye;
  int? get totalpaye => _$this._totalpaye;
  set totalpaye(int? totalpaye) => _$this._totalpaye = totalpaye;

  bool? _aboLivre;
  bool? get aboLivre => _$this._aboLivre;
  set aboLivre(bool? aboLivre) => _$this._aboLivre = aboLivre;

  LatLng? _positionClient;
  LatLng? get positionClient => _$this._positionClient;
  set positionClient(LatLng? positionClient) =>
      _$this._positionClient = positionClient;

  LatLng? _positionLivreur;
  LatLng? get positionLivreur => _$this._positionLivreur;
  set positionLivreur(LatLng? positionLivreur) =>
      _$this._positionLivreur = positionLivreur;

  String? _jour;
  String? get jour => _$this._jour;
  set jour(String? jour) => _$this._jour = jour;

  LatLng? _lieu2;
  LatLng? get lieu2 => _$this._lieu2;
  set lieu2(LatLng? lieu2) => _$this._lieu2 = lieu2;

  DocumentReference<Object?>? _refride;
  DocumentReference<Object?>? get refride => _$this._refride;
  set refride(DocumentReference<Object?>? refride) => _$this._refride = refride;

  ListBuilder<LatLng>? _lan;
  ListBuilder<LatLng> get lan => _$this._lan ??= new ListBuilder<LatLng>();
  set lan(ListBuilder<LatLng>? lan) => _$this._lan = lan;

  ListBuilder<DocumentReference<Object?>>? _refcliList;
  ListBuilder<DocumentReference<Object?>> get refcliList =>
      _$this._refcliList ??= new ListBuilder<DocumentReference<Object?>>();
  set refcliList(ListBuilder<DocumentReference<Object?>>? refcliList) =>
      _$this._refcliList = refcliList;

  String? _num;
  String? get num => _$this._num;
  set num(String? num) => _$this._num = num;

  bool? _clienCoordonn;
  bool? get clienCoordonn => _$this._clienCoordonn;
  set clienCoordonn(bool? clienCoordonn) =>
      _$this._clienCoordonn = clienCoordonn;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PrecommandeRecordBuilder() {
    PrecommandeRecord._initializeBuilder(this);
  }

  PrecommandeRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _listecom = $v.listecom?.toBuilder();
      _refcli = $v.refcli;
      _date = $v.date;
      _nom = $v.nom;
      _statut = $v.statut;
      _livrer = $v.livrer;
      _dateAjout = $v.dateAjout;
      _datepay = $v.datepay;
      _lieu = $v.lieu;
      _livreur = $v.livreur;
      _e1 = $v.e1;
      _e2 = $v.e2;
      _e3 = $v.e3;
      _e4 = $v.e4;
      _e5 = $v.e5;
      _numero = $v.numero;
      _indication = $v.indication;
      _attribution = $v.attribution;
      _signature = $v.signature;
      _commandeSuiviRef = $v.commandeSuiviRef;
      _heurelivre = $v.heurelivre;
      _soustot = $v.soustot;
      _totalpaye = $v.totalpaye;
      _aboLivre = $v.aboLivre;
      _positionClient = $v.positionClient;
      _positionLivreur = $v.positionLivreur;
      _jour = $v.jour;
      _lieu2 = $v.lieu2;
      _refride = $v.refride;
      _lan = $v.lan?.toBuilder();
      _refcliList = $v.refcliList?.toBuilder();
      _num = $v.num;
      _clienCoordonn = $v.clienCoordonn;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PrecommandeRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PrecommandeRecord;
  }

  @override
  void update(void Function(PrecommandeRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PrecommandeRecord build() => _build();

  _$PrecommandeRecord _build() {
    _$PrecommandeRecord _$result;
    try {
      _$result = _$v ??
          new _$PrecommandeRecord._(
              listecom: _listecom?.build(),
              refcli: refcli,
              date: date,
              nom: nom,
              statut: statut,
              livrer: livrer,
              dateAjout: dateAjout,
              datepay: datepay,
              lieu: lieu,
              livreur: livreur,
              e1: e1,
              e2: e2,
              e3: e3,
              e4: e4,
              e5: e5,
              numero: numero,
              indication: indication,
              attribution: attribution,
              signature: signature,
              commandeSuiviRef: commandeSuiviRef,
              heurelivre: heurelivre,
              soustot: soustot,
              totalpaye: totalpaye,
              aboLivre: aboLivre,
              positionClient: positionClient,
              positionLivreur: positionLivreur,
              jour: jour,
              lieu2: lieu2,
              refride: refride,
              lan: _lan?.build(),
              refcliList: _refcliList?.build(),
              num: num,
              clienCoordonn: clienCoordonn,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'listecom';
        _listecom?.build();

        _$failedField = 'lan';
        _lan?.build();
        _$failedField = 'refcliList';
        _refcliList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PrecommandeRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
