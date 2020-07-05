import 'package:flutter/material.dart';

import 'icon_tile.dart';

class IconSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconTile(
          label: "Catálogo",
          iconData: Icons.list,
          onTap: () {},
          highlighted: false,
        ),
        IconTile(
          label: "Inserir Anuncio",
          iconData: Icons.edit,
          onTap: () {},
          highlighted: false,
        ),
        IconTile(
          label: "Carteira",
          iconData: Icons.account_balance_wallet,
          onTap: () {},
          highlighted: false,
        ),
        IconTile(
          label: "Minha Conta",
          iconData: Icons.person,
          onTap: () {},
          highlighted: false,
        ),
        IconTile(
          label: "Sair",
          iconData: Icons.person,
          onTap: () {},
          highlighted: false,
        )
      ],
    );
  }
}
