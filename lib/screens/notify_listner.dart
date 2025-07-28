import 'package:flutter/material.dart';

class NotifyListner extends StatelessWidget {
  NotifyListner({super.key});

  ValueNotifier<int> count = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notify"),
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: toggle,
            builder: (context, value, child) {
              return TextFormField(
                obscureText: toggle.value,
                decoration: InputDecoration(
                    hintText: 'Password',
                    suffix: InkWell(
                        onTap: () {
                          toggle.value = !toggle.value;
                        },
                        child: Icon(toggle.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility))),
              );
            },
          ),
          Center(
            child: ValueListenableBuilder(
              valueListenable: count,
              builder: (context, value, child) {
                return Text(
                  value.toString(),
                  style: TextStyle(fontSize: 50),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count.value++;
          print(count.value.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
