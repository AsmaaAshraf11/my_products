// features/cart/presentation/views/widgets/list_view_payment.dart
import 'package:flutter/material.dart';
import 'package:myproducts/core/resources/app_assets.dart';
import 'package:myproducts/features/cart/data/models/payment_model.dart';

class ListViewPayment extends StatefulWidget {
  @override
  State<ListViewPayment> createState() => _ListViewPaymentState();
}
class _ListViewPaymentState extends State<ListViewPayment> {
     List<PaymentModel>Payment=[
      PaymentModel(image:  ImageAssets.MasterCard, name: 'MasterCard'),
       PaymentModel(image: ImageAssets.visa, name: 'visa'),
       PaymentModel(image:ImageAssets.paypal, name: 'paypal')

     ];
  @override
  Widget build(BuildContext context) {
    return Container(
                height: 70,
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) 
                    {
                    //  return
                    //   ItemPayment(model: Payment[index],
                         
                    //    );
                        
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                    itemCount: Payment.length),
              );
  }
}
