import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:student_roasting_admin/siderbarclasses_admin/datasheet_management.dart';
import 'package:student_roasting_admin/siderbarclasses_admin/noti.dart';
import 'package:student_roasting_admin/siderbarclasses_admin/payment_management.dart';
import 'package:student_roasting_admin/siderbarclasses_admin/student_management.dart';
import 'package:student_roasting_admin/siderbarclasses_admin/teacher_management.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      key: _key,
      appBar: isSmallScreen
          ? AppBar(
              backgroundColor: canvasColor,
              leading: IconButton(
                onPressed: () {
                  // if (!Platform.isAndroid && !Platform.isIOS) {
                  //   _controller.setExtended(true);
                  // }
                  _key.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu),
              ),
            )
          : null,
      drawer: ExampleSidebarX(controller: _controller),
      body: Row(
        children: [
          if (!isSmallScreen) ExampleSidebarX(controller: _controller),
          Expanded(
            child: Center(
              child: _ScreensExample(
                controller: _controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Color(0xffeb4474),
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 230,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 140,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Admin Panel",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              //  Image.asset(
              //   "assets/logo.png",
              //   height: 200,
              // ),
            ),
          ),
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.school,
          label: 'Student Management',
        ),
        SidebarXItem(
          icon: Icons.space_dashboard_outlined,
          label: 'Teacher Management',
        ),
        SidebarXItem(
          icon: Icons.date_range,
          label: 'DateSheet Management',
        ),
        SidebarXItem(
          icon: Icons.payment,
          label: 'Payment Management',
        ),
        SidebarXItem(
          icon: Icons.notifications,
          label: 'Notifications',
        ),
        SidebarXItem(
          icon: Icons.logout,
          label: 'Logout',
        ),
      ],
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        switch (controller.selectedIndex) {
          case 0:
            return StudentManagement();
          case 1:
            return TeacherManagement();
          case 2:
            return DateSheetManagement();
          case 3:
            return PaymentManagement();
          case 4:
            return Noti();
          case 5:
            return AlertDialog(
              title: const Text('Sign Out Alert'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text('Are you sure to logout from Admin Panel'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: Color(0xffeb4474)),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text(
                    'No',
                    style: TextStyle(color: Color(0xffeb4474)),
                  ),
                  onPressed: () {},
                ),
              ],
            );

          default:
            return Text(
              'Not found page',
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}

const canvasColor = Color(0xff2294ed);
const scaffoldBackgroundColor = Color(0xffeb4474);
const accentCanvasColor = Color(0xff2294ed);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: Colors.black.withOpacity(0.3), height: 1);
