import 'package:flutter/material.dart';

import '../../constant.dart';


class SearchBarComponent extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: kDefaultPadding * 1.5, top: kDefaultPadding * 1.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(fontSize: 15),
        decoration: InputDecoration(
          prefixIcon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.search,
                color: Theme.of(context).colorScheme.onSurface),
          ),
          hintText: 'Search',
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          hintStyle: TextStyle(
              fontSize: 15, color: Theme.of(context).colorScheme.onSurface),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.white,
              )),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
