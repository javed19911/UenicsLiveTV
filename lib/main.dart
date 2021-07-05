import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:unics_live_tv/res/string/Strings.dart';
import 'package:unics_live_tv/route_generator.dart';
import 'package:unics_live_tv/res/string/Strings.dart';

import 'data/AppDataManager.dart';
import 'multiLanguage/localization_delegate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await FlutterDownloader.initialize();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static String createdPrivacyPolicy = 'privacy_policy';
  static String createdTermsOfUses = 'terms_of_uses';

  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class Model with ChangeNotifier {
  int channel = 0;
  void updateChannelNumber(int num) {
    channel = channel * 10 + num;
    notifyListeners();
  }
}

class ChannelAction extends Action<ChannelIntent> {
  ChannelAction(this.model);

  final Model model;

  @override
  void invoke(covariant ChannelIntent intent) {
    model.updateChannelNumber(intent.num);
  }
}

class ChannelIntent extends Intent {
  const ChannelIntent(this.num);
  final int num;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  Model model = Model();

  AppDataManager _dataManager = AppDataManager();
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  void didChangeDependencies() async {
    _dataManager.getSelectedLanguage().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  /*@override
  void initState() {
    super.initState();
    DynamicLinkService().retrieveDynamicLink(context);
  }*/

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
        LogicalKeySet(LogicalKeyboardKey.digit0): ChannelIntent(0),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          ChannelIntent: ChannelAction(model),
        },
        child: MaterialApp(
          title: Strings.app_name,
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: const Color(0xFF02BB9F),
            primaryColorDark: const Color(0xFF038a75),
            accentColor: const Color(0xFFFFAD32),
          ),
          initialRoute: '/',
          onGenerateRoute: RouteGenerator.generateRoute,
          locale: _locale,
          supportedLocales: [
            Locale('en'),
            Locale('hi'),
            Locale('mr'),
            Locale('kn')
          ],
          localizationsDelegates: [
            AppLocalizationDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
        ),
      ),
    );
  }
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
