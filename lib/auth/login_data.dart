import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:student_roasting_admin/provider/circular_provider.dart';
import 'package:student_roasting_admin/widgets/sidebar.dart';
import 'package:student_roasting_admin/widgets/utils.dart';

class Database {
  //Login
  login(String email, String password, BuildContext context) async {
    await FirebaseFirestore.instance
        .collection('admin')
        .get()
        .then((QuerySnapshot querySnapshot) =>
            querySnapshot.docs.forEach((doc) {
              if (doc['password'] == password && doc['email'] == email) {
                Customdialog().showInSnackBar("Logged in", context);
                Provider.of<CircularProgressProvider>(context, listen: false)
                    .setValue(false);
                Customdialog.closeDialog(context);

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => SideDrawer()),
                    (route) => false);
              } else {
                Provider.of<CircularProgressProvider>(context, listen: false)
                    .setValue(false);
                print(Provider.of<CircularProgressProvider>(context).getValue);
                Customdialog().showInSnackBar("wrong", context);
                Customdialog.closeDialog(context);
              }
            }))
        .catchError((w) {
      Customdialog().showInSnackBar(w, context);
    });
  }
}
