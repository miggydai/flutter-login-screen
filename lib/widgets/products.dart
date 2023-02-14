import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProdCard extends StatelessWidget {
  final String name;
  final String pic;
  const ProdCard({Key? key, required this.name, required this.pic,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *.15,
      height: 300,
      child: Card(
        elevation: 70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(pic),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
            ),
            SizedBox(
              height: 5,
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(
                  name, textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)
                ),
             ),

            ElevatedButton.icon(onPressed: () {}, icon: Icon(FontAwesomeIcons.cartShopping, size: 15,), label: Text("add to cart", style: TextStyle(fontWeight: FontWeight.w500 ),), style: ElevatedButton.styleFrom(primary: Color.fromRGBO(107, 137, 232, 1)),)
          ],
        ),
      ),
    );
  }
}
