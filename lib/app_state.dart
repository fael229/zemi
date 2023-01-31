import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _favories = prefs.getStringList('ff_favories') ?? _favories;
    _favPrix =
        prefs.getStringList('ff_favPrix')?.map(int.parse).toList() ?? _favPrix;
    _idCart = prefs.getStringList('ff_idCart') ?? _idCart;
    _catname = prefs.getStringList('ff_catname') ?? _catname;
    _listAchat = prefs.getStringList('ff_listAchat') ?? _listAchat;
    _hash = prefs.getString('ff_hash') ?? _hash;
    _hashList = prefs.getStringList('ff_hashList') ?? _hashList;
    _cod = prefs.getInt('ff_cod') ?? _cod;
    _nom = prefs.getString('ff_nom') ?? _nom;
    _prenom = prefs.getString('ff_prenom') ?? _prenom;
    _email = prefs.getString('ff_email') ?? _email;
    _tel = prefs.getString('ff_tel') ?? _tel;
    _IDFeda = prefs.getString('ff_IDFeda') ?? _IDFeda;
    _url = prefs.getString('ff_url') ?? _url;
    _checkoutTot = prefs.getInt('ff_checkoutTot') ?? _checkoutTot;
    _price = prefs.getStringList('ff_price')?.map(int.parse).toList() ?? _price;
    _onBoardingView3 = prefs.getBool('ff_onBoardingView3') ?? _onBoardingView3;
    _isActive = prefs.getBool('ff_isActive') ?? _isActive;
    _menu = prefs.getString('ff_menu') ?? _menu;
    _etreLivreur = prefs.getBool('ff_etreLivreur') ?? _etreLivreur;
    _prix = prefs.getInt('ff_prix') ?? _prix;
    _multi = prefs.getBool('ff_multi') ?? _multi;
    _prixDefaut = prefs.getBool('ff_prixDefaut') ?? _prixDefaut;
    _panieRef =
        prefs.getStringList('ff_panieRef')?.map((path) => path.ref).toList() ??
            _panieRef;
    _paiementEtape = prefs.getBool('ff_paiementEtape') ?? _paiementEtape;
    _refPrep = prefs.getString('ff_refPrep')?.ref ?? _refPrep;
    if (prefs.containsKey('ff_statuspaiement')) {
      try {
        _statuspaiement =
            jsonDecode(prefs.getString('ff_statuspaiement') ?? '');
      } catch (e) {
        print("Can't decode persisted json. Error: $e.");
      }
    }

    _indication = prefs.getString('ff_indication') ?? _indication;
    _commande = prefs.getBool('ff_commande') ?? _commande;
    _complet = prefs.getBool('ff_complet') ?? _complet;
    _abonnements = prefs
            .getStringList('ff_abonnements')
            ?.map((path) => path.ref)
            .toList() ??
        _abonnements;
    _lundi = prefs.getString('ff_lundi') ?? _lundi;
    _mardi = prefs.getString('ff_mardi') ?? _mardi;
    _mercredi = prefs.getString('ff_mercredi') ?? _mercredi;
    _jeudi = prefs.getString('ff_jeudi') ?? _jeudi;
    _vendredi = prefs.getString('ff_vendredi') ?? _vendredi;
    _samedi = prefs.getString('ff_samedi') ?? _samedi;
    _dimanche = prefs.getString('ff_dimanche') ?? _dimanche;
    _aboref =
        prefs.getStringList('ff_aboref')?.map((path) => path.ref).toList() ??
            _aboref;
    _lundi1 = prefs.getStringList('ff_lundi1') ?? _lundi1;
    _mardi1 = prefs.getStringList('ff_mardi1') ?? _mardi1;
    _mercredi1 = prefs.getStringList('ff_mercredi1') ?? _mercredi1;
    _jeudi1 = prefs.getStringList('ff_jeudi1') ?? _jeudi1;
    _vendredi1 = prefs.getStringList('ff_vendredi1') ?? _vendredi1;
    _samedi1 = prefs.getStringList('ff_samedi1') ?? _samedi1;
    _dimanche1 = prefs.getStringList('ff_dimanche1') ?? _dimanche1;
    _nbrelundi = prefs.getInt('ff_nbrelundi') ?? _nbrelundi;
    _nbremardi = prefs.getInt('ff_nbremardi') ?? _nbremardi;
    _nbremercredi = prefs.getInt('ff_nbremercredi') ?? _nbremercredi;
    _nbrejeudi = prefs.getInt('ff_nbrejeudi') ?? _nbrejeudi;
    _nbrevendredi = prefs.getInt('ff_nbrevendredi') ?? _nbrevendredi;
    _nbresamedi = prefs.getInt('ff_nbresamedi') ?? _nbresamedi;
    _nbredimanche = prefs.getInt('ff_nbredimanche') ?? _nbredimanche;
    _reflundi =
        prefs.getStringList('ff_reflundi')?.map((path) => path.ref).toList() ??
            _reflundi;
    _refmardi =
        prefs.getStringList('ff_refmardi')?.map((path) => path.ref).toList() ??
            _refmardi;
    _refmercredi = prefs
            .getStringList('ff_refmercredi')
            ?.map((path) => path.ref)
            .toList() ??
        _refmercredi;
    _refjeudi =
        prefs.getStringList('ff_refjeudi')?.map((path) => path.ref).toList() ??
            _refjeudi;
    _refvendredi = prefs
            .getStringList('ff_refvendredi')
            ?.map((path) => path.ref)
            .toList() ??
        _refvendredi;
    _refsamedi =
        prefs.getStringList('ff_refsamedi')?.map((path) => path.ref).toList() ??
            _refsamedi;
    _refdimanche = prefs
            .getStringList('ff_refdimanche')
            ?.map((path) => path.ref)
            .toList() ??
        _refdimanche;
    _aboRef2 =
        prefs.getStringList('ff_aboRef2')?.map((path) => path.ref).toList() ??
            _aboRef2;
    _id = prefs.getStringList('ff_id') ?? _id;
    _emailz = prefs.getString('ff_emailz') ?? _emailz;
    _pass = prefs.getString('ff_pass') ?? _pass;
    _momo = prefs.getString('ff_momo') ?? _momo;
    _reseau = prefs.getString('ff_reseau') ?? _reseau;
    _joignable = prefs.getString('ff_joignable') ?? _joignable;
    _note = prefs.getDouble('ff_note') ?? _note;
    _ouv = prefs.containsKey('ff_ouv')
        ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_ouv')!)
        : null;
    _clo = prefs.containsKey('ff_clo')
        ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_clo')!)
        : null;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _favories = [];
  List<String> get favories => _favories;
  set favories(List<String> _value) {
    _favories = _value;
    prefs.setStringList('ff_favories', _value);
  }

  void addToFavories(String _value) {
    _favories.add(_value);
    prefs.setStringList('ff_favories', _favories);
  }

  void removeFromFavories(String _value) {
    _favories.remove(_value);
    prefs.setStringList('ff_favories', _favories);
  }

  List<int> _favPrix = [];
  List<int> get favPrix => _favPrix;
  set favPrix(List<int> _value) {
    _favPrix = _value;
    prefs.setStringList('ff_favPrix', _value.map((x) => x.toString()).toList());
  }

  void addToFavPrix(int _value) {
    _favPrix.add(_value);
    prefs.setStringList(
        'ff_favPrix', _favPrix.map((x) => x.toString()).toList());
  }

  void removeFromFavPrix(int _value) {
    _favPrix.remove(_value);
    prefs.setStringList(
        'ff_favPrix', _favPrix.map((x) => x.toString()).toList());
  }

  List<String> _idCart = [];
  List<String> get idCart => _idCart;
  set idCart(List<String> _value) {
    _idCart = _value;
    prefs.setStringList('ff_idCart', _value);
  }

  void addToIdCart(String _value) {
    _idCart.add(_value);
    prefs.setStringList('ff_idCart', _idCart);
  }

  void removeFromIdCart(String _value) {
    _idCart.remove(_value);
    prefs.setStringList('ff_idCart', _idCart);
  }

  List<String> _catname = [];
  List<String> get catname => _catname;
  set catname(List<String> _value) {
    _catname = _value;
    prefs.setStringList('ff_catname', _value);
  }

  void addToCatname(String _value) {
    _catname.add(_value);
    prefs.setStringList('ff_catname', _catname);
  }

  void removeFromCatname(String _value) {
    _catname.remove(_value);
    prefs.setStringList('ff_catname', _catname);
  }

  List<String> _listAchat = [];
  List<String> get listAchat => _listAchat;
  set listAchat(List<String> _value) {
    _listAchat = _value;
    prefs.setStringList('ff_listAchat', _value);
  }

  void addToListAchat(String _value) {
    _listAchat.add(_value);
    prefs.setStringList('ff_listAchat', _listAchat);
  }

  void removeFromListAchat(String _value) {
    _listAchat.remove(_value);
    prefs.setStringList('ff_listAchat', _listAchat);
  }

  String _hash = '';
  String get hash => _hash;
  set hash(String _value) {
    _hash = _value;
    prefs.setString('ff_hash', _value);
  }

  List<String> _hashList = [];
  List<String> get hashList => _hashList;
  set hashList(List<String> _value) {
    _hashList = _value;
    prefs.setStringList('ff_hashList', _value);
  }

  void addToHashList(String _value) {
    _hashList.add(_value);
    prefs.setStringList('ff_hashList', _hashList);
  }

  void removeFromHashList(String _value) {
    _hashList.remove(_value);
    prefs.setStringList('ff_hashList', _hashList);
  }

  int _cod = 0;
  int get cod => _cod;
  set cod(int _value) {
    _cod = _value;
    prefs.setInt('ff_cod', _value);
  }

  String _nom = '';
  String get nom => _nom;
  set nom(String _value) {
    _nom = _value;
    prefs.setString('ff_nom', _value);
  }

  String _prenom = '';
  String get prenom => _prenom;
  set prenom(String _value) {
    _prenom = _value;
    prefs.setString('ff_prenom', _value);
  }

  String _email = '';
  String get email => _email;
  set email(String _value) {
    _email = _value;
    prefs.setString('ff_email', _value);
  }

  String _tel = '';
  String get tel => _tel;
  set tel(String _value) {
    _tel = _value;
    prefs.setString('ff_tel', _value);
  }

  String _IDFeda = '';
  String get IDFeda => _IDFeda;
  set IDFeda(String _value) {
    _IDFeda = _value;
    prefs.setString('ff_IDFeda', _value);
  }

  String _url = '';
  String get url => _url;
  set url(String _value) {
    _url = _value;
    prefs.setString('ff_url', _value);
  }

  int _checkoutTot = 0;
  int get checkoutTot => _checkoutTot;
  set checkoutTot(int _value) {
    _checkoutTot = _value;
    prefs.setInt('ff_checkoutTot', _value);
  }

  List<int> _price = [];
  List<int> get price => _price;
  set price(List<int> _value) {
    _price = _value;
    prefs.setStringList('ff_price', _value.map((x) => x.toString()).toList());
  }

  void addToPrice(int _value) {
    _price.add(_value);
    prefs.setStringList('ff_price', _price.map((x) => x.toString()).toList());
  }

  void removeFromPrice(int _value) {
    _price.remove(_value);
    prefs.setStringList('ff_price', _price.map((x) => x.toString()).toList());
  }

  bool _onBoardingView3 = false;
  bool get onBoardingView3 => _onBoardingView3;
  set onBoardingView3(bool _value) {
    _onBoardingView3 = _value;
    prefs.setBool('ff_onBoardingView3', _value);
  }

  bool _isActive = false;
  bool get isActive => _isActive;
  set isActive(bool _value) {
    _isActive = _value;
    prefs.setBool('ff_isActive', _value);
  }

  String _menu = '';
  String get menu => _menu;
  set menu(String _value) {
    _menu = _value;
    prefs.setString('ff_menu', _value);
  }

  Color _color = Color(4294732375);
  Color get color => _color;
  set color(Color _value) {
    _color = _value;
  }

  bool _etreLivreur = false;
  bool get etreLivreur => _etreLivreur;
  set etreLivreur(bool _value) {
    _etreLivreur = _value;
    prefs.setBool('ff_etreLivreur', _value);
  }

  int _prix = 0;
  int get prix => _prix;
  set prix(int _value) {
    _prix = _value;
    prefs.setInt('ff_prix', _value);
  }

  bool _multi = true;
  bool get multi => _multi;
  set multi(bool _value) {
    _multi = _value;
    prefs.setBool('ff_multi', _value);
  }

  DocumentReference? _refFav;
  DocumentReference? get refFav => _refFav;
  set refFav(DocumentReference? _value) {
    _refFav = _value;
  }

  bool _prixDefaut = true;
  bool get prixDefaut => _prixDefaut;
  set prixDefaut(bool _value) {
    _prixDefaut = _value;
    prefs.setBool('ff_prixDefaut', _value);
  }

  int _qty = 0;
  int get qty => _qty;
  set qty(int _value) {
    _qty = _value;
  }

  List<DocumentReference> _panieRef = [];
  List<DocumentReference> get panieRef => _panieRef;
  set panieRef(List<DocumentReference> _value) {
    _panieRef = _value;
    prefs.setStringList('ff_panieRef', _value.map((x) => x.path).toList());
  }

  void addToPanieRef(DocumentReference _value) {
    _panieRef.add(_value);
    prefs.setStringList('ff_panieRef', _panieRef.map((x) => x.path).toList());
  }

  void removeFromPanieRef(DocumentReference _value) {
    _panieRef.remove(_value);
    prefs.setStringList('ff_panieRef', _panieRef.map((x) => x.path).toList());
  }

  bool _paiementEtape = false;
  bool get paiementEtape => _paiementEtape;
  set paiementEtape(bool _value) {
    _paiementEtape = _value;
    prefs.setBool('ff_paiementEtape', _value);
  }

  DocumentReference? _refPrep;
  DocumentReference? get refPrep => _refPrep;
  set refPrep(DocumentReference? _value) {
    _refPrep = _value;
    _value != null
        ? prefs.setString('ff_refPrep', _value.path)
        : prefs.remove('ff_refPrep');
  }

  dynamic _statuspaiement = jsonDecode(
      '{\"v1/transaction\":{\"klass\":\"v1/transaction\",\"id\":64730704,\"reference\":\"trx_sos_1666953267748\",\"amount\":100,\"description\":\"yyyyyyyyyyyyy\",\"callback_url\":\"https://maplateforme.com/callback\",\"status\":\"approved\",\"customer_id\":1344099,\"currency_id\":1,\"mode\":\"mtn\",\"operation\":\"payment\",\"metadata\":{\"paid_customer\":{\"id\":1344099,\"firstname\":\"hdddddddddddrrrrrrrrr\",\"lastname\":\"rrrrrrrrrrrrrrrrrrrrr\",\"email\":\"ddddddddddd@ffffffffffff.com\",\"account_id\":7755,\"deleted_at\":null,\"created_at\":\"2022-08-26T13:22:19.920Z\",\"updated_at\":\"2022-08-26T13:22:19.920Z\",\"phone_number_id\":55599504},\"transfer_schedule_jobid\":\"08f3663c9964bc430268341a\"},\"commission\":\"0.029\",\"fees\":3,\"fixed_commission\":0,\"amount_transferred\":100,\"created_at\":\"2022-10-28T10:34:27.748Z\",\"updated_at\":\"2022-10-28T10:36:55.362Z\",\"approved_at\":\"2022-10-28T10:36:53.859Z\",\"canceled_at\":null,\"declined_at\":null,\"refunded_at\":null,\"transferred_at\":null,\"deleted_at\":null,\"last_error_code\":\"API_ERROR\",\"custom_metadata\":null,\"amount_debited\":103,\"receipt_url\":\"https://api.fedapay.com/v1/transactions/receipt?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjY0NzMwNzA0LCJleHAiOjE2NjcwMzk4MTR9.q1Ih76cMwCqA8pEv1dNq4XHqt_dtT0btNVtcdQMP8wA\",\"payment_method_id\":71191346,\"sub_accounts_commissions\":null,\"transaction_key\":\"3635053708\"}}');
  dynamic get statuspaiement => _statuspaiement;
  set statuspaiement(dynamic _value) {
    _statuspaiement = _value;
    prefs.setString('ff_statuspaiement', jsonEncode(_value));
  }

  String _indication = '';
  String get indication => _indication;
  set indication(String _value) {
    _indication = _value;
    prefs.setString('ff_indication', _value);
  }

  bool _commande = false;
  bool get commande => _commande;
  set commande(bool _value) {
    _commande = _value;
    prefs.setBool('ff_commande', _value);
  }

  bool _complet = false;
  bool get complet => _complet;
  set complet(bool _value) {
    _complet = _value;
    prefs.setBool('ff_complet', _value);
  }

  List<DocumentReference> _abonnements = [];
  List<DocumentReference> get abonnements => _abonnements;
  set abonnements(List<DocumentReference> _value) {
    _abonnements = _value;
    prefs.setStringList('ff_abonnements', _value.map((x) => x.path).toList());
  }

  void addToAbonnements(DocumentReference _value) {
    _abonnements.add(_value);
    prefs.setStringList(
        'ff_abonnements', _abonnements.map((x) => x.path).toList());
  }

  void removeFromAbonnements(DocumentReference _value) {
    _abonnements.remove(_value);
    prefs.setStringList(
        'ff_abonnements', _abonnements.map((x) => x.path).toList());
  }

  String _lundi = '';
  String get lundi => _lundi;
  set lundi(String _value) {
    _lundi = _value;
    prefs.setString('ff_lundi', _value);
  }

  String _mardi = '';
  String get mardi => _mardi;
  set mardi(String _value) {
    _mardi = _value;
    prefs.setString('ff_mardi', _value);
  }

  String _mercredi = '';
  String get mercredi => _mercredi;
  set mercredi(String _value) {
    _mercredi = _value;
    prefs.setString('ff_mercredi', _value);
  }

  String _jeudi = '';
  String get jeudi => _jeudi;
  set jeudi(String _value) {
    _jeudi = _value;
    prefs.setString('ff_jeudi', _value);
  }

  String _vendredi = '';
  String get vendredi => _vendredi;
  set vendredi(String _value) {
    _vendredi = _value;
    prefs.setString('ff_vendredi', _value);
  }

  String _samedi = '';
  String get samedi => _samedi;
  set samedi(String _value) {
    _samedi = _value;
    prefs.setString('ff_samedi', _value);
  }

  String _dimanche = '';
  String get dimanche => _dimanche;
  set dimanche(String _value) {
    _dimanche = _value;
    prefs.setString('ff_dimanche', _value);
  }

  List<DocumentReference> _aboref = [];
  List<DocumentReference> get aboref => _aboref;
  set aboref(List<DocumentReference> _value) {
    _aboref = _value;
    prefs.setStringList('ff_aboref', _value.map((x) => x.path).toList());
  }

  void addToAboref(DocumentReference _value) {
    _aboref.add(_value);
    prefs.setStringList('ff_aboref', _aboref.map((x) => x.path).toList());
  }

  void removeFromAboref(DocumentReference _value) {
    _aboref.remove(_value);
    prefs.setStringList('ff_aboref', _aboref.map((x) => x.path).toList());
  }

  List<String> _lundi1 = [];
  List<String> get lundi1 => _lundi1;
  set lundi1(List<String> _value) {
    _lundi1 = _value;
    prefs.setStringList('ff_lundi1', _value);
  }

  void addToLundi1(String _value) {
    _lundi1.add(_value);
    prefs.setStringList('ff_lundi1', _lundi1);
  }

  void removeFromLundi1(String _value) {
    _lundi1.remove(_value);
    prefs.setStringList('ff_lundi1', _lundi1);
  }

  List<String> _mardi1 = [];
  List<String> get mardi1 => _mardi1;
  set mardi1(List<String> _value) {
    _mardi1 = _value;
    prefs.setStringList('ff_mardi1', _value);
  }

  void addToMardi1(String _value) {
    _mardi1.add(_value);
    prefs.setStringList('ff_mardi1', _mardi1);
  }

  void removeFromMardi1(String _value) {
    _mardi1.remove(_value);
    prefs.setStringList('ff_mardi1', _mardi1);
  }

  List<String> _mercredi1 = [];
  List<String> get mercredi1 => _mercredi1;
  set mercredi1(List<String> _value) {
    _mercredi1 = _value;
    prefs.setStringList('ff_mercredi1', _value);
  }

  void addToMercredi1(String _value) {
    _mercredi1.add(_value);
    prefs.setStringList('ff_mercredi1', _mercredi1);
  }

  void removeFromMercredi1(String _value) {
    _mercredi1.remove(_value);
    prefs.setStringList('ff_mercredi1', _mercredi1);
  }

  List<String> _jeudi1 = [];
  List<String> get jeudi1 => _jeudi1;
  set jeudi1(List<String> _value) {
    _jeudi1 = _value;
    prefs.setStringList('ff_jeudi1', _value);
  }

  void addToJeudi1(String _value) {
    _jeudi1.add(_value);
    prefs.setStringList('ff_jeudi1', _jeudi1);
  }

  void removeFromJeudi1(String _value) {
    _jeudi1.remove(_value);
    prefs.setStringList('ff_jeudi1', _jeudi1);
  }

  List<String> _vendredi1 = [];
  List<String> get vendredi1 => _vendredi1;
  set vendredi1(List<String> _value) {
    _vendredi1 = _value;
    prefs.setStringList('ff_vendredi1', _value);
  }

  void addToVendredi1(String _value) {
    _vendredi1.add(_value);
    prefs.setStringList('ff_vendredi1', _vendredi1);
  }

  void removeFromVendredi1(String _value) {
    _vendredi1.remove(_value);
    prefs.setStringList('ff_vendredi1', _vendredi1);
  }

  List<String> _samedi1 = [];
  List<String> get samedi1 => _samedi1;
  set samedi1(List<String> _value) {
    _samedi1 = _value;
    prefs.setStringList('ff_samedi1', _value);
  }

  void addToSamedi1(String _value) {
    _samedi1.add(_value);
    prefs.setStringList('ff_samedi1', _samedi1);
  }

  void removeFromSamedi1(String _value) {
    _samedi1.remove(_value);
    prefs.setStringList('ff_samedi1', _samedi1);
  }

  List<String> _dimanche1 = [];
  List<String> get dimanche1 => _dimanche1;
  set dimanche1(List<String> _value) {
    _dimanche1 = _value;
    prefs.setStringList('ff_dimanche1', _value);
  }

  void addToDimanche1(String _value) {
    _dimanche1.add(_value);
    prefs.setStringList('ff_dimanche1', _dimanche1);
  }

  void removeFromDimanche1(String _value) {
    _dimanche1.remove(_value);
    prefs.setStringList('ff_dimanche1', _dimanche1);
  }

  int _nbrelundi = 0;
  int get nbrelundi => _nbrelundi;
  set nbrelundi(int _value) {
    _nbrelundi = _value;
    prefs.setInt('ff_nbrelundi', _value);
  }

  int _nbremardi = 0;
  int get nbremardi => _nbremardi;
  set nbremardi(int _value) {
    _nbremardi = _value;
    prefs.setInt('ff_nbremardi', _value);
  }

  int _nbremercredi = 0;
  int get nbremercredi => _nbremercredi;
  set nbremercredi(int _value) {
    _nbremercredi = _value;
    prefs.setInt('ff_nbremercredi', _value);
  }

  int _nbrejeudi = 0;
  int get nbrejeudi => _nbrejeudi;
  set nbrejeudi(int _value) {
    _nbrejeudi = _value;
    prefs.setInt('ff_nbrejeudi', _value);
  }

  int _nbrevendredi = 0;
  int get nbrevendredi => _nbrevendredi;
  set nbrevendredi(int _value) {
    _nbrevendredi = _value;
    prefs.setInt('ff_nbrevendredi', _value);
  }

  int _nbresamedi = 0;
  int get nbresamedi => _nbresamedi;
  set nbresamedi(int _value) {
    _nbresamedi = _value;
    prefs.setInt('ff_nbresamedi', _value);
  }

  int _nbredimanche = 0;
  int get nbredimanche => _nbredimanche;
  set nbredimanche(int _value) {
    _nbredimanche = _value;
    prefs.setInt('ff_nbredimanche', _value);
  }

  List<DocumentReference> _reflundi = [];
  List<DocumentReference> get reflundi => _reflundi;
  set reflundi(List<DocumentReference> _value) {
    _reflundi = _value;
    prefs.setStringList('ff_reflundi', _value.map((x) => x.path).toList());
  }

  void addToReflundi(DocumentReference _value) {
    _reflundi.add(_value);
    prefs.setStringList('ff_reflundi', _reflundi.map((x) => x.path).toList());
  }

  void removeFromReflundi(DocumentReference _value) {
    _reflundi.remove(_value);
    prefs.setStringList('ff_reflundi', _reflundi.map((x) => x.path).toList());
  }

  List<DocumentReference> _refmardi = [];
  List<DocumentReference> get refmardi => _refmardi;
  set refmardi(List<DocumentReference> _value) {
    _refmardi = _value;
    prefs.setStringList('ff_refmardi', _value.map((x) => x.path).toList());
  }

  void addToRefmardi(DocumentReference _value) {
    _refmardi.add(_value);
    prefs.setStringList('ff_refmardi', _refmardi.map((x) => x.path).toList());
  }

  void removeFromRefmardi(DocumentReference _value) {
    _refmardi.remove(_value);
    prefs.setStringList('ff_refmardi', _refmardi.map((x) => x.path).toList());
  }

  List<DocumentReference> _refmercredi = [];
  List<DocumentReference> get refmercredi => _refmercredi;
  set refmercredi(List<DocumentReference> _value) {
    _refmercredi = _value;
    prefs.setStringList('ff_refmercredi', _value.map((x) => x.path).toList());
  }

  void addToRefmercredi(DocumentReference _value) {
    _refmercredi.add(_value);
    prefs.setStringList(
        'ff_refmercredi', _refmercredi.map((x) => x.path).toList());
  }

  void removeFromRefmercredi(DocumentReference _value) {
    _refmercredi.remove(_value);
    prefs.setStringList(
        'ff_refmercredi', _refmercredi.map((x) => x.path).toList());
  }

  List<DocumentReference> _refjeudi = [];
  List<DocumentReference> get refjeudi => _refjeudi;
  set refjeudi(List<DocumentReference> _value) {
    _refjeudi = _value;
    prefs.setStringList('ff_refjeudi', _value.map((x) => x.path).toList());
  }

  void addToRefjeudi(DocumentReference _value) {
    _refjeudi.add(_value);
    prefs.setStringList('ff_refjeudi', _refjeudi.map((x) => x.path).toList());
  }

  void removeFromRefjeudi(DocumentReference _value) {
    _refjeudi.remove(_value);
    prefs.setStringList('ff_refjeudi', _refjeudi.map((x) => x.path).toList());
  }

  List<DocumentReference> _refvendredi = [];
  List<DocumentReference> get refvendredi => _refvendredi;
  set refvendredi(List<DocumentReference> _value) {
    _refvendredi = _value;
    prefs.setStringList('ff_refvendredi', _value.map((x) => x.path).toList());
  }

  void addToRefvendredi(DocumentReference _value) {
    _refvendredi.add(_value);
    prefs.setStringList(
        'ff_refvendredi', _refvendredi.map((x) => x.path).toList());
  }

  void removeFromRefvendredi(DocumentReference _value) {
    _refvendredi.remove(_value);
    prefs.setStringList(
        'ff_refvendredi', _refvendredi.map((x) => x.path).toList());
  }

  List<DocumentReference> _refsamedi = [];
  List<DocumentReference> get refsamedi => _refsamedi;
  set refsamedi(List<DocumentReference> _value) {
    _refsamedi = _value;
    prefs.setStringList('ff_refsamedi', _value.map((x) => x.path).toList());
  }

  void addToRefsamedi(DocumentReference _value) {
    _refsamedi.add(_value);
    prefs.setStringList('ff_refsamedi', _refsamedi.map((x) => x.path).toList());
  }

  void removeFromRefsamedi(DocumentReference _value) {
    _refsamedi.remove(_value);
    prefs.setStringList('ff_refsamedi', _refsamedi.map((x) => x.path).toList());
  }

  List<DocumentReference> _refdimanche = [];
  List<DocumentReference> get refdimanche => _refdimanche;
  set refdimanche(List<DocumentReference> _value) {
    _refdimanche = _value;
    prefs.setStringList('ff_refdimanche', _value.map((x) => x.path).toList());
  }

  void addToRefdimanche(DocumentReference _value) {
    _refdimanche.add(_value);
    prefs.setStringList(
        'ff_refdimanche', _refdimanche.map((x) => x.path).toList());
  }

  void removeFromRefdimanche(DocumentReference _value) {
    _refdimanche.remove(_value);
    prefs.setStringList(
        'ff_refdimanche', _refdimanche.map((x) => x.path).toList());
  }

  List<DocumentReference> _aboRef2 = [];
  List<DocumentReference> get aboRef2 => _aboRef2;
  set aboRef2(List<DocumentReference> _value) {
    _aboRef2 = _value;
    prefs.setStringList('ff_aboRef2', _value.map((x) => x.path).toList());
  }

  void addToAboRef2(DocumentReference _value) {
    _aboRef2.add(_value);
    prefs.setStringList('ff_aboRef2', _aboRef2.map((x) => x.path).toList());
  }

  void removeFromAboRef2(DocumentReference _value) {
    _aboRef2.remove(_value);
    prefs.setStringList('ff_aboRef2', _aboRef2.map((x) => x.path).toList());
  }

  List<String> _id = [];
  List<String> get id => _id;
  set id(List<String> _value) {
    _id = _value;
    prefs.setStringList('ff_id', _value);
  }

  void addToId(String _value) {
    _id.add(_value);
    prefs.setStringList('ff_id', _id);
  }

  void removeFromId(String _value) {
    _id.remove(_value);
    prefs.setStringList('ff_id', _id);
  }

  String _routeDistance = '';
  String get routeDistance => _routeDistance;
  set routeDistance(String _value) {
    _routeDistance = _value;
  }

  String _routeDuration = '';
  String get routeDuration => _routeDuration;
  set routeDuration(String _value) {
    _routeDuration = _value;
  }

  List<DocumentReference> _refcliList = [];
  List<DocumentReference> get refcliList => _refcliList;
  set refcliList(List<DocumentReference> _value) {
    _refcliList = _value;
  }

  void addToRefcliList(DocumentReference _value) {
    _refcliList.add(_value);
  }

  void removeFromRefcliList(DocumentReference _value) {
    _refcliList.remove(_value);
  }

  String _num = '';
  String get num => _num;
  set num(String _value) {
    _num = _value;
  }

  String _emailz = '';
  String get emailz => _emailz;
  set emailz(String _value) {
    _emailz = _value;
    prefs.setString('ff_emailz', _value);
  }

  String _pass = '';
  String get pass => _pass;
  set pass(String _value) {
    _pass = _value;
    prefs.setString('ff_pass', _value);
  }

  String _momo = '';
  String get momo => _momo;
  set momo(String _value) {
    _momo = _value;
    prefs.setString('ff_momo', _value);
  }

  String _reseau = '';
  String get reseau => _reseau;
  set reseau(String _value) {
    _reseau = _value;
    prefs.setString('ff_reseau', _value);
  }

  String _joignable = '';
  String get joignable => _joignable;
  set joignable(String _value) {
    _joignable = _value;
    prefs.setString('ff_joignable', _value);
  }

  bool _tabSimple = false;
  bool get tabSimple => _tabSimple;
  set tabSimple(bool _value) {
    _tabSimple = _value;
  }

  bool _tabAbo = false;
  bool get tabAbo => _tabAbo;
  set tabAbo(bool _value) {
    _tabAbo = _value;
  }

  double _note = 4.5;
  double get note => _note;
  set note(double _value) {
    _note = _value;
    prefs.setDouble('ff_note', _value);
  }

  bool _tabR = false;
  bool get tabR => _tabR;
  set tabR(bool _value) {
    _tabR = _value;
  }

  List<String> _catList = [];
  List<String> get catList => _catList;
  set catList(List<String> _value) {
    _catList = _value;
  }

  void addToCatList(String _value) {
    _catList.add(_value);
  }

  void removeFromCatList(String _value) {
    _catList.remove(_value);
  }

  DateTime? _ouv = DateTime.fromMillisecondsSinceEpoch(1673683200000);
  DateTime? get ouv => _ouv;
  set ouv(DateTime? _value) {
    _ouv = _value;
    _value != null
        ? prefs.setInt('ff_ouv', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_ouv');
  }

  DateTime? _clo = DateTime.fromMillisecondsSinceEpoch(1673724600000);
  DateTime? get clo => _clo;
  set clo(DateTime? _value) {
    _clo = _value;
    _value != null
        ? prefs.setInt('ff_clo', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_clo');
  }

  bool _cash = false;
  bool get cash => _cash;
  set cash(bool _value) {
    _cash = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
