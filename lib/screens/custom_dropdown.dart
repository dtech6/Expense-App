import 'package:expense_app/constants/color_constants.dart';
import 'package:expense_app/constants/font_family_constants.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final List? items;
  final String? hint;
  const CustomDropDown({super.key, this.items, this.hint});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? _expandAnimation;
  bool isOpen = false;
  int valueIndex = -1;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _expandAnimation = CurvedAnimation(
      parent: controller!,
      curve: Curves.easeIn,
    );

    controller!.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.black12)),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (isOpen) {
                controller!.reverse();
                setState(() {
                  isOpen = false;
                });
              } else {
                controller!.forward();
                setState(() {
                  isOpen = true;
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.black12, width: isOpen ? 1 : 0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    valueIndex == -1 ? widget.hint! : widget.items![valueIndex],
                    style: TextStyle(
                        fontSize: 20,
                        color: ColorConstants.darkBlue,
                        fontFamily: valueIndex == -1
                            ? FontFamilyConstants.gtWalsheimProRegular
                            : FontFamilyConstants.gtWalsheimProMedium),
                  ),
                  Icon(isOpen
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down)
                ],
              ),
            ),
          ),
          SizeTransition(
            sizeFactor: _expandAnimation!,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListView.builder(
                  itemCount: widget.items!.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 10),
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            valueIndex = index;
                            controller!.reverse();
                            isOpen = false;
                          });
                        },
                        child: Text(
                          "${widget.items![index]}",
                          style: TextStyle(
                              fontSize: 20,
                              color: ColorConstants.darkBlue,
                              fontFamily: index == valueIndex
                                  ? FontFamilyConstants.gtWalsheimProBold
                                  : FontFamilyConstants.gtWalsheimProRegular),
                        ),
                      ),
                    );
                  })),
            ),
          ),
        ],
      ),
    );
  }
}
