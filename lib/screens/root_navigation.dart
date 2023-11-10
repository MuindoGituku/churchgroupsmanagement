import 'package:churchgroupsmanagement/screens/reports/acitivity_reports_list.dart';
import 'package:churchgroupsmanagement/screens/budgets/budgets_list.dart';
import 'package:churchgroupsmanagement/screens/calendars/calendar_events_list.dart';
import 'package:churchgroupsmanagement/screens/minutes/minutes_list.dart';
import 'package:churchgroupsmanagement/screens/requisitions/requisitions_list.dart';
import 'package:churchgroupsmanagement/screens/returns/returns_list.dart';
import 'package:churchgroupsmanagement/services/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class AppRootNavigation extends StatefulWidget {
  const AppRootNavigation({super.key});

  @override
  State<AppRootNavigation> createState() => _AppRootNavigationState();
}

final ZoomDrawerController zoomDrawerController = ZoomDrawerController();

class _AppRootNavigationState extends State<AppRootNavigation> {
  int currentSelectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: Builder(
        builder: (context) {
          return ZoomMenuScreen(
            currentSelectedScreen: currentSelectedScreen,
            onSelectedMenuItem: (menuItem) {
              setState(() {
                currentSelectedScreen = menuItem;
              });
              zoomDrawerController.close!();
            },
          );
        },
      ),
      mainScreen: getSelectedScreen(),
      controller: zoomDrawerController,
      borderRadius: 30,
      style: DrawerStyle.style1,
      showShadow: true,
      openCurve: Curves.fastOutSlowIn,
      slideWidth: MediaQuery.of(context).size.width * 0.8,
      menuScreenWidth: MediaQuery.of(context).size.width,
      duration: const Duration(milliseconds: 500),
      angle: 0.0,
      androidCloseOnBackTap: true,
      menuScreenTapClose: true,
      mainScreenTapClose: true,
    );
  }

  Widget getSelectedScreen() {
    switch (currentSelectedScreen) {
      case 0:
        return const AllGroupMinutes();
      case 1:
        return const AllActivityReports();
      case 2:
        return const AllCalendarEvents();
      case 3:
        return const AllGroupBudgets();
      case 4:
        return const AllExpenseRequisitions();
      case 5:
        return const AllReturnForms();
      default:
        return const AllGroupMinutes();
    }
  }
}

class ZoomMenuScreen extends StatelessWidget {
  const ZoomMenuScreen({
    super.key,
    required this.currentSelectedScreen,
    required this.onSelectedMenuItem,
  });

  final int currentSelectedScreen;
  final ValueChanged<int> onSelectedMenuItem;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      color: AppDecorations().mainBlueColor,
      child: Column(
        children: <Widget>[
          const Spacer(),
          ...appMenuItemsList
              .map((item) => buildMenuItem(
                    item,
                    appMenuItemsList.indexOf(item),
                  ))
              .toList(),
          const Spacer(),
        ],
      ),
    );
  }

  Widget buildMenuItem(MenuItem menuItem, int menuItemIndex) {
    return ListTileTheme(
      selectedTileColor: const Color.fromARGB(255, 110, 117, 131),
      textColor: Colors.white,
      selectedColor: Colors.white,
      child: ListTile(
        selected: currentSelectedScreen == menuItemIndex,
        leading: Image.asset(
          menuItem.selectedIcon,
          width: 20,
          height: 20,
        ),
        title: Text(
          menuItem.itemTitle,
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: currentSelectedScreen == menuItemIndex
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
        onTap: () => onSelectedMenuItem(menuItemIndex),
      ),
    );
  }
}

class ZoomMainScreen extends StatefulWidget {
  const ZoomMainScreen({super.key});

  @override
  State<ZoomMainScreen> createState() => _ZoomMainScreenState();
}

class _ZoomMainScreenState extends State<ZoomMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            zoomDrawerController.toggle!();
          },
          icon: const Icon(
            CupertinoIcons.line_horizontal_3,
          ),
        ),
      ),
    );
  }
}

List<MenuItem> appMenuItemsList = <MenuItem>[
  MenuItem(
    itemTitle: "Meeting Minutes",
    selectedIcon: "assets/icons/minutes_color.png",
  ),
  MenuItem(
    itemTitle: "Group Activity Reports",
    selectedIcon: "assets/icons/activity_color.png",
  ),
  MenuItem(
    itemTitle: "Calendar of Events",
    selectedIcon: "assets/icons/calendar_color.png",
  ),
  MenuItem(
    itemTitle: "Group Budget",
    selectedIcon: "assets/icons/budget_color.png",
  ),
  MenuItem(
    itemTitle: "Expense Requisitions",
    selectedIcon: "assets/icons/request_color.png",
  ),
  MenuItem(
    itemTitle: "Expenditure Returns",
    selectedIcon: "assets/icons/return_color.png",
  ),
];

class MenuItem {
  final String itemTitle;
  final String selectedIcon;

  MenuItem({
    required this.itemTitle,
    required this.selectedIcon,
  });
}
