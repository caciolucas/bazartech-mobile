import 'package:bazartech/models/product.dart';
import 'package:bazartech/models/user.dart';

class MockState {
  List<Product> products = [
    Product.fromMap({
      "id": 1,
      "tags_display": ["Teclado", "Logitech"],
      "owner_display": {
        "id": 1,
        "address": null,
        "permissions_display": [],
        "password":
            "pbkdf2_sha256\$260000\$TJH4TWFbLag8xiHzgSCjx5\$URNo6Iu3sxOAq8l6Nn8pG3t284CXBxW1Jbz4XcO45R8=",
        "last_login": "2022-05-07T14:06:32-03:00",
        "is_superuser": true,
        "name": "Cácio",
        "username": "cacio",
        "phone_number": "(84) 98631-8386",
        "email": null,
        "birthdate": null,
        "gender": null,
        "profile_picture": "QmXBdsBBD6cpXuFg9fCWrpQBhLmntHyLwh3EgvPHVP8UxL",
        "is_staff": true,
        "is_active": true,
        "registered_at": "2022-05-07T14:06:24.180427-03:00",
        "groups": [],
        "user_permissions": []
      },
      "images_display": [
        {
          "id": 1,
          "image": "QmXuW3Du8BdUkeaQVr98zFxvL3imaQbb4eCHxNQnnqr6pR",
          "description": "Teclado com caixa",
          "product": 1
        },
        {
          "id": 2,
          "image": "Qmd4VCvymfxFKG54QzH5vYj9zPy5gfgLHWeAb66TAjipt6",
          "description": "Teclado mecânico",
          "product": 1
        }
      ],
      "created_at": "2022-05-11T23:11:34.135164-03:00",
      "updated_at": "2022-05-11T23:11:34.135188-03:00",
      "name": "Teclado G915",
      "description": "Teclado mecânico da logitech, lowprofile e wireless",
      "price": "1400.00",
      "status": 1,
      "owner": 1,
      "tags": [1, 2]
    }),
    Product.fromMap({
      "id": 2,
      "tags_display": ["JBL", "Headphone"],
      "owner_display": {
        "id": 3,
        "address": {
          "id": 1,
          "city": "Natal",
          "state": "Rio Grande do Norte",
          "created_at": "2022-05-10T14:12:59.499598-03:00",
          "updated_at": "2022-05-10T14:12:59.499630-03:00",
          "zip_code": "10005",
          "street": "Rua 01",
          "number": "01",
          "district": "Hell's Kitchen"
        },
        "permissions_display": [],
        "password":
            "pbkdf2_sha256\$260000\$Un1fqXqK10LXgjABfeegk3\$Isrmz1rFefGmCMnIX2bpvXGuM+U2wEouA8Z9k2COJUI=",
        "last_login": null,
        "is_superuser": false,
        "name": "Matt Murdock",
        "username": "matt",
        "phone_number": null,
        "email": null,
        "birthdate": null,
        "gender": null,
        "profile_picture": "QmXBdsBBD6cpXuFg9fCWrpQBhLmntHyLwh3EgvPHVP8UxL",
        "is_staff": false,
        "is_active": true,
        "registered_at": "2022-05-10T14:12:59.513401-03:00",
        "groups": [],
        "user_permissions": []
      },
      "images_display": [
        {
          "id": 3,
          "image": "QmaRe3Vs6ma19YsfDu2STVdXRD98N6FMFG4R7ZBFCoM3WV",
          "description": "Caixa do fone",
          "product": 2
        },
        {
          "id": 4,
          "image": "QmZtN89h9pRykAndRert5Vnr5weJhWfFDqsg7V72p6ZdfE",
          "description": "Fone e dongle wireless",
          "product": 2
        },
        {
          "id": 5,
          "image": "QmYvQhE2SFRaQTuyPjPAh8tSpkWBZs2bAuVsnHbysdH5fC",
          "description": "Fone",
          "product": 2
        }
      ],
      "created_at": "2022-05-11T23:35:58.650370-03:00",
      "updated_at": "2022-05-11T23:35:58.650391-03:00",
      "name": "JBL Quantum 800",
      "description": "Fone da JBL wireless",
      "price": "900.00",
      "status": 1,
      "owner": 3,
      "tags": [3, 4]
    }),
    Product.fromMap({
      "id": 3,
      "tags_display": ["Teclado", "Logitech", "mas esse é diferente"],
      "owner_display": {
        "id": 1,
        "address": null,
        "permissions_display": [],
        "password":
            "pbkdf2_sha256\$260000\$TJH4TWFbLag8xiHzgSCjx5\$URNo6Iu3sxOAq8l6Nn8pG3t284CXBxW1Jbz4XcO45R8=",
        "last_login": "2022-05-07T14:06:32-03:00",
        "is_superuser": true,
        "name": "Cácio",
        "username": "cacio",
        "phone_number": "(84) 98631-8386",
        "email": null,
        "birthdate": null,
        "gender": null,
        "profile_picture": "QmXBdsBBD6cpXuFg9fCWrpQBhLmntHyLwh3EgvPHVP8UxL",
        "is_staff": true,
        "is_active": true,
        "registered_at": "2022-05-07T14:06:24.180427-03:00",
        "groups": [],
        "user_permissions": []
      },
      "images_display": [
        {
          "id": 1,
          "image": "QmXuW3Du8BdUkeaQVr98zFxvL3imaQbb4eCHxNQnnqr6pR",
          "description": "Teclado com caixa",
          "product": 1
        },
        {
          "id": 2,
          "image": "Qmd4VCvymfxFKG54QzH5vYj9zPy5gfgLHWeAb66TAjipt6",
          "description": "Teclado mecânico",
          "product": 1
        }
      ],
      "created_at": "2022-05-11T23:11:34.135164-03:00",
      "updated_at": "2022-05-11T23:11:34.135188-03:00",
      "name": "Teclado G915 do diferente",
      "description":
          "Outro teclado mecânico da logitech, lowprofile e wireless",
      "price": "100.00",
      "status": 0,
      "owner": 1,
      "tags": [1, 2]
    }),
  ];

  User user = User.fromMap(
    {
      "id": 1,
      "address": null,
      "permissions_display": [],
      "password":
          "pbkdf2_sha256\$260000\$TJH4TWFbLag8xiHzgSCjx5\$URNo6Iu3sxOAq8l6Nn8pG3t284CXBxW1Jbz4XcO45R8=",
      "last_login": "2022-05-07T14:06:32-03:00",
      "is_superuser": true,
      "name": "Cácio",
      "username": "cacio",
      "phone_number": "(84) 98631-8386",
      "email": "teste@teste.com",
      "birthdate": "2022-05-07T14:06:24.180427-03:00",
      "gender": null,
      "profile_picture": "QmXBdsBBD6cpXuFg9fCWrpQBhLmntHyLwh3EgvPHVP8UxL",
      "is_staff": true,
      "is_active": true,
      "registered_at": "2022-05-07T14:06:24.180427-03:00",
      "groups": [],
      "user_permissions": []
    },
  );
}
