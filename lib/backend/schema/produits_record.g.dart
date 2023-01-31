// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produits_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProduitsRecord> _$produitsRecordSerializer =
    new _$ProduitsRecordSerializer();

class _$ProduitsRecordSerializer
    implements StructuredSerializer<ProduitsRecord> {
  @override
  final Iterable<Type> types = const [ProduitsRecord, _$ProduitsRecord];
  @override
  final String wireName = 'ProduitsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProduitsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.nom;
    if (value != null) {
      result
        ..add('Nom')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.prix;
    if (value != null) {
      result
        ..add('prix')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
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
    value = object.fav;
    if (value != null) {
      result
        ..add('fav')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.cod;
    if (value != null) {
      result
        ..add('cod')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.dispo;
    if (value != null) {
      result
        ..add('dispo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.vue;
    if (value != null) {
      result
        ..add('vue')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.favoris;
    if (value != null) {
      result
        ..add('favoris')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.nbreAvis;
    if (value != null) {
      result
        ..add('nbreAvis')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.multi;
    if (value != null) {
      result
        ..add('multi')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.prixDemi;
    if (value != null) {
      result
        ..add('prixDemi')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.prixComplet;
    if (value != null) {
      result
        ..add('prixComplet')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.ouv;
    if (value != null) {
      result
        ..add('ouv')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.clo;
    if (value != null) {
      result
        ..add('clo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.defaut;
    if (value != null) {
      result
        ..add('defaut')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.note;
    if (value != null) {
      result
        ..add('note')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    value = object.noteUser;
    if (value != null) {
      result
        ..add('noteUser')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.moyenne;
    if (value != null) {
      result
        ..add('moyenne')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.nbreFav;
    if (value != null) {
      result
        ..add('nbreFav')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.nomDemi;
    if (value != null) {
      result
        ..add('nomDemi')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nomComplet;
    if (value != null) {
      result
        ..add('nomComplet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pourcentage;
    if (value != null) {
      result
        ..add('pourcentage')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.catList;
    if (value != null) {
      result
        ..add('catList')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  ProduitsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProduitsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Nom':
          result.nom = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'prix':
          result.prix = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'fav':
          result.fav = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'cod':
          result.cod = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'dispo':
          result.dispo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'vue':
          result.vue = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'favoris':
          result.favoris.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'nbreAvis':
          result.nbreAvis = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'multi':
          result.multi = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'prixDemi':
          result.prixDemi = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'prixComplet':
          result.prixComplet = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'ouv':
          result.ouv = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'clo':
          result.clo = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'defaut':
          result.defaut = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'note':
          result.note.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(double)]))!
              as BuiltList<Object?>);
          break;
        case 'noteUser':
          result.noteUser.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'moyenne':
          result.moyenne = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'nbreFav':
          result.nbreFav = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'nomDemi':
          result.nomDemi = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nomComplet':
          result.nomComplet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'pourcentage':
          result.pourcentage = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'catList':
          result.catList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
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

class _$ProduitsRecord extends ProduitsRecord {
  @override
  final String? nom;
  @override
  final String? image;
  @override
  final String? description;
  @override
  final String? createdBy;
  @override
  final int? prix;
  @override
  final String? category;
  @override
  final DateTime? date;
  @override
  final bool? fav;
  @override
  final int? cod;
  @override
  final String? dispo;
  @override
  final int? vue;
  @override
  final BuiltList<String>? favoris;
  @override
  final int? nbreAvis;
  @override
  final bool? multi;
  @override
  final int? prixDemi;
  @override
  final int? prixComplet;
  @override
  final DateTime? ouv;
  @override
  final DateTime? clo;
  @override
  final bool? defaut;
  @override
  final BuiltList<double>? note;
  @override
  final BuiltList<String>? noteUser;
  @override
  final double? moyenne;
  @override
  final int? nbreFav;
  @override
  final String? nomDemi;
  @override
  final String? nomComplet;
  @override
  final int? pourcentage;
  @override
  final BuiltList<String>? catList;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ProduitsRecord([void Function(ProduitsRecordBuilder)? updates]) =>
      (new ProduitsRecordBuilder()..update(updates))._build();

  _$ProduitsRecord._(
      {this.nom,
      this.image,
      this.description,
      this.createdBy,
      this.prix,
      this.category,
      this.date,
      this.fav,
      this.cod,
      this.dispo,
      this.vue,
      this.favoris,
      this.nbreAvis,
      this.multi,
      this.prixDemi,
      this.prixComplet,
      this.ouv,
      this.clo,
      this.defaut,
      this.note,
      this.noteUser,
      this.moyenne,
      this.nbreFav,
      this.nomDemi,
      this.nomComplet,
      this.pourcentage,
      this.catList,
      this.ffRef})
      : super._();

  @override
  ProduitsRecord rebuild(void Function(ProduitsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProduitsRecordBuilder toBuilder() =>
      new ProduitsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProduitsRecord &&
        nom == other.nom &&
        image == other.image &&
        description == other.description &&
        createdBy == other.createdBy &&
        prix == other.prix &&
        category == other.category &&
        date == other.date &&
        fav == other.fav &&
        cod == other.cod &&
        dispo == other.dispo &&
        vue == other.vue &&
        favoris == other.favoris &&
        nbreAvis == other.nbreAvis &&
        multi == other.multi &&
        prixDemi == other.prixDemi &&
        prixComplet == other.prixComplet &&
        ouv == other.ouv &&
        clo == other.clo &&
        defaut == other.defaut &&
        note == other.note &&
        noteUser == other.noteUser &&
        moyenne == other.moyenne &&
        nbreFav == other.nbreFav &&
        nomDemi == other.nomDemi &&
        nomComplet == other.nomComplet &&
        pourcentage == other.pourcentage &&
        catList == other.catList &&
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
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, nom.hashCode), image.hashCode), description.hashCode), createdBy.hashCode), prix.hashCode), category.hashCode), date.hashCode), fav.hashCode), cod.hashCode),
                                                                                dispo.hashCode),
                                                                            vue.hashCode),
                                                                        favoris.hashCode),
                                                                    nbreAvis.hashCode),
                                                                multi.hashCode),
                                                            prixDemi.hashCode),
                                                        prixComplet.hashCode),
                                                    ouv.hashCode),
                                                clo.hashCode),
                                            defaut.hashCode),
                                        note.hashCode),
                                    noteUser.hashCode),
                                moyenne.hashCode),
                            nbreFav.hashCode),
                        nomDemi.hashCode),
                    nomComplet.hashCode),
                pourcentage.hashCode),
            catList.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProduitsRecord')
          ..add('nom', nom)
          ..add('image', image)
          ..add('description', description)
          ..add('createdBy', createdBy)
          ..add('prix', prix)
          ..add('category', category)
          ..add('date', date)
          ..add('fav', fav)
          ..add('cod', cod)
          ..add('dispo', dispo)
          ..add('vue', vue)
          ..add('favoris', favoris)
          ..add('nbreAvis', nbreAvis)
          ..add('multi', multi)
          ..add('prixDemi', prixDemi)
          ..add('prixComplet', prixComplet)
          ..add('ouv', ouv)
          ..add('clo', clo)
          ..add('defaut', defaut)
          ..add('note', note)
          ..add('noteUser', noteUser)
          ..add('moyenne', moyenne)
          ..add('nbreFav', nbreFav)
          ..add('nomDemi', nomDemi)
          ..add('nomComplet', nomComplet)
          ..add('pourcentage', pourcentage)
          ..add('catList', catList)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ProduitsRecordBuilder
    implements Builder<ProduitsRecord, ProduitsRecordBuilder> {
  _$ProduitsRecord? _$v;

  String? _nom;
  String? get nom => _$this._nom;
  set nom(String? nom) => _$this._nom = nom;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _createdBy;
  String? get createdBy => _$this._createdBy;
  set createdBy(String? createdBy) => _$this._createdBy = createdBy;

  int? _prix;
  int? get prix => _$this._prix;
  set prix(int? prix) => _$this._prix = prix;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  bool? _fav;
  bool? get fav => _$this._fav;
  set fav(bool? fav) => _$this._fav = fav;

  int? _cod;
  int? get cod => _$this._cod;
  set cod(int? cod) => _$this._cod = cod;

  String? _dispo;
  String? get dispo => _$this._dispo;
  set dispo(String? dispo) => _$this._dispo = dispo;

  int? _vue;
  int? get vue => _$this._vue;
  set vue(int? vue) => _$this._vue = vue;

  ListBuilder<String>? _favoris;
  ListBuilder<String> get favoris =>
      _$this._favoris ??= new ListBuilder<String>();
  set favoris(ListBuilder<String>? favoris) => _$this._favoris = favoris;

  int? _nbreAvis;
  int? get nbreAvis => _$this._nbreAvis;
  set nbreAvis(int? nbreAvis) => _$this._nbreAvis = nbreAvis;

  bool? _multi;
  bool? get multi => _$this._multi;
  set multi(bool? multi) => _$this._multi = multi;

  int? _prixDemi;
  int? get prixDemi => _$this._prixDemi;
  set prixDemi(int? prixDemi) => _$this._prixDemi = prixDemi;

  int? _prixComplet;
  int? get prixComplet => _$this._prixComplet;
  set prixComplet(int? prixComplet) => _$this._prixComplet = prixComplet;

  DateTime? _ouv;
  DateTime? get ouv => _$this._ouv;
  set ouv(DateTime? ouv) => _$this._ouv = ouv;

  DateTime? _clo;
  DateTime? get clo => _$this._clo;
  set clo(DateTime? clo) => _$this._clo = clo;

  bool? _defaut;
  bool? get defaut => _$this._defaut;
  set defaut(bool? defaut) => _$this._defaut = defaut;

  ListBuilder<double>? _note;
  ListBuilder<double> get note => _$this._note ??= new ListBuilder<double>();
  set note(ListBuilder<double>? note) => _$this._note = note;

  ListBuilder<String>? _noteUser;
  ListBuilder<String> get noteUser =>
      _$this._noteUser ??= new ListBuilder<String>();
  set noteUser(ListBuilder<String>? noteUser) => _$this._noteUser = noteUser;

  double? _moyenne;
  double? get moyenne => _$this._moyenne;
  set moyenne(double? moyenne) => _$this._moyenne = moyenne;

  int? _nbreFav;
  int? get nbreFav => _$this._nbreFav;
  set nbreFav(int? nbreFav) => _$this._nbreFav = nbreFav;

  String? _nomDemi;
  String? get nomDemi => _$this._nomDemi;
  set nomDemi(String? nomDemi) => _$this._nomDemi = nomDemi;

  String? _nomComplet;
  String? get nomComplet => _$this._nomComplet;
  set nomComplet(String? nomComplet) => _$this._nomComplet = nomComplet;

  int? _pourcentage;
  int? get pourcentage => _$this._pourcentage;
  set pourcentage(int? pourcentage) => _$this._pourcentage = pourcentage;

  ListBuilder<String>? _catList;
  ListBuilder<String> get catList =>
      _$this._catList ??= new ListBuilder<String>();
  set catList(ListBuilder<String>? catList) => _$this._catList = catList;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ProduitsRecordBuilder() {
    ProduitsRecord._initializeBuilder(this);
  }

  ProduitsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nom = $v.nom;
      _image = $v.image;
      _description = $v.description;
      _createdBy = $v.createdBy;
      _prix = $v.prix;
      _category = $v.category;
      _date = $v.date;
      _fav = $v.fav;
      _cod = $v.cod;
      _dispo = $v.dispo;
      _vue = $v.vue;
      _favoris = $v.favoris?.toBuilder();
      _nbreAvis = $v.nbreAvis;
      _multi = $v.multi;
      _prixDemi = $v.prixDemi;
      _prixComplet = $v.prixComplet;
      _ouv = $v.ouv;
      _clo = $v.clo;
      _defaut = $v.defaut;
      _note = $v.note?.toBuilder();
      _noteUser = $v.noteUser?.toBuilder();
      _moyenne = $v.moyenne;
      _nbreFav = $v.nbreFav;
      _nomDemi = $v.nomDemi;
      _nomComplet = $v.nomComplet;
      _pourcentage = $v.pourcentage;
      _catList = $v.catList?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProduitsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProduitsRecord;
  }

  @override
  void update(void Function(ProduitsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProduitsRecord build() => _build();

  _$ProduitsRecord _build() {
    _$ProduitsRecord _$result;
    try {
      _$result = _$v ??
          new _$ProduitsRecord._(
              nom: nom,
              image: image,
              description: description,
              createdBy: createdBy,
              prix: prix,
              category: category,
              date: date,
              fav: fav,
              cod: cod,
              dispo: dispo,
              vue: vue,
              favoris: _favoris?.build(),
              nbreAvis: nbreAvis,
              multi: multi,
              prixDemi: prixDemi,
              prixComplet: prixComplet,
              ouv: ouv,
              clo: clo,
              defaut: defaut,
              note: _note?.build(),
              noteUser: _noteUser?.build(),
              moyenne: moyenne,
              nbreFav: nbreFav,
              nomDemi: nomDemi,
              nomComplet: nomComplet,
              pourcentage: pourcentage,
              catList: _catList?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'favoris';
        _favoris?.build();

        _$failedField = 'note';
        _note?.build();
        _$failedField = 'noteUser';
        _noteUser?.build();

        _$failedField = 'catList';
        _catList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProduitsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
