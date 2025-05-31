import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpenso/data/model/expense_model.dart';
import 'package:xpenso/domain/app_constants.dart';
import 'package:xpenso/ui/screen/bloc/expense_bloc.dart';
import 'package:xpenso/ui/screen/bloc/expense_event.dart';

class AddExpensePage extends StatefulWidget {
  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  var titleController = TextEditingController();

  var descController = TextEditingController();

  var amtController = TextEditingController();

  int selectedCatIndex = -1;

  List<String> mExpenseType = ["Debit", "Credit"];

  String selectedType = "Debit";

  DateTime? selectedDateTime;

  DateFormat formatter = DateFormat.yMMMEd();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              cursorColor: Colors.black,
              decoration:
                  mDecoration(label: "Title", hint: "Enter your title here.."),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: descController,
              cursorColor: Colors.black,
              decoration:
                  mDecoration(label: "Desc", hint: "Enter your desc here.."),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: amtController,
              cursorColor: Colors.black,
              decoration: mDecoration(
                  label: "Amount", hint: "Enter your amount here.."),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: OutlinedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                              ),
                              itemCount: AppConstants.mCat.length,
                              itemBuilder: (_, index) {
                                return InkWell(
                                  onTap: () {
                                    selectedCatIndex = index;
                                    Navigator.pop(context);
                                    setState(() {});
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          AppConstants.mCat[index].imgPath,
                                          width: 50,
                                          height: 50,
                                        ),
                                        Text(AppConstants.mCat[index].name),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        );
                      });
                },
                child: selectedCatIndex >= 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppConstants.mCat[selectedCatIndex].imgPath,
                            width: 40,
                            height: 40,
                          ),
                          SizedBox(
                            width: 11,
                          ),
                          Text(
                              " -   ${AppConstants.mCat[selectedCatIndex].name}")
                        ],
                      )
                    : Text('Choose Category'),
                style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
              ),
            ),
            SizedBox(
              height: 11,
            ),
            DropdownMenu(
              width: double.infinity,
              initialSelection: selectedType,
              dropdownMenuEntries: mExpenseType.map((element) {
                return DropdownMenuEntry(value: element, label: element);
              }).toList(),
            ),
            SizedBox(
              height: 11,
            ),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: OutlinedButton(
                onPressed: () async {
                  selectedDateTime = await showDatePicker(
                      context: context,
                      firstDate:
                          DateTime.now().subtract(Duration(days: 365 * 2)),
                      lastDate: DateTime.now());

                  setState(() {});
                },
                style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                child:
                    Text(formatter.format(selectedDateTime ?? DateTime.now())),
              ),
            ),
            SizedBox(
              height: 21,
            ),
            ElevatedButton(
              onPressed: () async{
                if (selectedCatIndex != -1) {

                  num balance = await updateBal();

                  if(selectedType=="Debit"){
                    balance-=double.parse(amtController.text);
                  } else {
                    balance+=double.parse(amtController.text);
                  }

                  context.read<ExpenseBloc>().add(AddExpenseEvent(
                      newExp: ExpenseModel(
                          title: titleController.text,
                          desc: descController.text,
                          amt: double.parse(amtController.text),
                          bal: balance,
                          createdAt: (selectedDateTime ?? DateTime.now())
                              .millisecondsSinceEpoch
                              .toString(),
                          type: selectedType,
                          catId: AppConstants.mCat[selectedCatIndex].id.toString())));
                  Navigator.pop(context);
                } else{

                }
              },
              child: Text('Add Expense'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
            )
            /*SizedBox(
              height: 50,
              child: DropdownButton(
                value: selectedType,
                  items: mExpenseType.map((element){
                return DropdownMenuItem(
                  value: element,
                    child: Text(element));
              }).toList(), onChanged: (value){
                selectedType = value!;
                setState(() {

                });
              }),
            )*/
          ],
        ),
      ),
    );
  }

  Future<num> updateBal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    num bal = prefs.getDouble("bal") ?? 0.0;
    return bal;
  }

  InputDecoration mDecoration({required String label, required String hint}) =>
      InputDecoration(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(),
          hintText: hint,
          label: Text(label),
          hintStyle: TextStyle(
              fontFamily: "Poppins", fontSize: 17, color: Color(0xff4C4C4C)));
}
