import 'package:flutter/material.dart';

import 'constans.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({
    super.key,
    this.onTap,  this.isLoading=false,
  });
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: isLoading? SizedBox(
        height: 24,width: 24,
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ): Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        child: Center(
          child: Text(
            'Add',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        decoration: BoxDecoration(
            color: kprimarycolor, borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
