import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:xpenso/data/model/cat_model.dart';
import 'package:xpenso/data/model/filter_expense_model.dart';
import 'package:xpenso/domain/app_constants.dart';
import 'package:xpenso/ui/screen/bloc/expense_bloc.dart';
import 'package:xpenso/ui/screen/bloc/expense_event.dart';
import 'package:xpenso/ui/screen/bloc/expense_state.dart';

import '../../../data/model/expense_model.dart';

class homeBottomPage extends StatefulWidget {
  @override
  State<homeBottomPage> createState() => _homeBottomPageState();
}

class _homeBottomPageState extends State<homeBottomPage> {
  List<FilterExpenseModel> allFilteredExpenses = [];
  DateFormat df = DateFormat.yMMMEd();
  List<String> mExpenseFilterType = ["Date wise", "Month wise", "Year wise", "Cat wise"];
  bool isFirsTime = true;
  String selectedFilterType = "Date wise";
  //DateFormat dmf = DateFormat.yMMM();
  //DateFormat dyf = DateFormat.y();

  @override
  void initState() {
    super.initState();
    context.read<ExpenseBloc>().add(GetInitialExpenseEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child:
            BlocBuilder<ExpenseBloc, ExpenseState>(builder: (context, state) {
          if (state is ExpenseLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ExpenseErrorState) {
            return Center(
              child: Text("${state.errorMsg}"),
            );
          }

          if (state is ExpenseLoadedState) {

            allFilteredExpenses = state.allExpense;

            ///filter data here
           /* if(isFirsTime) {
              filterExpenseByType(allExpenses: state.allExpense, type: 1);
              isFirsTime = false;
            }*/

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 20, right: 20, bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "asset/image/monety.png",
                              height: 28,
                            ),
                            Text(
                              " Monety",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.search_rounded,
                          size: 25,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image(
                                image: AssetImage("asset/image/avatar.png"),
                                height: 45,
                                width: 45,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  " Morning",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.grey),
                                ),
                                Text(
                                  " Aditya Singh",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                        DropdownMenu(
                          width: 150,
                          trailingIcon: Icon(Icons.expand_more_outlined, size: 20,),
                          inputDecorationTheme: InputDecorationTheme(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 7),
                            constraints: BoxConstraints.tight(const
                            Size.fromHeight(40)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none
                            ),
                            filled: true,
                            fillColor: Color(0x45194cff),
                          ),
                          onSelected: (value){
                            if(value=="Date wise"){
                              context.read<ExpenseBloc>().add(GetInitialExpenseEvent(type: 1));
                            } else if(value =="Month wise"){
                              context.read<ExpenseBloc>().add(GetInitialExpenseEvent(type: 2));
                            } else if(value == "Year wise"){
                              context.read<ExpenseBloc>().add(GetInitialExpenseEvent(type: 3));
                            } else {
                              context.read<ExpenseBloc>().add(GetInitialExpenseEvent(type: 4));
                            }
                          },
                          textStyle: TextStyle(fontSize: 14,fontFamily: "Poppins",fontWeight: FontWeight.bold),
                          initialSelection: selectedFilterType,
                          dropdownMenuEntries: mExpenseFilterType.map((element) {
                            return DropdownMenuEntry(value: element, label: element);
                          }).toList(),
                        )
                       /* Container(
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0x1b194cff)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                " This Month",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                              Icon(
                                Icons.expand_more_rounded,
                                size: 20,
                              )
                            ],
                          ),
                        )*/
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 150,
                      padding:
                          const EdgeInsets.only(left: 20, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff6674D3)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Expense total",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                              Text(
                                "\$3,734",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white),
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 3, horizontal: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.red),
                                    child: Center(
                                        child: Text(
                                      "+\$240",
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Colors.white),
                                    )),
                                  ),
                                  Text(
                                    " than last month",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 12,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Image.asset("asset/image/monety_bg2.png", height: 93)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      " Expense List",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: allFilteredExpenses.length,
                      itemBuilder: (context, index) {
                        var currFilterExp = allFilteredExpenses[index];
                        return Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 16),
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 5, bottom: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    currFilterExp.type,
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "\$${currFilterExp.totalAmt}",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: currFilterExp.mExpenses.length,
                                itemBuilder: (context, childIndex){
                                var eachExp = currFilterExp.mExpenses[childIndex];

                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(5),
                                                  color: Color(0x3de2caaa)),
                                              child: Image.asset(AppConstants.mCat.where((eachCat){
                                                return eachCat.id==int.parse(eachExp.catId);
                                              }).toList()[0].imgPath),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  eachExp.title,
                                                  style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 14,
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  eachExp.desc,
                                                  style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontSize: 12,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "\$${eachExp.amt}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Poppins",
                                              fontSize: 14,
                                              color: Color(0xffE78BBC)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                );

                              } ,)
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          }

          return Container();
        }),
      ),
    );
  }


}
