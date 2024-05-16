import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? time;

  void setUpWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'Dhaka', flag: 'dhaka.png', url: 'Asia/Dhaka');
    time = await instance.getData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading screen ${time}'),
    );
  }
}
