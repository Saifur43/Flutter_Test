import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? time;

  Future<void> setupWorldTime(BuildContext context) async {
    WorldTime instance =
        WorldTime(location: 'Dhaka', flag: 'germany.png', url: 'Asia/Dhaka');
    await instance.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    getAsyncData();
  }

  getAsyncData() async {
    await setupWorldTime(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: const Center(
            child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        )));
  }
}
