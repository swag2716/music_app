import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:song_app/controllers/get_musics.dart';
import 'package:song_app/screens/Music_list_screen.dart';
import 'package:flutter_bloc/src/repository_provider.dart';

void main() async{
  await dotenv.load(fileName: 'assets/.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: RepositoryProvider(
        create: (context) => Musics(),
        child: const MusicListScreen(),
      ),
    );
  }
}



