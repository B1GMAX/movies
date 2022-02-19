import 'package:flutter/cupertino.dart';

class LoadingScreenWidget extends StatelessWidget {
  const LoadingScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.5,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 6.0,
        crossAxisCount: 2,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: 150,
                color: const Color(0xFF303030),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 30,
                width: 70,
                color: const Color(0xFF3D3D3D),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 30,
                width: 150,
                color: const Color(0xFF4D4D4D),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 30,
                width: 100,
                color: const Color(0xFF4D4D4D),
              ),
            ],
          ),
        );
      },
    );
  }
}
