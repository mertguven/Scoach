import 'package:flutter/cupertino.dart';
import 'package:scoach/locator.dart';
import 'package:scoach/model/user_model.dart';
import 'package:scoach/repository/user_repository.dart';
import 'package:scoach/services/auth_base.dart';

enum ViewState{Idle, Busy}

class UserModel with ChangeNotifier implements AuthBase{

  ViewState _state = ViewState.Idle;
  UserRepository _userRepository = locator<UserRepository>();
  User _user;

  UserModel(){
    currentUser();
  }

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
  Future<User> signInWithEmailandPassword(String email, String sifre) async{
    try{
      state = ViewState.Busy;
      _user = await _userRepository.signInWithEmailandPassword(email, sifre);
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
    try{
      state = ViewState.Busy;
      bool sonuc = await _userRepository.signOut();
      _user = null;
      return sonuc;
    }catch(e){
      debugPrint("ViewModel signOut hata: "+ e.toString());
      return false;
    }finally{
      state = ViewState.Idle;
    }
  }

  @override
  Future<User> createUserWithEmailandPassword(String email, String sifre) async{
    try{
      state = ViewState.Busy;
      _user = await _userRepository.createUserWithEmailandPassword(email, sifre);
      return _user;
    }catch(e){
      debugPrint("ViewModel signOutWithEmailandPassword hata: "+ e.toString());
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
}