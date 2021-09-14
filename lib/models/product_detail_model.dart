// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ProductDetails productDetailsFromJson(String str) => ProductDetails.fromJson(json.decode(str));

String productDetailsToJson(ProductDetails data) => json.encode(data.toJson());

class ProductDetails {
  ProductDetails({
    this.data,
    this.relatedProducts,
  });
  
  Data data;
  List<RelatedProducts> relatedProducts;
  
  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
    data: Data.fromJson(json["data"]),
    relatedProducts: List<RelatedProducts>.from(json["related_products"].map((x) => RelatedProducts.fromJson(x))),
  );
  
  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "related_products": List<dynamic>.from(relatedProducts.map((x) => x.toJson())),
  };
}

class Data {
  Data({
    this.id,
    this.title,
    this.category,
    this.description,
    this.displayImage,
    this.remarks,
    this.saleCount,
    this.returnPolicy,
    this.instock,
    this.views,
    this.markedPrice,
    this.sellingPrice,
    this.store,
    this.iconUrl,
    this.productrequestoptions,
    this.productimages,
  });
  
  int id;
  String title;
  int category;
  String description;
  String displayImage;
  dynamic remarks;
  int saleCount;
  String returnPolicy;
  int instock;
  int views;
  String markedPrice;
  String sellingPrice;
  Store store;
  String iconUrl;
  List<Productrequestoption> productrequestoptions;
  List<dynamic> productimages;
  
  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    title: json["title"],
    category: json["category"],
    description: json["description"],
    displayImage: json["display_image"],
    remarks: json["remarks"],
    saleCount: json["sale_count"],
    returnPolicy: json["return_policy"],
    instock: json["instock"],
    views: json["views"],
    markedPrice: json["marked_price"],
    sellingPrice: json["selling_price"],
    store: Store.fromJson(json["store"]),
    iconUrl: json["icon_url"],
    productrequestoptions: List<Productrequestoption>.from(json["productrequestoptions"].map((x) => Productrequestoption.fromJson(x))),
    productimages: List<dynamic>.from(json["productimages"].map((x) => x)),
  );
  
  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "category": category,
    "description": description,
    "display_image": displayImage,
    "remarks": remarks,
    "sale_count": saleCount,
    "return_policy": returnPolicy,
    "instock": instock,
    "views": views,
    "marked_price": markedPrice,
    "selling_price": sellingPrice,
    "store": store.toJson(),
    "icon_url": iconUrl,
    "productrequestoptions": List<dynamic>.from(productrequestoptions.map((x) => x)),
    "productimages": List<dynamic>.from(productimages.map((x) => x)),
  };
}
class Productrequestoption {
    Productrequestoption({
        this.id,
        this.request,
        this.productrequestoptionchoices,
    });

    int id;
    String request;
    List<Productrequestoptionchoice> productrequestoptionchoices;

    factory Productrequestoption.fromJson(Map<String, dynamic> json) => Productrequestoption(
        id: json["id"],
        request: json["request"],
        productrequestoptionchoices: List<Productrequestoptionchoice>.from(json["productrequestoptionchoices"].map((x) => Productrequestoptionchoice.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "request": request,
        "productrequestoptionchoices": List<dynamic>.from(productrequestoptionchoices.map((x) => x.toJson())),
    };
}

class Productrequestoptionchoice {
    Productrequestoptionchoice({
        this.id,
        this.option,
        this.incDcrRate,
        this.rate,
    });

    int id;
    String option;
    bool incDcrRate;
    int rate;

    factory Productrequestoptionchoice.fromJson(Map<String, dynamic> json) => Productrequestoptionchoice(
        id: json["id"],
        option: json["option"],
        incDcrRate: json["inc_dcr_rate"] == null ? null : json["inc_dcr_rate"],
        rate: json["rate"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "option": option,
        "inc_dcr_rate": incDcrRate == null ? null : incDcrRate,
        "rate": rate,
    };
}

class Store {
  Store({
    this.id,
    this.name,
    this.storeName,
  });
  
  int id;
  String name;
  String storeName;
  
  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"],
    name: json["name"],
    storeName: json["store_name"],
  );
  
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "store_name": storeName,
  };
}

class RelatedProducts {
  RelatedProducts({
    this.id,
    this.title,
    this.displayImage,
    this.markedPrice,
    this.sellingPrice,
    this.iconUrl,
  });
  
  int id;
  String title;
  String displayImage;
  String markedPrice;
  String sellingPrice;
  String iconUrl;
  
  factory RelatedProducts.fromJson(Map<String, dynamic> json) => RelatedProducts(
    id: json["id"],
    title: json["title"],
    displayImage: json["display_image"],
    markedPrice: json["marked_price"],
    sellingPrice: json["selling_price"],
    iconUrl: json["icon_url"],
  );
  
  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "display_image": displayImage,
    "marked_price": markedPrice,
    "selling_price": sellingPrice,
    "icon_url": iconUrl,
  };
}
