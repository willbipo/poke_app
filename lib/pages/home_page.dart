import 'package:flutter/material.dart';
import 'package:poke_api/models/list_item.dart';
import 'package:poke_api/routes/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ItemList> lista = AppRoutes.optionsList();

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Pokémon')),
      ),
      body: Center(
        child: ListView.separated(
            itemBuilder: (_, index) {
              final item = lista[index];
              // return ListTile(
              //   leading: Icon(item.icon),
              //   title: Text(item.text),
              //   onTap: () => Navigator.pushNamed(context, item.route),
              // );

              return Container(
                //height: 300,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(item.route);
                  },
                  child: Card(
                    color: Colors.red,
                    elevation: 5,
                    shadowColor: Colors.red,
                    child: Center(
                        child: Column(
                      children: [
                        Image(
                            height: 300,
                            //color: Colors.white,

                            fit: BoxFit.fill,
                            image: AssetImage(item.imageRoute)),
                        Text(
                          item.text,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )),
                    //color: Colors.blue,
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) {
              return Container();
            },
            itemCount: AppRoutes.optionsList().length),
      ),
    );
  }
}
