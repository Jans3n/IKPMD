// import 'dart:convert';
//
// List<BorrowedUser> borrowedUserFromJson(String str) => List<BorrowedUser>.from(json.decode(str).map((x) => BorrowedUser.fromJson(x)));
//
// String borrowedUserToJson(List<BorrowedUser> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class BorrowedUser {
//   BorrowedUser({
//     required this.name,
//     required this.amount,
//     required this.description,
//     required this.id,
//   });
//
//   String name;
//   double amount;
//   String description;
//   int id;
//
//   factory BorrowedUser.fromJson(Map<String, dynamic> json) => BorrowedUser(
//     name: json["name"],
//     amount: json["amount"].toDouble(),
//     description: json["description"],
//     id: json["id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "amount": amount,
//     "description": description,
//     "id": id,
//   };
// }

class BorrowedUser{
  final int id;
  final String name;
  final String description;
  final double amount;

  BorrowedUser({
    required this.id,
    required this.name,
    required this.description,
    required this.amount});
}