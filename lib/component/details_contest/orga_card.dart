import 'package:flutter/material.dart';

class OrgaCard extends StatelessWidget {
  const OrgaCard({super.key, required this.orga});
  final Map orga;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(right: size.width * 0.01),
      width: size.width,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: size.height * 0.07,
                width: size.width * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(orga['image']),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                orga['orginalName'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.width * 0.035,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
