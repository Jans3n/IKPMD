import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:ikpmd/providers/borrowed_user.dart';
import 'package:ikpmd/models/borrowed_user_model.dart';

class BorrowedUserService {
  final String Url = 'http://a370-83-86-130-220.ngrok.io/';
  BorrowedUsers? borrowedUsers;



  void addBorrower(int id){

  }

  // void test(){
  //   print(fetchAllBorrowers());
  // }

   fetchAllBorrowers() async {
    var response = await http.get(Uri.parse('${Url}borrowers'));
    var parsedJson = json.decode(response.body);
    print(parsedJson);
    for (var borrower in parsedJson){
      print(borrower["id"]);
      // context.read<BorrowedUsers>().addBorrower(user);
      // borrowedUsers?.addBorrower(BorrowedUser(id: borrower["id"], name: borrower["name"], description: borrower["description"], amount: borrower["amount"]));
    }
  }
}

class BorrowedUserService2 extends StatelessWidget {
  const BorrowedUserService2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

