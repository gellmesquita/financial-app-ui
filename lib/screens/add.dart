import 'package:flutter/material.dart';
import 'package:financialapp/data/dataAdd.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  String dropdownValue = 'food';
  final textEditingController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 650,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      backContainer(),
                      Positioned(
                        top: 90,
                        child: mainContainer(),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Container mainContainer() {
    return Container(
      width: 340,
      height: 550,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height:60,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 2, color: Colors.grey)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  hint: const Text(
                    "Selecione uma opção",
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  ),
                  isExpanded: true,
                  dropdownColor: Colors.white,
                  underline: Container(),
                  items: ['food', 'Transfer', 'Education', 'Transportation'].map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: SizedBox(
                      child:Row(
                        children: [
                          SizedBox(
                            width: 30,
                            child: Image.asset("images/$value.png"),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            value,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      )
                      
                    ),
                  );
                 }).toList(),
                           ),
              )
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(

            )
            
          ],
        ),
      ),
    );
  }

  Column backContainer() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 300,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            color: Color(0xff368983),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 25,
                          color: Colors.white,
                        )),
                    const Text(
                      "Adicionar Historico",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.attach_file,
                      size: 26,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
