import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todos/notifier/counter.dart';
import 'package:todos/widget/iconbutton.dart';

/// We are using [StateNotifierProvider] here for a very simple logic (state++)
//* We should be using it [StateNotifierProvider] to handle advnace business logic,
//* i.e.: compare the previous & new state
///
/// Otherwise use [Provider] or [StateProvider] to avoid recomputing/optimise uneeded rebuilds

class CounterHome extends HookConsumerWidget {
  const CounterHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void click() {
      ref.read(countProvider.notifier).addCount();
      print(ref.watch(countProvider).toString());
    }

    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            body: Center(
          widthFactor: 100,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //* Watching the state in the countProvider
                Text('Current count ${ref.watch(countProvider).toString()}'),
                InkWell(
                  child: TextButton(
                    //* Trigger the action declared in notifier
                    onPressed: () => click(),
                    child: Text('Click me +1'),
                  ),
                ),
                IconButtonCounter(ref)
              ]),
        )));
  }
}
