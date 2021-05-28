import 'package:flutter/material.dart';

class SingleSelectionExample extends StatefulWidget {
  List<String> sortFilter;
  String nom;
  final Function upsi;
  SingleSelectionExample(this.sortFilter,this.nom,this.upsi);

  @override
  _SingleSelectionExampleState createState() => _SingleSelectionExampleState(upsi);
}

class _SingleSelectionExampleState extends State<SingleSelectionExample> {
  String selectedValue;
  final Function upsi;
  _SingleSelectionExampleState(this.upsi);
  @override
  void initState() {
    super.initState();

    selectedValue = widget.sortFilter.first;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (ctx, index) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            selectedValue = widget.sortFilter[index];
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: selectedValue == widget.sortFilter[index]
                  ? Colors.green[100]
                  : null,
              child: Row(
                children: <Widget>[
                  Text(widget.sortFilter[index]),Spacer(),Radio(
                      value: widget.sortFilter[index],
                      groupValue: selectedValue,
                      onChanged: (s) {
                        print('PUTAMARE CAMBIÉ');
                        print(index.runtimeType);
                        selectedValue = s;
                        upsi(index);
                        setState(() {});
                      }),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: widget.sortFilter.length,
    );
  }
}