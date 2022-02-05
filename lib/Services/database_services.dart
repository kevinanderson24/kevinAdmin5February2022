import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebutler/model/product_model.dart';

class DatabaseServices{
  final CollectionReference collectionReference =
    Firestore.instance.collection('product');

  List<Product> _productSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc) {
      return Product(
        id: doc.data['id'] ?? 'id',
        name: doc.data['name'] ?? 'name',
        price: doc.data['price'] ?? 0,
        description: doc.data['description'] ?? 'desc',
        url: doc.data['url'] ?? 'url',
      );
    }).toList();
  }

  Stream<List<Product>> get productStream {
    return collectionReference.snapshots().map(_productSnapshot);
  }
}