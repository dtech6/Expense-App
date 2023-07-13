import 'package:expense_app/CommonWidgets/common_widgets.dart';
import 'package:expense_app/constants/constants.dart';
import 'package:expense_app/screens/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/color_constants.dart';
import '../constants/font_family_constants.dart';

class AddTransactions extends StatefulWidget {
  const AddTransactions({super.key});

  @override
  State<AddTransactions> createState() => _AddTransactionsState();
}

class _AddTransactionsState extends State<AddTransactions>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  late Animation<double> expandAnimation;
  final amountController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    expandAnimation = CurvedAnimation(
      parent: controller!,
      curve: Curves.easeInOut,
    );

    controller!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildMainHeading("Add Transaction"),
            const SizedBox(height: 30),
            CustomDropDown(
              items: transactionTypes,
              hint: "Transaction Type",
            ),
            buildTextField(),
            buildDatePicker(),
            const SizedBox(height: 30),
            CustomDropDown(
              items: categories,
              hint: "Category",
            ),
            const SizedBox(height: 30),
            CustomDropDown(
              items: paymentTypes,
              hint: "Payment Type",
            ),
            const SizedBox(height: 40),
            buildButton(() {
              Navigator.of(context).pop();
            })
          ],
        ),
      ),
    );
  }

  Widget buildDatePicker() {
    return GestureDetector(
      onTap: () {
        selectDate(context);
      },
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.black12)),
        child: Text(DateFormat("dd MMM, yyyy").format(selectedDate),
            style: TextStyle(
                color: ColorConstants.darkBlue,
                fontSize: 20,
                fontFamily: FontFamilyConstants.gtWalsheimProRegular)),
      ),
    );
  }

  Widget buildTextField() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Amount",
              style: TextStyle(
                  color: ColorConstants.darkBlue,
                  fontSize: 20,
                  fontFamily: FontFamilyConstants.gtWalsheimProRegular)),
          TextFormField(
            controller: amountController,
            keyboardType: TextInputType.number,
            style: TextStyle(
                color: ColorConstants.darkBlue,
                fontSize: 40,
                fontFamily: FontFamilyConstants.gtWalsheimProMedium),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "0",
                hintStyle: TextStyle(
                    color: ColorConstants.darkBlue.withOpacity(0.4),
                    fontSize: 40,
                    fontFamily: FontFamilyConstants.gtWalsheimProMedium),
                prefixIcon: Text("₹ ",
                    style: TextStyle(
                        color: ColorConstants.darkBlue,
                        fontSize: 40,
                        fontFamily: FontFamilyConstants.gtWalsheimProMedium)),
                prefixIconConstraints:
                    const BoxConstraints(minWidth: 0, minHeight: 0)),
          )
        ],
      ),
    );
  }
}
