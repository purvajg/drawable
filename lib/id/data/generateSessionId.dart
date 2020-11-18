import 'package:drawable/firebase/sessions.dart';

class GenerateSessionId{

  Future<String> main() async{
    return await Sessions().generateId();
  }
}