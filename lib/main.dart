import 'package:flutter/material.dart';
import 'package:untitled2/model/stat_model.dart';
import 'package:untitled2/screen/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter<StatModel>(StatModelAdapter());
  Hive.registerAdapter<ItemCode>(ItemCodeAdapter());

  for(ItemCode itemcode in ItemCode.values) {
    await Hive.openBox<StatModel>(itemcode.name);
  }

  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'sunflower',
      ),
      home: HomeScreen(),
    ),
  );
}
