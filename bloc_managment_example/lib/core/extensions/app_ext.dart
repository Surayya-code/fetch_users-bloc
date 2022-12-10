
import 'dart:developer' as devtools show log;

import 'package:bloc_managment_example/widgets/user_list_tile.dart';
import 'package:flutter/material.dart';
const _url1=' http://127.0.0.1:5500/api/users_1.json';
            
const _url2='http://127.0.0.1:5500/api/users_2.json';


enum UserUrl{user1,user2}

extension UserUrlX on UserUrl{
  String get urlToString{
    switch (this) {
      case UserUrl.user1:
        return _url1;
      case UserUrl.user2:
        return _url2;
        
    }
  }
}

extension IsEqualOrIgnoring<T> on Iterable<T>{
  bool isEqualOrIgnoring(Iterable<T> other){
    return length==other.length && 
      {...this}.intersection({...other}).length==length;
  }
}

extension Log on Object{
  void log()=> devtools.log(toString());
}

extension SubScript<T> on Iterable<T>{
 T? operator[](int atIndex)=>length>atIndex?elementAt(atIndex):null;
}

extension ItemToList<T> on Iterable<T>{
  Widget itemToWidget()=>UserListTile(users: this);
}