import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawable/responsive/textConfig.dart';

class CollectionPaths{

  static getBase(String collectionName){
    return Firestore.instance.collection(collectionName);
  }

  static CollectionReference sessionsCollectionPath = getBase(TextConfig.sessionsPathName);

}