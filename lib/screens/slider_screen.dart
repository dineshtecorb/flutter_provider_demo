import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/provider/slider_provider.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider Exapmle'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<SliderProvider>(
              builder: (context, value, child) {
                return Slider(
                    max: 1.0,
                    min: 0.0,
                    value: value.value,
                    onChanged: (onChanged) {
                      value.setValue(onChanged);
                    });
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Consumer<SliderProvider>(builder: (context, value, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent.withOpacity(value.value)),
                      child: const Center(child: Text("Container 1")),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 60,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.brown.withOpacity(value.value)),
                      child: const Center(child: Text("Container 2")),
                    ),
                  ),
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
