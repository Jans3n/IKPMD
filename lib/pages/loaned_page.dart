import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ikpmd/models/borrowed_user_model.dart';
import 'package:ikpmd/pages/edit_borrower.dart';
import 'package:ikpmd/providers/borrowed_user.dart';
import 'package:ikpmd/services/borrowed_user_service.dart';
import 'package:provider/provider.dart';

class LoanPage extends StatefulWidget {
  const LoanPage({Key? key}) : super(key: key);

  @override
  State<LoanPage> createState() => _LoanPageState();
}

class _LoanPageState extends State<LoanPage> {
  double topPadding = MediaQueryData.fromWindow(WidgetsBinding.instance.window).padding.top;

  // @override
  // void InitState(){
  //   super.initState();
  //   // BorrowedUserService().test();
  // }

  @override
  Widget build(BuildContext context) {
    // topPadding = MediaQueryData.fromWindow(WidgetsBinding.instance.window).padding.top;
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
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
            child: borrowerList()),
      ),
    );
  }

  Widget borrowerList() {
    if (context.watch<BorrowedUsers>().borrowedUsers.isEmpty) {
      return Center(
        child: Text(
          "No one borrowed from you!",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      );
    }
    return ListView.separated(
      padding: EdgeInsets.all(8),
      // itemCount: array.length,
      // itemCount: loanedService.loansArray.length,
      itemCount: context.read<BorrowedUsers>().borrowedUsers.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Container(
            height: 50,
            color: Colors.white,
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.read<BorrowedUsers>().borrowedUsers[index].name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat",
                  ),
                ),
                Text(
                  "€ ${context.read<BorrowedUsers>().borrowedUsers[index].amount}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat",
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            _editBorrowerModalBottomSheet(context, context.read<BorrowedUsers>().borrowedUsers[index]);
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  void _editBorrowerModalBottomSheet(context, BorrowedUser borrowedUser) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height - topPadding,
            color: Color(0xFF2A363B),
            child: EditBorrower(borrowedUser),
          );
        });
  }
}
