# g_sneaker Internship Project

## For development

```
$ flutter pub get
$ flutter run -d chrome
```

Or you can run the project by your simulator

## For deployment

https://vanlyhai-gsneaker-goldenowl-v2.netlify.app/

## Youtube demo

https://youtu.be/faVKdM1Le64

## Các chức năng đã hoàn thành
- Display all products in `Our Products` section (for products data please check from [Technical Requirements](#technical-requirements)):
  - Single product should have name, description, price, image and `Add To Cart` button.
  - User able to click on `Add To Cart` to add target product to their cart.
  - Added product doesn't have `Add To Cart` button anymore, it should have `Check Mark Icon (✓)` instead.
- Display all added products in `Your Cart` section:
  - Each product in cart should have name, price, image, increase/decrease amount button and remove button.
  - User able to increase/decrease amount of a product in cart. When product's amount is decreased to zero, that product will be removed from cart naturally.
  - User able to remove product from cart.
  - Show total price of all products in car. When user increase/decrease product's amount or remove product, total price should be re-calculate correctly.
  - When there are no products in cart, we should show `Your cart is empty` message.
  - Products in cart should be persistent: When user visit the application, products are added before should be showed, user don't need to add products again.
