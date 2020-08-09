import 'dart:io';
import 'package:flutter/cupertino.dart';
// ignore: implementation_imports
import 'package:flutter/src/material/scaffold.dart';
import 'package:scoach/locator.dart';
import 'package:scoach/model/swimmer.dart';
import 'package:scoach/model/user.dart';
import 'package:scoach/repository/user_repository.dart';
import 'package:scoach/services/auth_base.dart';

enum ViewState{Idle, Busy}

class UserModel with ChangeNotifier implements AuthBase{

  ViewState _state = ViewState.Idle;
  UserRepository _userRepository = locator<UserRepository>();
  User _user;

  Swimmer _swimmer;

  UserModel(){
    currentUser();
  }

  Swimmer get swimmer => _swimmer;

  User get user => _user;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  @override
  Future<User> currentUser() async{
    try{
      state = ViewState.Busy;
      _user = await _userRepository.currentUser();
      return _user;
    }catch(e){
      debugPrint("ViewModel currentUser hata: "+ e.toString());
      return null;
    }finally{
      state = ViewState.Idle;
    }
  }

  @override
  Future<User> signInWithEmailandPassword(String email, String sifre, GlobalKey<ScaffoldState> scaffoldKey) async{
    try{
      state = ViewState.Busy;
      _user = await _userRepository.signInWithEmailandPassword(email, sifre, scaffoldKey);
      return _user;
    }catch(e){
      debugPrint("ViewModel signInWithEP hata: "+ e.toString());
      return null;
    }finally{
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> signOut() async{
    bool sonuc = await _userRepository.signOut();
    _user = null;
    return sonuc;
  }

  @override
  Future<User> createUserWithEmailandPassword(String kullaniciAdi,String email, String sifre) async{
    try{
      state = ViewState.Busy;
      _user = await _userRepository.createUserWithEmailandPassword(kullaniciAdi,email, sifre);
      return _user;
    }catch(e){
      debugPrint("ViewModel createUserWithEmailandPassword hata: "+ e.toString());
      return null;
    }finally{
      state = ViewState.Idle;
    }
  }

  @override
  Future<User> signInWithGoogle() async{
    try{
      state = ViewState.Busy;
      _user = await _userRepository.signInWithGoogle();
      return _user;
    }catch(e){
      debugPrint("ViewModel signInWithGoogle hata: "+ e.toString());
      return null;
    }finally{
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> forgotPassword(String email) async{
    try{
      state = ViewState.Busy;
      await _userRepository.forgotPassword(email);
      return true;
    }catch(e){
      debugPrint("ViewModel forgotPassword hata: "+ e.toString());
      return false;
    }finally{
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> changePassword(String sifre) async{
    try{
      state = ViewState.Busy;
      await _userRepository.changePassword(sifre);
      return true;
    }catch(e){
      debugPrint("ViewModel changePassword hata: "+ e.toString());
      return false;
    }finally{
      state = ViewState.Idle;
    }
  }

  @override
  Future<void> changeEmail(String userId, String degisecekVeri,String email) async{
    try{
      state = ViewState.Busy;
      await _userRepository.changeEmail(userId, degisecekVeri, email);
      return true;
    }catch(e){
      debugPrint("ViewModel changeEmail hata: "+ e.toString());
      return false;
    }finally{
      state = ViewState.Idle;
    }
  }

  Future<String> updateFoto(String userId, String dosyaAdi, File profilFoto) async{
    var indirmeLinki = await _userRepository.updateFoto(userId, dosyaAdi, profilFoto);
    return indirmeLinki;
  }

  @override
  Future<bool> saveSwimmer(Swimmer swimmer, User user) async{
    try{
      state = ViewState.Busy;
      bool sonuc = await _userRepository.saveSwimmer(swimmer, user);
      return sonuc;
    }catch(e){
      debugPrint("ViewModel saveSwimmer hata: "+ e.toString());
      return false;
    }finally{
      state = ViewState.Idle;
    }
  }

  @override
  Future<List<Swimmer>> getAllSwimmer(User user) async{
    try{
      state = ViewState.Busy;
      List<Swimmer> allSwimmer = await _userRepository.getAllSwimmer(user);
      return allSwimmer;
    }catch(e){
      debugPrint("ViewModel getAllSwimmer hata: "+ e.toString());
      return null;
    }finally{
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> setSwimmerStyle(String style, Swimmer swimmer, User user, int queue, int distance) async{
    try{
      state = ViewState.Busy;
      bool sonuc = await _userRepository.setSwimmerStyle(style, swimmer, user, queue, distance);
      return sonuc;
    }catch(e){
      debugPrint("ViewModel setSwimmerStyle hata: "+ e.toString());
      return false;
    }finally{
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> setSwimmerDistance(String style, Swimmer swimmer, User user, int distance) async{
    try{
      state = ViewState.Busy;
      bool sonuc = await _userRepository.setSwimmerDistance(style, swimmer, user, distance);
      return sonuc;
    }catch(e){
      debugPrint("ViewModel setSwimmerDistance hata: "+ e.toString());
      return false;
    }finally{
      state = ViewState.Idle;
    }
  }

  @override
  Future<List<Swimmer>> getSelectedStyle(User user, Swimmer swimmer, String style) async{
    try{
      state = ViewState.Busy;
      List<Swimmer> allDistance = await _userRepository.getSelectedStyle(user, swimmer, style);
      return allDistance;
    }catch(e){
      debugPrint("ViewModel getSelectedStyle hata: "+ e.toString());
      return null;
    }finally{
      state = ViewState.Idle;
    }
  }


}