import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/bloc/cart_bloc.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartBloc>(
      builder: (context,data,child){
        return Scaffold(
          appBar: AppBar(title: Text("Cart"),),
          body:data.totalItems==0?Center(child: Text("There is no items in the Cart\nPlease Buy Product",textAlign: TextAlign.center,),): SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: data.totalItems,
                    itemBuilder: (context,index){
                      return ListTile(
                        onTap: (){
                          data.remove(data.products[index]);
                        },
                        leading: Image.network(data.products[index].image),
                        title: Text(data.products[index].title),
                        subtitle: Text(data.products[index].sellingPrice.toString()),
                        trailing: Icon(Icons.remove),
                      );
                    }
                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(padding: EdgeInsets.all(15),
                  child: Text("Items(${data.totalItems})"),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: <Widget>[
                      Text("Total"),
                      Text(data.total.toString()),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
