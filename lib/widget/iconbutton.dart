import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:demoapp/main.dart';

class IconButtonCounter extends StatelessWidget {
  get borderRadius => BorderRadius.circular(8.0);
  IconButtonCounter(this.ref) : super();
  final WidgetRef ref;
  void test() {
    ref.read(countProvider.notifier).addCount();
    print(ref.watch(countProvider).toString());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 10,
        borderRadius: borderRadius,
        child: InkWell(
          focusColor: Colors.blue,
          onTap: () => {test()},
          child: Container(
            padding: EdgeInsets.all(0.0),
            height: 50.0, //MediaQuery.of(context).size.width * .08,
            width: 220.0, //MediaQuery.of(context).size.width * .3,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
            ),
            child: Row(
              children: <Widget>[
                LayoutBuilder(builder: (context, constraints) {
                  print(constraints);
                  return Container(
                    height: constraints.maxHeight,
                    width: constraints.maxHeight,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: borderRadius,
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  );
                }),
                Expanded(
                  child: Text(
                    'Click to plus 1',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
