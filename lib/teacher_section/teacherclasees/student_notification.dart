import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:student_roasting_admin/widgets/colors.dart';
import 'package:student_roasting_admin/widgets/exc_button.dart';

class StudentNotification extends StatefulWidget {
  const StudentNotification({super.key});

  @override
  State<StudentNotification> createState() => _StudentNotificationState();
}

class _StudentNotificationState extends State<StudentNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/logo.png",
              height: 250,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: 400,
              margin: EdgeInsets.only(
                left: 40,
                right: 40,
                bottom: 10,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Write a Message',
                  hintText: 'Write a Message',
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
                keyboardType: TextInputType.multiline,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: WonsButton(
              height: 50,
              width: 348,
              verticalPadding: 0,
              color: AppColors.primary,
              child: const Text(
                "Send",
                style: TextStyle(
                    color: AppColors.neutral,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
