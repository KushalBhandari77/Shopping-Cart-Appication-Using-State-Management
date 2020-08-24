import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/bloc/cart_bloc.dart';
import 'package:statemanagement/model/product_model.dart';
import 'package:statemanagement/pages/cart_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List<Product> products=[
    Product(title: "Apple",price: 100,sellingPrice: 120,discription: "Branded Mustang Apple",
    image: "https://image.shutterstock.com/image-photo/red-apple-on-white-background-260nw-158989157.jpg"),
    Product(title: "Mango",price: 100,sellingPrice: 120,discription: "Mangoes from Local Producers",
        image: "https://image.shutterstock.com/image-photo/mango-leaf-fresh-yellow-on-260nw-1115987162.jpg"),
    Product(title: "Banana",price: 100,sellingPrice: 120,discription: "Fresh Bananas",
        image: "https://cdn.mos.cms.futurecdn.net/42E9as7NaTaAi4A6JcuFwG-1200-80.jpg"),
    Product(title: "Guava",price: 100,sellingPrice: 120,discription: "Direct From Trees",
        image:"https://image.shutterstock.com/image-photo/pink-guava-isolated-on-white-260nw-794794447.jpg"),
    Product(title: "Litchi",price: 100,sellingPrice: 120,discription: "Juicy Litchi",
        image: "https://c.ndtvimg.com/2019-06/46k7u31_lychee-_625x300_13_June_19.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<CartBloc>(
      builder: (context,data,child){
        return Scaffold(
          drawer: Drawer(),
          appBar: AppBar(title: Text("Shopping Cart"),
            actions: <Widget>[
              Row(
                children: <Widget>[
                  Text(data.totalItems.toString()),
                  IconButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
                    },
                    icon: Icon(Icons.shopping_cart),
                  ),

                ],
              )
            ],),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    itemBuilder: (context,index){
                      return ListTile(
                        onTap: (){
                          data.add(products[index]);
                        },
                        leading: Image.network(products[index].image),
                        title: Text(products[index].title),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Rs:"+products[index].price.toString(),style: TextStyle(
                              decoration: TextDecoration.lineThrough,color: Colors.red
                            ),),
                            Text("Rs:"+products[index].sellingPrice.toString(),style: TextStyle(color: Colors.green),),
                          ],
                        ),
                        trailing: Icon(Icons.add),
                      );
                    }
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
