import 'package:flutter/cupertino.dart';

import '../models/borrowed_user_model.dart';

class BorrowedUsers with ChangeNotifier{
  List<BorrowedUser> _borrowedUsers = [
    // BorrowedUser(
    //     name: "Jansen",
    //     description: "eten in shabu",
    //     amount: 25
    // ),
    // BorrowedUser(
    //     name: "test",
    //     description: "eten in shabu",
    //     amount: 30
    // ),
  ];

  List<BorrowedUser> get borrowedUsers => _borrowedUsers;

  void addBorrower(BorrowedUser object){
    _borrowedUsers.add(object);
    notifyListeners();
  }
}

