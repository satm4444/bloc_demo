import 'package:bloc_app/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Incremented !"),
                    duration: Duration(milliseconds: 400),
                  ));
                } else if (state.wasIncremented == false) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Decremented !"),
                    duration: Duration(milliseconds: 400),
                  ));
                }
              },
              builder: (context, state) {
                if (state.countervalue == 5) {
                  return Text(
                    "Hi Five" + state.countervalue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
                return Text(
                  state.countervalue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  child: Text('-'),
                ),
                SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  child: Text('+'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
