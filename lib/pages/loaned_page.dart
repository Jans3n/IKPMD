import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ikpmd/providers/borrowed_user.dart';
import 'package:provider/provider.dart';

class LoanPage extends StatefulWidget {
  const LoanPage({Key? key}) : super(key: key);

  @override
  State<LoanPage> createState() => _LoanPageState();
}

class _LoanPageState extends State<LoanPage> {
  List<String> array = <String>['A','B','C','B','B','B'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        color: Colors.white,
        // width: MediaQuery.of(context).size.width * 0.9,
        child: Container(
          // color: Color(0xFF2A363B),
          margin: EdgeInsets.only(top: 12, left: 20, right: 20),
          // padding: EdgeInsets.all(12),
          padding: EdgeInsets.only(top: 12, left: 10, right: 10),
          decoration: BoxDecoration(
            color: Color(0xFF2A363B),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15)
            ),
          ),
          child: borrowerList()
        ),
      ),

    );
  }

  Widget borrowerList(){
    if (context.watch<BorrowedUsers>().borrowedUsers.length == 0){
      return Center(
        child: Text("No one borrowed from you!",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18
        ),),
      );
    }
    return ListView.separated(
      padding: EdgeInsets.all(8),
      // itemCount: array.length,
      // itemCount: loanedService.loansArray.length,
      itemCount: context.watch<BorrowedUsers>().borrowedUsers.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.white,
          child: Center(
            child:
            Text('${context.watch<BorrowedUsers>().borrowedUsers[index]}'),
          ),
        );
      }, separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
