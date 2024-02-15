import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../layout/default_layout.dart';

class QueryParamScreen extends StatelessWidget {
  const QueryParamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        body: ListView(children: [
      Text('Path Param : ${GoRouterState.of(context).pathParameters}'),
      ElevatedButton(
          onPressed: () {
            context.push(Uri(path: 'query_param', queryParameters: {
              'name': 'query',
              'age': '1',
            }).toString());
          },
          child: Text('Query Parameter')),
    ]));
  }
}
