// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ikpmd/UI/header.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ikpmd/pages/debt_page.dart';
import 'package:ikpmd/pages/loaned_page.dart';
import 'package:ikpmd/pages/overview_page.dart';
import 'package:flutter/services.dart';
import 'package:ikpmd/providers/borrowed_user.dart';
import 'package:provider/provider.dart';
import 'package:ikpmd/UI/button_with_icon.dart';

import '../models/borrowed_user_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Header header = new Header();
  int _selectedIndex = 1;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    DebtPage(),
    OverviewPage(),
    LoanPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Personal overview",
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(170),
            child: Container(
              height: 150,
              alignment: Alignment.center,
              child: headerSection(_selectedIndex),
            ),
          ),
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.monetization_on), label: "Borrowed from"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Overview"),
            BottomNavigationBarItem(icon: Icon(Icons.money), label: "Lent to"),
          ],
        ),
      ),
    );
  }

  Widget headerSection(int pageNumber) {
    switch (pageNumber) {
      case 0:
        return borrowHeader();
      case 1:
        return Text("Overview");
      case 2:
        return loanedHeader();
    }
    return Text("bruh");
  }

  Widget borrowHeader() {
    return Container(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "The amount you borrowed:",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            "€${400}",
            style: TextStyle(
              color: Colors.red,
              fontSize: 25,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          OutlinedButton(
            onPressed: () {
              print("loan added");
            },
            style: OutlinedButton.styleFrom(
                side: BorderSide(width: 1, color: Colors.white),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24))),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.playlist_add,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Add loan",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget loanedHeader() {
    return Container(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "The amount you lent to others:",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            "€${400}",
            style: TextStyle(
              color: Colors.green,
              fontSize: 25,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          BuildButton(
              text: "Add borrower",
              buttonWidth: 0.7,
              icon: Icons.playlist_add,
              onClicked: () => showModalBottomSheet(
                  context: context, builder: (context) => buildSheet())),
        ],
      ),
    );
  }

  // Widget buildButton({
  //   required String text,
  //   required VoidCallback onClicked,
  // }) =>
  //     OutlinedButton(
  //       onPressed: onClicked,
  //       style: OutlinedButton.styleFrom(
  //           side: BorderSide(width: 1, color: Colors.white),
  //           shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(24))),
  //       child: Container(
  //         width: MediaQuery.of(context).size.width * 0.7,
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             const Icon(
  //               Icons.playlist_add,
  //               color: Colors.white,
  //             ),
  //             const SizedBox(
  //               width: 4,
  //             ),
  //             Text(
  //               text,
  //               style: const TextStyle(
  //                 fontSize: 16,
  //                 color: Colors.white,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );

  Widget buildSheet() => Container(
        padding: EdgeInsets.only(left: 30, right: 30),
        color: Color(0xFF2A363B),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Add borrower",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 50,
            ),
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     "Name",
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontFamily: 'Montserrat',
            //       fontSize: 16,
            //       fontWeight: FontWeight.bold
            //     ),
            //   ),
            // ),
            // SizedBox(height: 5,),
            const TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Name",
                prefixIcon: Icon(Icons.person, color: Colors.black),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            const TextField(
              maxLines: null,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Description",
                prefixIcon: Icon(Icons.description, color: Colors.black),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              maxLines: null,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Amount",
                prefixIcon: Icon(Icons.euro, color: Colors.black),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BuildButton(
                    text: "close",
                    onClicked: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icons.close,
                    buttonWidth: 0.25
                ),
                SizedBox(
                  width: 50,
                ),
                BuildButton(
                    text: "save",
                    onClicked: () {
                      context.read<BorrowedUsers>().addBorrower(user);
                      Navigator.of(context).pop();
                    },
                    icon: Icons.save,
                    buttonWidth: 0.25),
              ],
            )
          ],
        ),
      );

  BorrowedUser user =
      BorrowedUser(name: "test", description: "testing", amount: 20);
}
