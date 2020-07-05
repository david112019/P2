import 'package:flutter/material.dart';
import 'package:xlo/models/filter.dart';

class VendorTypeField extends StatelessWidget {

  VendorTypeField({this.onSaved, this.initialValue});

  final FormFieldSetter<int> onSaved;
  final int initialValue;

  @override
  Widget build(BuildContext context) {
    return FormField<int>(
      initialValue: initialValue,
      onSaved: onSaved,
      builder: (state) {
        return Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                if(state.value & VENDOR_TYPE_GERAL !=0 ){
                  if(state.value & VENDOR_TYPE_HORTIFRUTIS !=0)
                    state.didChange(state.value & ~VENDOR_TYPE_GERAL);
                  else
                    state.didChange(VENDOR_TYPE_HORTIFRUTIS );
                } else{
                    state.didChange(state.value | VENDOR_TYPE_GERAL);
                }
                  
              },
              child: Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: state.value & VENDOR_TYPE_GERAL != 0
                            ? Colors.transparent
                            : Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    color: state.value & VENDOR_TYPE_GERAL != 0
                        ? Colors.deepPurpleAccent
                        : Colors.transparent),
                alignment: Alignment.center,
                child: Text('Geral',
                    style: TextStyle(
                        color: state.value & VENDOR_TYPE_GERAL != 0
                            ? Colors.white
                            : Colors.black)),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                if(state.value & VENDOR_TYPE_HORTIFRUTIS !=0 ){
                  if(state.value & VENDOR_TYPE_GERAL !=0)
                    state.didChange(state.value & ~VENDOR_TYPE_HORTIFRUTIS);
                  else
                    state.didChange(VENDOR_TYPE_GERAL );
                } else{
                  state.didChange(state.value | VENDOR_TYPE_HORTIFRUTIS);
                }

              },
              child: Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: state.value & VENDOR_TYPE_HORTIFRUTIS != 0
                            ? Colors.transparent
                            : Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    color: state.value & VENDOR_TYPE_HORTIFRUTIS != 0
                        ? Colors.deepPurpleAccent
                        : Colors.transparent),
                alignment: Alignment.center,
                child: Text('Hortifrutis',
                    style: TextStyle(
                        color: state.value & VENDOR_TYPE_HORTIFRUTIS != 0
                            ? Colors.white
                            : Colors.black)),
              ),
            ),
          ],
        );
      },
    );
  }
}
