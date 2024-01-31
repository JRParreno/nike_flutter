import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import 'package:nike_flutter/gen/colors.gen.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onChangeNav,
  });

  final int currentIndex;
  final Function(int value) onChangeNav;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorName.secondary,
      child: Container(
        padding: const EdgeInsets.only(top: 5),
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          color: ColorName.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: 1,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: ColorName.primary,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: ColorName.secondary,
          onTap: (value) {
            onChangeNav(value);
          },
          items: [
            BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: itemBGColor(currentIndex == 0),
                child: Icon(
                  UniconsLine.home_alt,
                  color: itemBGColor(currentIndex != 0),
                ),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: itemBGColor(currentIndex == 1),
                child: Icon(
                  UniconsLine.heart,
                  color: itemBGColor(currentIndex != 1),
                ),
              ),
              label: "Wishlist",
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: itemBGColor(currentIndex == 2),
                child: Icon(
                  UniconsLine.user,
                  color: itemBGColor(currentIndex != 2),
                ),
              ),
              label: "Account",
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                  backgroundColor: itemBGColor(currentIndex == 3),
                  child: Icon(
                    UniconsLine.shopping_cart,
                    color: itemBGColor(currentIndex != 3),
                  )),
              label: "Cart",
            ),
          ],
        ),
      ),
    );
  }

  Color itemBGColor(bool isSelected) {
    return isSelected ? ColorName.secondary : ColorName.primary;
  }
}
