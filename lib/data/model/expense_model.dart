import '../local/db_helper.dart';

class ExpenseModel {
  int? eid;
  int uid;
  String title;
  String desc;
  num amt;
  num bal;
  String createdAt;
  String type;
  int catId;

  ExpenseModel({
    this.eid,
    required this.uid,
    required this.title,
    required this.desc,
    required this.amt,
    required this.bal,
    required this.createdAt,
    required this.type,
    required this.catId
  });


  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      eid: map[DbHelper.EXPENSE_ID],
      uid: map[DbHelper.USER_ID],
      title: map[DbHelper.EXPENSE_TITLE],
      desc: map[DbHelper.EXPENSE_DESCRIPTION],
      amt: map[DbHelper.EXPENSE_AMOUNT],
      bal: map[DbHelper.EXPENSE_BALANCE],
      createdAt: map[DbHelper.EXPENSE_DATE],
      type: map[DbHelper.EXPENSE_TYPE],
      catId: map[DbHelper.EXPENSE_CATEGORY],
    );
  }


  Map<String, dynamic> toMap() {
    return {
      DbHelper.USER_ID: uid,
      DbHelper.EXPENSE_TITLE: title,
      DbHelper.EXPENSE_DESCRIPTION: desc,
      DbHelper.EXPENSE_AMOUNT: amt,
      DbHelper.EXPENSE_BALANCE: bal,
      DbHelper.EXPENSE_DATE: createdAt,
      DbHelper.EXPENSE_TYPE: type,
      DbHelper.EXPENSE_CATEGORY: catId
    };
  }

}