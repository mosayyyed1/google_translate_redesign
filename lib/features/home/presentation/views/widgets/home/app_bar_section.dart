import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/themes/app_assets.dart';

class AppBarSection extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSection({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.blueAccent.withOpacity(0.9),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.star, color: Colors.white),
          ),
          const Spacer(),
          SvgPicture.asset(
            AppAssets.textAppLogo,
            width: 70,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          const SizedBox(width: 5),
          const Text(
            "Translate",
            style: TextStyle(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
