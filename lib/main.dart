import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multi_language/test_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final langProvider = StateProvider<String>((ref) => "bn");


class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    String lang = ref.watch<String>(langProvider);

    return MaterialApp(
        localizationsDelegates:[
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: Locale(lang),
        supportedLocales: [
          Locale("en"),
          Locale("bn"),
        ],

        localeResolutionCallback: (local,supportedLocals){
          for(var supportedLocal in supportedLocals){
            if (supportedLocal.languageCode == local?.languageCode &&
                supportedLocal.countryCode == local?.countryCode){
              return supportedLocal;
            }
          }
          return supportedLocals.first;
        },
        home:  HomeScreen(),
      );

  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      body: Column(

        mainAxisSize: MainAxisSize.min,

        children: [
          Text(AppLocalizations.of(context)!.helloWorld),

          SizedBox(height: 10),

          ElevatedButton(onPressed: ()=>ref.read(langProvider.state).state = "bn", child: Text("Bangla")),
          SizedBox(height: 10),
          ElevatedButton(onPressed: ()=>ref.read(langProvider.state).state = "en", child: Text("English")),


          SizedBox(height: 10),
          ElevatedButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> TestScreen())), child: Text("English")),


        ],
      ),
    );
  }
}
