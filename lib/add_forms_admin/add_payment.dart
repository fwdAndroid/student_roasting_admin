import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:student_roasting_admin/database/database.dart';
import 'package:student_roasting_admin/widgets/colors.dart';
import 'package:student_roasting_admin/widgets/exc_button.dart';
import 'package:student_roasting_admin/widgets/input_text.dart';
import 'package:student_roasting_admin/widgets/sidebar.dart';

class AddPayment extends StatefulWidget {
  const AddPayment({super.key});

  @override
  State<AddPayment> createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {
  TextEditingController recivePayment = TextEditingController();
  TextEditingController fees = TextEditingController();

  bool _isLoading = false;
  String dropdownValueName = "Student Name";
  String dropdownValuePrice = "Fees";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          "Go Back",
          textAlign: TextAlign.center,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
      ),
      body: Row(
        children: [
          Container(
            color: Color(0xff2294ed),
            width: 260,
            child: Column(
              children: [
                DrawerHeader(child: Image.asset("assets/logo.png")),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        selectedTileColor: Color(0xffeb4474),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (x) => SideDrawer()));
                        },
                        leading: Icon(Icons.school),
                        iconColor: Colors.white,
                        title: Text(
                          'Student Managment',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (x) => SideDrawer()));
                        },
                        leading: Icon(Icons.space_dashboard_outlined),
                        iconColor: Colors.white,
                        title: Text(
                          'Teacher Management',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (x) => SideDrawer()));
                        },
                        leading: Icon(Icons.date_range),
                        iconColor: Colors.white,
                        title: Text(
                          'DateSheet Management',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (x) => SideDrawer()));
                        },
                        leading: Icon(Icons.payment),
                        iconColor: Colors.white,
                        title: Text(
                          'Payment Managment',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (x) => SideDrawer()));
                        },
                        leading: Icon(Icons.notifications),
                        iconColor: Colors.white,
                        title: Text(
                          'Notifications',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 320,
          ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              width: 448,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Payment Record",
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 22.63),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  //Plot Price
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Student Name",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 9),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("students")
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        return Column(
                          children: [
                            Container(
                              height: 50,
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: DropdownSearch<String>(
                                  popupProps: PopupProps.menu(
                                    showSearchBox: true,
                                    isFilterOnline: true,
                                    title: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                          child: Text("Search Student Name")),
                                    ),
                                    showSelectedItems: true,
                                    disabledItemFn: (String s) =>
                                        s.startsWith('I'),
                                  ),
                                  items: snapshot.data!.docs
                                      .map((DocumentSnapshot document) {
                                        Map<String, dynamic> data = document
                                            .data()! as Map<String, dynamic>;
                                        return data["studentname"];
                                      })
                                      .toList()
                                      .cast<String>(),
                                  selectedItem: dropdownValueName,
                                  onChanged: (String? day) {
                                    print(day);
                                    setState(() {
                                      dropdownValueName = day!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Select Student Fees",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            ),
                            Container(
                              height: 50,
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: DropdownSearch<String>(
                                  popupProps: PopupProps.menu(
                                    showSearchBox: true,
                                    isFilterOnline: true,
                                    title: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                          child: Text("Search Student Name")),
                                    ),
                                    showSelectedItems: true,
                                    disabledItemFn: (String s) =>
                                        s.startsWith('I'),
                                  ),
                                  items: snapshot.data!.docs
                                      .map((DocumentSnapshot document) {
                                        Map<String, dynamic> data = document
                                            .data()! as Map<String, dynamic>;
                                        return data["fees"].toString();
                                      })
                                      .toList()
                                      .cast<String>(),
                                  selectedItem: dropdownValuePrice,
                                  onChanged: (String? day) {
                                    print(day);
                                    setState(() {
                                      dropdownValuePrice = day!;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                  const SizedBox(height: 9),
                  //location of plot
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Receive Fees",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 9),
                  InputText(
                    controller: recivePayment,
                    labelText: "Geroge",
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) {},
                    onSaved: (val) {},
                    textInputAction: TextInputAction.done,
                    isPassword: false,
                    enabled: true,
                  ),

                  SizedBox(
                    height: 9,
                  ),
                  const SizedBox(height: 30),
                  WonsButton(
                    height: 50,
                    width: 348,
                    verticalPadding: 0,
                    color: AppColors.primary,
                    child: _isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                            color: Colors.white,
                          ))
                        : Text(
                            "Add",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                    onPressed: makeDateSheet,
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void makeDateSheet() async {
    if (recivePayment.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("All Fields are required")));
    } else {
      setState(() {
        _isLoading = true;
      });
      String rse = await DatabaseMethods().addPayment(
        fees: int.parse(dropdownValuePrice),
        reciveamount: int.parse(recivePayment.text),
        studentName: dropdownValueName,
        remaingAmount: totalValue(
            int.parse(dropdownValuePrice), int.parse(recivePayment.text)),
        dateTime: DateTime.now().millisecondsSinceEpoch.toString(),
      );

      print(rse);
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Conguration Payment Record is Added")));
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => SideDrawer()));
    }
  }

  totalValue(int a, int v) {
    int c = a - v;
    return c;
  }
}
