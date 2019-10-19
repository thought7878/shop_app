import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_shop_app/providers/product.dart';
import 'package:udemy_shop_app/providers/products.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit_product';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _submittingProduct =
      Product(id: null, title: '', description: '', price: 0, imageUrl: '');
  var initValue = {
    "title": "",
    "description": "",
    "price": "",
    "imageUrl": "",
  };
  var isInit = true;

  @override
  void initState() {
    super.initState();
    _imageUrlFocusNode.addListener(_updateImage);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isInit) {
      final productId = ModalRoute.of(context).settings.arguments as String;
      if (productId != null) {
        _submittingProduct = Provider.of<Products>(context).findById(productId);
        initValue = {
          "title": _submittingProduct.title,
          "description": _submittingProduct.description,
          "price": _submittingProduct.price.toString(),
          // "imageUrl": _submittingProduct.imageUrl,
        };
        _imageUrlController.text = _submittingProduct.imageUrl;
      }
      isInit = false;
    }
  }

  @override
  void dispose() {
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.removeListener(_updateImage);
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  void _updateImage() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    if (_submittingProduct.id != null) {
      //update
      Provider.of<Products>(context, listen: false)
          .updateProduct(_submittingProduct.id, _submittingProduct);
    } else {
      //add
      Provider.of<Products>(context, listen: false)
          .addProduct(_submittingProduct);
    }
    Navigator.of(context).pop();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                initialValue: initValue['title'],
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please provide a title!';
                  }
                  return null;
                },
                onFieldSubmitted: (val) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                onSaved: (value) {
                  _submittingProduct = Product(
                    id: _submittingProduct.id,
                    title: value,
                    description: _submittingProduct.description,
                    price: _submittingProduct.price,
                    imageUrl: _submittingProduct.imageUrl,
                    isFavorite: _submittingProduct.isFavorite,
                  );
                },
              ),
              TextFormField(
                initialValue: initValue['price'],
                decoration: InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a price!';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number!';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Please enter a number greater than zero!';
                  }
                  return null;
                },
                onFieldSubmitted: (val) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                onSaved: (value) {
                  _submittingProduct = Product(
                    id: _submittingProduct.id,
                    title: _submittingProduct.title,
                    description: _submittingProduct.description,
                    price: double.parse(value),
                    imageUrl: _submittingProduct.imageUrl,
                    isFavorite: _submittingProduct.isFavorite,
                  );
                },
              ),
              TextFormField(
                initialValue: initValue['description'],
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                // textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a description!';
                  }
                  if (value.length < 5) {
                    return 'Should be at least 5 charactors.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _submittingProduct = Product(
                    id: _submittingProduct.id,
                    title: _submittingProduct.title,
                    description: value,
                    price: _submittingProduct.price,
                    imageUrl: _submittingProduct.imageUrl,
                  );
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 8, right: 10),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: _imageUrlController.text.isEmpty
                        ? Text(
                            'Enter  a url',
                            textAlign: TextAlign.center,
                          )
                        : Image.network(
                            _imageUrlController.text,
                            fit: BoxFit.cover,
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      // initialValue: initValue[' '],
                      decoration: InputDecoration(labelText: 'Image Url'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      focusNode: _imageUrlFocusNode,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a image url.';
                        }
                        if (!value.startsWith('http') &&
                            !value.startsWith('https')) {
                          return 'Please enter a valid url.';
                        }
                        return null;
                      },
                      onFieldSubmitted: (val) {
                        _saveForm();
                      },
                      onSaved: (value) {
                        _submittingProduct = Product(
                          id: _submittingProduct.id,
                          title: _submittingProduct.title,
                          description: _submittingProduct.description,
                          price: _submittingProduct.price,
                          imageUrl: value,
                          isFavorite: _submittingProduct.isFavorite,
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
