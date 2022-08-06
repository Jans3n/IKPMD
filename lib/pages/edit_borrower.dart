import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ikpmd/UI/button_with_icon.dart';
import 'package:ikpmd/models/borrowed_user_model.dart';
import 'package:ikpmd/services/borrowed_user_service.dart';

class EditBorrower extends StatefulWidget {
  const EditBorrower(this.borrowedUser, {Key? key}) : super(key: key);

  final BorrowedUser borrowedUser;

  @override
  State<EditBorrower> createState() => _EditBorrowerState();
}

class _EditBorrowerState extends State<EditBorrower> {
  bool _isEditingText = false;
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _amountController;
  late String initialNameText = widget.borrowedUser.name;
  late String initialDescriptionText = widget.borrowedUser.description;
  late String initialAmountText = widget.borrowedUser.amount.toString();

  @override
  void initState() {
    _nameController = TextEditingController(text: initialNameText);
    _descriptionController = TextEditingController(text: initialDescriptionText);
    _amountController = TextEditingController(text: initialAmountText);
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Color(0xFF2A363B) ,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit borrower'),
      ),
      body: Container(
        color: Color(0xFF2A363B),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            // _editNameTextField(),
            TextField(
              controller: _nameController,
              // style: TextStyle(color: Colors.pinkAccent),
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: "Name",
                // prefixText: "${widget.borrowedUser.name}",
                prefixIcon: Icon(Icons.person, color: Colors.black),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: _descriptionController,
              maxLines: null,
              maxLength: 50,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                counterStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
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
              controller: _amountController,
              maxLines: null,
              maxLength: 10,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}')),
              ],
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                counterStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: "Amount",
                prefixIcon: Icon(Icons.euro, color: Colors.black),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuildButton(
                  text: "Delete",
                  onClicked: () {
                    print("Borrower removed");
                  },
                  icon: Icons.delete,
                  buttonWidth: 0.3,
                  backgroundColor: Colors.redAccent,
                ),
                BuildButton(
                  text: "Save",
                  onClicked: () {
                    print("Borrower edited");
                    print (_nameController.text);
                    // BorrowedUserService().test();
                  },
                  icon: Icons.save,
                  buttonWidth: 0.3,
                  backgroundColor: Color(0xFF2A363B),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget _editNameTextField() {
  //   if (_isEditingText)
  //     return Center(
  //       child: TextField(
  //         keyboardType: TextInputType.name,
  //         decoration: InputDecoration(
  //           border: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(8.0),
  //           ),
  //           fillColor: Colors.white,
  //           filled: true,
  //           prefixIcon: Icon(Icons.person, color: Colors.black),
  //         ),
  //         onSubmitted: (newValue) {
  //           setState(() {
  //             initialNameText = newValue;
  //             _isEditingText = false;
  //           });
  //         },
  //         // autofocus: true,
  //         controller: _nameController,
  //       ),
  //     );
  //   return InkWell(
  //     onTap: () {
  //       setState(() {
  //         _isEditingText = true;
  //       });
  //     },
  //     child: Text(
  //       initialNameText,
  //       style: TextStyle(
  //         color: Colors.black,
  //         fontSize: 18.0,
  //       ),
  //     ),
  //   );
  // }
}
