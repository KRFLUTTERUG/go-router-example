import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../layout/default_layout.dart';

class PopBaseScreen extends StatelessWidget {
  const PopBaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(body: ListView(
        children: [
          ElevatedButton(onPressed: () async {
            final res = await context.push('/pop/return');

            print(res);
          }, child: Text('Push Pop Return Screen')),
        ]
    ));
  }
}
