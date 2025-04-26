import 'package:intl/intl.dart';

import '../data/model/cat_model.dart';
import '../data/model/expense_model.dart';
import '../data/model/filter_expense_model.dart';

class AppConstants{

  static final String USER_ID = 'uid';

  static List<CategoryModel> mCat = [
    CategoryModel(id: 1, name: "Shopping", imgPath: "asset/image/cat_img/hawaiian-shirt.png"),
    CategoryModel(id: 2, name: "Coffee", imgPath: "asset/image/cat_img/coffee.png"),
    CategoryModel(id: 3, name: "Petrol", imgPath: "asset/image/cat_img/vehicles.png"),
    CategoryModel(id: 4, name: "Recharge", imgPath: "asset/image/cat_img/smartphone.png"),
    CategoryModel(id: 5, name: "Restaurant", imgPath: "asset/image/cat_img/restaurant.png"),
  ];

  static List<FilterExpenseModel> filterExpenseByType({required List<ExpenseModel> allExpenses, int type = 1}) {
    List<FilterExpenseModel> allFilteredExpenses = [];
    DateFormat df = DateFormat.yMMMEd();
    ///1 -> date-wise, 2 -> month-wise, 3 -> year-wise, 4 -> cat-wise
    if(type<4) {
      if(type==1){
        df = DateFormat.yMMMEd();
      } else if(type==2){
        df = DateFormat.yMMM();
      } else {
        df = DateFormat.y();
      }

      List<String> uniqueMonths = [];

      ///date wise
      ///month wise ?
      ///year wise ?
      ///cat wise ? (additional)
      for (ExpenseModel eachExp in allExpenses) {
        String date = df.format(
            DateTime.fromMillisecondsSinceEpoch(int.parse(eachExp.createdAt)));
        if (!uniqueMonths.contains(date)) {
          uniqueMonths.add(date);
        }
      }
      print(uniqueMonths);

      for (String eachDate in uniqueMonths) {
        num eachDateTotalAmt = 0.0;
        List<ExpenseModel> eachDateExpenses = [];

        for (ExpenseModel eachExp in allExpenses) {
          String date = df.format(
              DateTime.fromMillisecondsSinceEpoch(
                  int.parse(eachExp.createdAt)));

          if (eachDate == date) {
            eachDateExpenses.add(eachExp);

            if (eachExp.type == 'Debit') {
              eachDateTotalAmt -= eachExp.amt;
            } else {
              eachDateTotalAmt += eachExp.amt;
            }
          }
        }

        allFilteredExpenses.add(FilterExpenseModel(
            type: eachDate,
            totalAmt: eachDateTotalAmt,
            mExpenses: eachDateExpenses));
      }
    } else {
      ///cat-wise
      for(CategoryModel eachCat in AppConstants.mCat){
        num eachCatTotalAmt = 0.0;
        List<ExpenseModel> eachCatExpenses = [];

        for(ExpenseModel eachExp in allExpenses){

          if(eachCat.id==int.parse(eachExp.catId)){
            eachCatExpenses.add(eachExp);

            if(eachExp.type=='Debit'){
              eachCatTotalAmt -= eachExp.amt;
            } else {
              eachCatTotalAmt += eachExp.amt;
            }

          }

        }
        if(eachCatExpenses.isNotEmpty) {
          allFilteredExpenses.add(FilterExpenseModel(type: eachCat.name,
              totalAmt: eachCatTotalAmt,
              mExpenses: eachCatExpenses));
        }
      }

    }
    return allFilteredExpenses;
    //print(allFilteredExpenses[0].mExpenses[2].title);
  }

}