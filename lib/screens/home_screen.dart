import 'package:expense_app/constants/color_constants.dart';
import 'package:expense_app/constants/font_family_constants.dart';
import 'package:expense_app/constants/image_constants.dart';
import 'package:expense_app/screens/add_transaction.dart';
import 'package:flutter/material.dart';

import '../CommonWidgets/common_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 30, right: 30, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(),
              buildSummary(),
              buildSubHeading("Recent Transactions"),
              buildRecentTransactions()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildMainHeading("Home"),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                builder: (context) {
                  return const AddTransactions();
                });
          },
          child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: ColorConstants.darkBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(ImageConstants.addIcon,
                  height: 30, color: ColorConstants.darkBlue)),
        )
      ],
    );
  }

  Widget buildSummary() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          buildSummaryContainer(ColorConstants.green, "Total Income", 36000),
          const SizedBox(width: 20),
          buildSummaryContainer(ColorConstants.red, "Total Expense", 3000),
        ],
      ),
    );
  }

  Widget buildSummaryContainer(Color color, String title, int am) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: FontFamilyConstants.gtWalsheimProBold)),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text("₹ $am",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontFamily: FontFamilyConstants.gtWalsheimProBold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRecentTransactions() {
    return Expanded(
      child: ListView.builder(
          padding: const EdgeInsets.only(top: 10),
          itemCount: 13,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Shopping",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily:
                                    FontFamilyConstants.gtWalsheimProBold)),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text("9th July, 2023 9:30 AM",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontFamily:
                                      FontFamilyConstants.gtWalsheimProLight)),
                        ),
                      ],
                    ),
                    Text("-₹1200",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: FontFamilyConstants.gtWalsheimProBold)),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
