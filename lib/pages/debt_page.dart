import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DebtPage extends StatefulWidget {
  const DebtPage({Key? key}) : super(key: key);

  @override
  State<DebtPage> createState() => _DebtPageState();
}

class _DebtPageState extends State<DebtPage> {
  List<String> array = <String>['A','B','C','B','B'];

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
              child: ListView.separated(
                padding: EdgeInsets.all(8),
                itemCount: array.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    color: Colors.white,
                    child: Center(child: Text('${array[index]}'),
                    ),
                  );
                }, separatorBuilder: (BuildContext context, int index) => const Divider(),
              ),
            ),
          ),

    );
  }
}
