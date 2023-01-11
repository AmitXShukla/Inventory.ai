import 'package:flutter/material.dart';
import 'package:inventory/samples/color_palettes_screen.dart';
import 'package:inventory/samples/component_screen.dart';
import 'package:inventory/samples/elevation_screen.dart';
import 'package:inventory/samples/typography_screen.dart';
import 'package:inventory/views/shared/custom_style.dart';

void main() {
  runApp(const Material3Demo());
}

class Material3Demo extends StatefulWidget {
  const Material3Demo({super.key});

  @override
  State<Material3Demo> createState() => _Material3DemoState();
}

// NavigationRail shows if the screen width is greater or equal to
// screenWidthThreshold; otherwise, NavigationBar is used for navigation.
const double narrowScreenWidthThreshold = 450;

const Color m3BaseColor = Color(0xff6750a4);
const List<Color> colorOptions = [
  m3BaseColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink
];
const List<String> colorText = <String>[
  "M3 Baseline",
  "Blue",
  "Teal",
  "Green",
  "Yellow",
  "Orange",
  "Pink",
];

class _Material3DemoState extends State<Material3Demo> {
  bool useMaterial3 = true;
  bool useLightMode = true;
  int colorSelected = 0;
  int screenIndex = 0;

  late ThemeData themeData;

  @override
  initState() {
    super.initState();
    themeData = updateThemes(colorSelected, useMaterial3, useLightMode);
  }

  ThemeData updateThemes(int colorIndex, bool useMaterial3, bool useLightMode) {
    return ThemeData(
        colorSchemeSeed: colorOptions[colorSelected],
        useMaterial3: useMaterial3,
        brightness: useLightMode ? Brightness.light : Brightness.dark);
  }

  void handleScreenChanged(int selectedScreen) {
    setState(() {
      screenIndex = selectedScreen;
    });
  }

  void handleBrightnessChange() {
    setState(() {
      useLightMode = !useLightMode;
      themeData = updateThemes(colorSelected, useMaterial3, useLightMode);
    });
  }

  void handleMaterialVersionChange() {
    setState(() {
      useMaterial3 = !useMaterial3;
      themeData = updateThemes(colorSelected, useMaterial3, useLightMode);
    });
  }

  void handleColorSelect(int value) {
    setState(() {
      colorSelected = value;
      themeData = updateThemes(colorSelected, useMaterial3, useLightMode);
    });
  }

  Widget createScreenFor(int screenIndex, bool showNavBarExample) {
    switch (screenIndex) {
      case 0:
        return ComponentScreen(showNavBottomBar: showNavBarExample);
      case 1:
        return const ColorPalettesScreen();
      case 2:
        return const TypographyScreen();
      case 3:
        return const ElevationScreen();
      case 4:
        return const ColorPalettesScreen();
      case 5:
        return const TypographyScreen();
      case 6:
        return const ElevationScreen();
      default:
        return ComponentScreen(showNavBottomBar: showNavBarExample);
    }
  }

  PreferredSizeWidget createAppBar() {
    return AppBar(
      // title: useMaterial3 ? const Text("Material 3") : const Text("Material 2"),
      title: useMaterial3 ? const Text(cAppTitle) : const Text("Material 2"),
      actions: [
        IconButton(
          icon: useLightMode
              ? const Icon(Icons.wb_sunny_outlined)
              : const Icon(Icons.wb_sunny),
          onPressed: handleBrightnessChange,
          tooltip: "dark mode",
        ),
        // disable below toggle options for Material 2 /3
        // IconButton(
        //   icon: useMaterial3
        //       ? const Icon(Icons.filter_3)
        //       : const Icon(Icons.filter_2),
        //   onPressed: handleMaterialVersionChange,
        //   tooltip: "Switch to Material ${useMaterial3 ? 2 : 3}",
        // ),
        PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          itemBuilder: (context) {
            return List.generate(colorOptions.length, (index) {
              return PopupMenuItem(
                  value: index,
                  child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(
                          index == colorSelected
                              ? Icons.color_lens
                              : Icons.color_lens_outlined,
                          color: colorOptions[index],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(colorText[index]))
                    ],
                  ));
            });
          },
          onSelected: handleColorSelect,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: cAppTitle,
      themeMode: useLightMode ? ThemeMode.light : ThemeMode.dark,
      theme: themeData,
      home: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < narrowScreenWidthThreshold) {
          return Scaffold(
            appBar: createAppBar(),
            body: Row(children: <Widget>[
              createScreenFor(screenIndex, false),
            ]),
            bottomNavigationBar: NavigationBars(
              onSelectItem: handleScreenChanged,
              selectedIndex: screenIndex,
              isExampleBar: false,
            ),
          );
        } else {
          return Scaffold(
            appBar: createAppBar(),
            body: SafeArea(
              bottom: false,
              top: false,
              child: Row(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: NavigationRailSection(
                          onSelectItem: handleScreenChanged,
                          selectedIndex: screenIndex)),
                  const VerticalDivider(thickness: 1, width: 1),
                  createScreenFor(screenIndex, true),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:inventory/shared/custom_style.dart';
// import 'package:inventory/views/auth/login.dart';
// import 'package:inventory/views/about.dart';

// //import 'package:gallery/l10n/gallery_localizations.dart';

// class App extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // title: cAppTitle,
//       theme: ThemeData(
//         primarySwatch: MaterialColor(0xFF666666, {
//           50: Color.fromRGBO(4, 131, 184, .1),
//           100: Color.fromRGBO(4, 131, 184, .2),
//           200: Color.fromRGBO(4, 131, 184, .3),
//           300: Color.fromRGBO(4, 131, 184, .4),
//           400: Color.fromRGBO(4, 131, 184, .5),
//           500: Color.fromRGBO(4, 131, 184, .6),
//           600: Color.fromRGBO(4, 131, 184, .7),
//           700: Color.fromRGBO(4, 131, 184, .8),
//           800: Color.fromRGBO(4, 131, 184, .9),
//           900: Color.fromRGBO(4, 131, 184, 1),
//         }),
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       // home: CupertinoTabBarMain(),
//       home: HomePage(),
//       debugShowCheckedModeBanner: false,
//       routes: {
//         // '/': (context) => ERPHomePage(), - can not set if home: ERPHomePage() is setup, only works with initiated route
//         AboutUs.routeName: (context) =>
//             const AboutUs(key: null, title: 'About us'),
//         Login.routeName: (context) => Login(key: null, title: 'Login'),
//       },
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: AppBar(
//           leading: IconButton(
//             icon: const Icon(Icons.menu),
//             color: Colors.deepOrangeAccent,
//             iconSize: 28.0,
//             onPressed: () {
//               // Navigator.pushReplacementNamed(context, '/aboutus');
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) =>
//                         AboutUs(key: null, title: 'About us')),
//               );
//             },
//           ),
//           title: const Text(cAppTitle)),
//       body: ListView(
//         children: [
//           Center(
//             child: Login(key: null, title: 'Login'),
//           )
//         ],
//       ),
//     );
//   }
// }
