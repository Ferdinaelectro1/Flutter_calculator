import 'package:flutter/material.dart';

class HomePage extends StatefulWidget
{
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>
{
  String printValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculatrice"),
        elevation: 16,
        actions: [
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.more_vert))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
            decoration: BoxDecoration(color: Colors.red),
            child: const Text("Menu de Calculatrice",style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: (){
                Navigator.pushNamed(
                  context, '/settingsPage');
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: const Text("À propos"),
              onTap: (){
                Navigator.pushNamed(
                  context, "/infoPage");
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey,
            height: 100,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(10.0),
            child: Text(printValue,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
          ),
          //Spacer(),
          Expanded(
            child: GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4
                  ), 
                itemCount: 16,
                itemBuilder: (context,index)
                {
                  return Padding(
                    padding: EdgeInsets.all(3),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 219, 74, 64),
                      ),
                      onPressed: (){
                        setState(() {
                          String saisi = getbutton(index);
                          if(saisi == "cls")//si c'est le boutton cls efface l'ecran
                          {
                            printValue = "";
                          }
                          else if(saisi == "=")//si c'est égale calculer
                          {
                            String tempres = coreCalculate(printValue);
                            printValue = "";
                            printValue = tempres;
                          }
                          else
                          {
                            printValue += saisi;
                          }
                        });
                      }, 
                      child: Text(getbutton(index),style: TextStyle(color: Colors.white,fontSize: 28)
                    ),
                    )
                  );
                }
            )
          ),
        ],
      )

    );
  }

  /* ************************************************BACKEND************************************************* */
  String getbutton(index)
  {
    const List<String> button = ['7','8','9','cl','4','5','6','+','1','2','3','-','*','0','/','='];
    return button[index];
  }

  Map<String,double> gettoken(String operation)
  {
    Map<String,double> res = {};
    String number = "";
    int isOp = 0;
    for(int i = 0; i < operation.length; i++)
    {
      if(RegExp(r'\d').hasMatch(operation[i]))//si le caractère est un nombre
      {
          if(i+1 >= operation.length)//si on atteint la fin de l'operation on récupère le dernier chiffre
          {
            number += operation[i];
            res['Numb$i'] = double.parse(number);
          }
        number += operation[i];//si c'est un nombre on incrémente à chaque fois le nombre dans la chaine number
      }

      else if(RegExp(r'[+\-*/=]').hasMatch(operation[i]))//Si le caractère est un symbole
      {
        if(isOp == 0)//à la première (isOp == 0) rencontre d'un symbole ajouter le premier nombre lu
        {
          res['Numb$i'] = double.parse(number);
          number = "";
        }
        if(number != "")//s'assurer que le nombre n'est pas pas une chaine vide ""
        {
          if(isOp == 1) //si on a déja vu un symole alors on récupère un nombre
          {
            res['Numb$i'] = double.parse(number);
            number = "";
            isOp = 2;
          }
        }
        res['Op${operation[i]}'] = 0;
        isOp = 1;
      }
    }
    return res;
  } 

  String coreCalculate(String operation)
  {
    Map<String,double> tokens = gettoken(operation);
    double resultat = 0;
    String op = '';
    for(var token in tokens.entries)
    {
      if(token.key[0] == "N")//si le token est un nombre
      {
        if(op.isNotEmpty)
        {
          switch (op)
          {
            case '+':
              resultat += token.value;
            break;

            case '-':
              resultat -= token.value;
            break;

            case '*':
              resultat *= token.value;
            break;

            case '/':
              resultat /= token.value;
            break;
          }
        }
        else //le premier nombre
        {
          resultat = token.value;
        }
      }
      else if(token.key[0] == "O") /*si le token est un opérateur on assigne l'opérateur à op afin 
      d'effectuer le calcul au prochain nombre*/
      {
        op = token.key[2];
      }
    }
    return resultat.toString();
  }
}