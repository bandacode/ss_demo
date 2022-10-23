import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ss_test/home/home.dart';
import 'package:ss_test/repo/app_repo.dart';
import 'package:ss_test/utils/utils.dart';

import 'config.dart';
import 'network/network.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  final repo = AppRepo(NetworkApi.init(baseUrl: kBaseUrl));
  runApp(MyApp(repo: repo));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.repo});

  final AppRepo repo;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: repo,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SS Restaurant Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
