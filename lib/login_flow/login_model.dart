import 'package:feathers/services/auth_service.dart';
import 'package:feathers/services/crud_service.dart';

class LoginViewModel {
  Future<bool> initLoginFlow() async {
    final _authService = AuthServices();
    _authService.signInUser.then((value) async {
      final _crudService = CRUDServices(value);
      print(value.email);
      await _crudService.addNewUser.then((_){
        return true;
      });
    });
  }

//  get initLoginFlow => _initLoginFlow();
}