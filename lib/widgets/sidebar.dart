// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:sidebarx/sidebarx.dart';
// import 'package:yasudha_property_admin/sidebar_classes/agent_managment.dart';
// import 'package:yasudha_property_admin/sidebar_classes/payment_management.dart';
// import 'package:yasudha_property_admin/sidebar_classes/plot_management.dart';
// import 'package:yasudha_property_admin/sidebar_classes/project_management.dart';
// import 'package:yasudha_property_admin/sidebar_classes/user_management.dart';
// import 'package:yasudha_property_admin/widgets/colors.dart';

// import '../sidebar_classes/sub_agent_management.dart';

// class SideDrawer extends StatefulWidget {
//   const SideDrawer({Key? key}) : super(key: key);

//   @override
//   State<SideDrawer> createState() => _SideDrawerState();
// }

// class _SideDrawerState extends State<SideDrawer> {
//   final _controller = SidebarXController(selectedIndex: 0, extended: true);
//   final _key = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     final isSmallScreen = MediaQuery.of(context).size.width < 600;

//     return Scaffold(
//       key: _key,
//       appBar: isSmallScreen
//           ? AppBar(
//               backgroundColor: canvasColor,
//               leading: IconButton(
//                 onPressed: () {
//                   // if (!Platform.isAndroid && !Platform.isIOS) {
//                   //   _controller.setExtended(true);
//                   // }
//                   _key.currentState?.openDrawer();
//                 },
//                 icon: const Icon(Icons.menu),
//               ),
//             )
//           : null,
//       drawer: ExampleSidebarX(controller: _controller),
//       body: Row(
//         children: [
//           if (!isSmallScreen) ExampleSidebarX(controller: _controller),
//           Expanded(
//             child: Center(
//               child: _ScreensExample(
//                 controller: _controller,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ExampleSidebarX extends StatelessWidget {
//   const ExampleSidebarX({
//     Key? key,
//     required SidebarXController controller,
//   })  : _controller = controller,
//         super(key: key);

//   final SidebarXController _controller;

//   @override
//   Widget build(BuildContext context) {
//     return SidebarX(
//       controller: _controller,
//       theme: SidebarXTheme(
//         margin: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: canvasColor,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         hoverColor: scaffoldBackgroundColor,
//         textStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
//         selectedTextStyle: const TextStyle(color: Colors.green),
//         itemTextPadding: const EdgeInsets.only(left: 30),
//         selectedItemTextPadding: const EdgeInsets.only(left: 30),
//         itemDecoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(color: canvasColor),
//         ),
//         selectedItemDecoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(
//             color: actionColor.withOpacity(0.37),
//           ),
//           gradient: const LinearGradient(
//             colors: [accentCanvasColor, canvasColor],
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.28),
//               blurRadius: 30,
//             )
//           ],
//         ),
//         iconTheme: IconThemeData(
//           color: Colors.black.withOpacity(0.7),
//           size: 20,
//         ),
//         selectedIconTheme: const IconThemeData(
//           color: Colors.black,
//           size: 20,
//         ),
//       ),
//       extendedTheme: const SidebarXTheme(
//         width: 230,
//         decoration: BoxDecoration(
//           color: canvasColor,
//         ),
//       ),
//       headerBuilder: (context, extended) {
//         return SizedBox(
//           height: 200,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Image.asset(
//               "assets/logo.png",
//               height: 200,
//             ),
//           ),
//         );
//       },
//       items: [
//         SidebarXItem(
//           icon: Icons.support_agent,
//           label: 'Agent Management',
//         ),
//         SidebarXItem(
//           icon: Icons.person,
//           label: 'User Management',
//         ),
//         SidebarXItem(
//           icon: Icons.subject,
//           label: 'Sub Agent Management',
//         ),
//         SidebarXItem(
//           icon: Icons.location_city,
//           label: 'Plot Management',
//         ),
//         SidebarXItem(
//           icon: Icons.propane,
//           label: 'Project Managment',
//         ),
//       ],
//     );
//   }
// }

// class _ScreensExample extends StatelessWidget {
//   const _ScreensExample({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);

//   final SidebarXController controller;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return AnimatedBuilder(
//       animation: controller,
//       builder: (context, child) {
//         switch (controller.selectedIndex) {
//           case 0:
//             return const AgentManagement();
//           case 1:
//             return const UserManagement();
//           case 2:
//             return const SubAgentManagement();
//           case 3:
//             return const PlotManagement();
//           case 4:
//             return ProjectManagement();

//           default:
//             return Text(
//               'Not found page',
//               style: theme.textTheme.headlineSmall,
//             );
//         }
//       },
//     );
//   }
// }

// const primaryColor = Colors.white;
// const canvasColor = Colors.white;
// const scaffoldBackgroundColor = Colors.greenAccent;
// const accentCanvasColor = Colors.greenAccent;
// const white = Colors.white;
// final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
// final divider = Divider(color: Colors.black.withOpacity(0.3), height: 1);
