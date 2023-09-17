import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'main.dart';

class TestScreen extends ConsumerWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(

      appBar: AppBar(title: Text("Multi-Languages"),),

      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Text(AppLocalizations.of(context)!.helloWorld),
          ElevatedButton(onPressed: ()=>ref.read(langProvider.state).state = "en", child: Text(AppLocalizations.of(context)!.bangla)),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: ()=>ref.read(langProvider.state).state = "bn", child: Text(AppLocalizations.of(context)!.english))

        ],
      ),
    );
  }
}
