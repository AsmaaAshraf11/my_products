// features/payment/presentation/views/widgets/list_view_item_payment.dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:geocoding/geocoding.dart';
import 'package:myproducts/core/utils/api_keys.dart';
import 'package:myproducts/features/payment/data/models/amount/amount.dart';
import 'package:myproducts/features/payment/data/models/amount/details.dart';
import 'package:myproducts/features/payment/data/models/item_list_model/item.dart';
import 'package:myproducts/features/payment/data/models/item_list_model/item_list_model.dart';

class ItemPayment extends StatefulWidget {
  ItemPayment(
      {super.key, required this.name, required this.image, });
  final String name;
  final String image;
// Function? payment;


  @override
  State<ItemPayment> createState() => _ItemPaymentState();
}

class _ItemPaymentState extends State<ItemPayment> {
  String selectedPayment = '';
  @override
  Widget build(BuildContext context) {
      var amount = AmountModel(
              total: '100',
              currency: 'USD',
              details:
                  Details(subtotal: '100', shipping: '0', shippingDiscount: 0));
          List<OrderItem> order = [
            OrderItem(currency: "USD", name: "Apple", quantity: 4, price: '10'),
            OrderItem(
                currency: "USD", name: "Pineapple", quantity: 5, price: '12')
          ];
          var itemListModel = ItemListModel(orders: order);
    return GestureDetector(
      onTap: () {
     
        setState(() {
          selectedPayment = widget.name;
        });
         Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    PaypalCheckoutView(
                                  sandboxMode: true,
                                  clientId: ApiKeys.clientId,
                                  secretKey: ApiKeys.secretKey,
                                  transactions: [
                                    {
                                      "amount": amount.toJson(),

                                      "description":
                                          "The payment transaction description.",
                                      // "payment_options": {
                                      //   "allowed_payment_method":
                                      //       "INSTANT_FUNDING_SOURCE"
                                      // },
                                      "item_list": itemListModel.toJson(),
                                    }
                                  ],
                                  note:
                                      "Contact us for any questions on your order.",
                                  onSuccess: (Map params) async {
                                    log("onSuccess: $params");
                                    Navigator.pop(context);
                                  },
                                  onError: (error) {
                                    log("onError: $error");
                                    Navigator.pop(context);
                                  },
                                  onCancel: () {
                                    print('cancelled:');
                                    Navigator.pop(context);
                                  },
                                ),
                              ));
      },
      child: Container(
        width: 90,
        height: 50,
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: selectedPayment == widget.name ? Colors.green : Colors.grey,
            width: 2,
          ),
          //  bottom: BorderSide()

          // color: Colors.green.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: AspectRatio(
          aspectRatio: 1.5 / 0.5,
          child: Image.asset(
            widget.image,
            // height: 180,
            // width: 5,
          ),
        ),
      ),
    );
  }
}
