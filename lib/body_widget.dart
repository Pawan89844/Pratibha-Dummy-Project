import 'package:flutter/material.dart';
import 'package:pratibha/model/data.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              height: 200,
              width: double.infinity,
              child: PageView(
                children: MY_DATA
                    .map((e) => Image.asset(
                          e.image!,
                          fit: BoxFit.cover,
                        ))
                    .toList(),
              )),
          SizedBox(height: 20),
          GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2.7 / 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 2,
            ),
            children: GRID_DATA
                .map(
                  (e) => Card(
                    elevation: 2,
                    child: GridTile(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          e.image,
                          scale: 1.5,
                        ),
                        SizedBox(height: 10),
                        Text(
                          e.text,
                          textAlign: TextAlign.center,
                        )
                      ],
                    )),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
