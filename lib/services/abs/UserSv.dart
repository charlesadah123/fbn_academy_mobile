
import '../../models/User.dart';

abstract class UserSv {

  Future<void> createUser(AUser aUser) ;

  Future<void> deleteUser(int id);

  Future<AUser?> getUserById(int id);

  Future<void> updateUser(AUser aUser);

}