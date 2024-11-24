import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddToWatchListWidget extends StatelessWidget {
  Color markColor;
  IconData icon;
   AddToWatchListWidget({this.markColor=Colors.black,this.icon=Icons.add,super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment:Alignment.center,
      children: [
      ImageIcon(AssetImage('assets/images/bookmark icon.png'),color: markColor,size: 35,),
      Icon(icon,color: Colors.white,size: 20,)
    ],);
  }
}
