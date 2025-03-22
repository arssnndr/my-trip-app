import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController searchController;
  final Function(String) onSearchChanged;
  final String? title;

  const Header({
    super.key,
    required this.searchController,
    required this.onSearchChanged,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('assets/images/my-trip-app-logo.png'),
      ),
      centerTitle: true,
      title:
          title != null
              ? Text(title!, style: TextStyle(color: Colors.white))
              : Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white),
                    suffixIcon: Icon(Icons.search),
                    suffixIconColor: Colors.white,
                  ),
                  style: TextStyle(color: Colors.white),
                  onChanged: onSearchChanged,
                ),
              ),
      backgroundColor: Colors.blue,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
