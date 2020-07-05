import 'package:flutter/material.dart';
import 'package:xlo/models/filter.dart';
import 'package:xlo/screens/filter/widgets/animated_button.dart';
import 'package:xlo/screens/filter/widgets/order_by_field.dart';
import 'package:xlo/screens/filter/widgets/price_range_field.dart';
import 'package:xlo/screens/filter/widgets/section_title.dart';
import 'package:xlo/screens/filter/widgets/vendor_type_field.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Filtro de busca"),
      ),
      body: Stack(
        children: <Widget>[
          Form(
            key: _formKey,
            child: ListView(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              children: <Widget>[
                const SectionTitle(title: "Ordernar por:",),
                OrderByField(
                  initialValue: OrderBy.TIME,
                  onSaved: (v){

                  }
                ),

                const SectionTitle(title: "Preço (R\$)",),
                PriceRangeField(),
                const SectionTitle(title: "Tipo de Produto:",),
                VendorTypeField(
                  initialValue: VENDOR_TYPE_GERAL,
                  onSaved: (v){

                  },
                ),
                const SizedBox(height: 200,)
              ],
            ),
          ),
          AnimatedButton(
            scrollController: _scrollController,
            onTap: (){},
          ),
        ],
      ),
    );
  }
}
