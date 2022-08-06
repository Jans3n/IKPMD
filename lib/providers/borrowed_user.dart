import 'package:flutter/cupertino.dart';

import '../models/borrowed_user_model.dart';

class BorrowedUsers with ChangeNotifier{
  List<BorrowedUser> _borrowedUsers = [
    // BorrowedUser(
    //     name: "Jansen",
    //     description: "eten in shabu",
    //     amount: 25,
    //     id: 1
    // ),
    // BorrowedUser(
    //     name: "test",
    //     description: "eten in shabu",
    //     amount: 30
    // ),
  ];

  List<BorrowedUser> get borrowedUsers => _borrowedUsers;

  void setBorrowedUsers(List<BorrowedUser> borrowedUserList){
    _borrowedUsers = borrowedUserList;
  }

  void addBorrower(BorrowedUser borrower){
    _borrowedUsers.add(borrower);
    // print("add borrower ${_borrowedUsers}");
    notifyListeners();
  }

  // void getBorrowers(){
  //   print("get borrower ${_borrowedUsers}");
  //   for (var borrower in _borrowedUsers){
  //     print(borrower);
  //   }
  // }
}

