import 'package:financialapp/data/modal/addData.dart';
import 'package:flutter/material.dart';


class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  String dropdownValue = 'food';
  
  final TextEditingController text= TextEditingController();
  final TextEditingController valor= TextEditingController();
  FocusNode ex = FocusNode();
  FocusNode ex1 = FocusNode();
  DateTime date = DateTime.now();
  @override
  void initState(){
    super.initState();
    ex.addListener(() { 
      setState(() {});
    });
    ex1.addListener(() { 
      setState(() {});
    });
  }
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
            myDrop(),
            const SizedBox(
              height: 15,
            ),
            myTextField(text, ex),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: valor,
              focusNode: ex1,
              keyboardType: TextInputType.number,
              strutStyle: const StrutStyle(
                height: 1.8
              ),
              decoration:   InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15
                ),
                labelText: "Valor Monetário",
                labelStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    width: 2,
                    color: Colors.grey
                  )
                )
              ),      
            ),
            const SizedBox(
              height: 15,
            ),
            myDrop(), 
            const SizedBox(
              height: 15,
            ),
            myData(),
            const Spacer(),
            Container(
              width: 200,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50)
              ),
              child: TextButton(
                onPressed: () {
                  // Adicione aqui a ação que deseja realizar ao clicar no botão
                },
                style: TextButton.styleFrom(
                  backgroundColor:  const Color(0xff368983),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
                child: const Text(
                  'Salvar Informações',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
             ),
            ),
            const SizedBox(
              height: 15,
            ),   
          ],
        ),
      ),
    );
  }

  Container myData() {
    return Container(
            height:60,
            width: 300,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 1, color: Colors.grey)
            ),
            child: TextButton(
              onPressed: () async{
                DateTime? newData = await showDatePicker(
                  context: context, 
                  initialDate: date, 
                  firstDate: DateTime(2023), 
                  lastDate: DateTime(2050)
                );
                if(newData==null){
                  return;
                }
                setState(() {
                  date=newData;
                });
              },
              child: Text(
                "Data ${date.year}-${date.month}-${date.day}"
              ),
            ),
          );
  }

  TextField myTextField(TextEditingController text, FocusNode ex) {
    return TextField(
            controller: text,
            focusNode: ex,
            strutStyle: const StrutStyle(
              height: 1.8
            ),
            decoration:   InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15
              ),
              labelText: "Explicação",
              labelStyle: const TextStyle(
                fontSize: 16,
                color: Colors.grey
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  width: 2,
                  color: Colors.grey
                )
              )
            ),
            
          );
  }

  Container myDrop() {
    return Container(
            height:60,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 1, color: Colors.grey)
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
