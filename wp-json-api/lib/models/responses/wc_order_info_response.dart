// Copyright (c) 2020, WooSignal Ltd.
// All rights reserved.
//
// Redistribution and use in source and binary forms are permitted
// provided that the above copyright notice and this paragraph are
// duplicated in all such forms and that any documentation,
// advertising materials, and other materials related to such
// distribution and use acknowledge that the software was developed
// by the WooSignal. The name of the
// WooSignal may not be used to endorse or promote products derived
// from this software without specific prior written permission.
// THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR
// IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.

import 'dart:ffi';

class WCOrderInfoResponse {
  Data data;
  String message;
  int status;

  WCOrderInfoResponse({this.data, this.message, this.status});

  WCOrderInfoResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int id;
  int customerId;
  int number;
  String orderKey;
  String createdVia;
  String status;
  Float total;
  String paymentMethod;
  String paymentMethodTitle;
  // String firstName;
  // String lastName;
  // String displayName;
  // String avatar;

  List<MetaData> shipping;
  List<MetaData> billing;
  List<MetaData> metaData;
  List<MetaData> lineItems;

  Data({
    this.id,
    this.customerId,
    this.number,
    this.orderKey,
    this.createdVia,
    this.status,
    this.total,
    this.shipping,
    this.billing,
    this.metaData,
    this.lineItems,
    //   this.firstName,
    // this.lastName,
    // this.displayName,
    // this.avatar,
  });

  Data.fromJson(Map<String, dynamic> json) {
    // firstName = json['first_name'];
    // lastName = json['last_name'];
    // displayName = json['display_name'];
    // avatar = json['avatar'];

    if (json['shipping'] != null && Map.of(json['shipping']).isNotEmpty) {
      this.shipping = [];
      Map.from(json['shipping']).forEach((key, value) {
        this.shipping.add(MetaData.fromJson(key, value));
      });
    }
    // shipping = json['shipping'] != null
    //     ? new Shipping.fromJson(json['shipping'])
    //     : null;

    if (json['billing'] != null && Map.of(json['billing']).isNotEmpty) {
      this.billing = [];
      Map.from(json['billing']).forEach((key, value) {
        this.billing.add(MetaData.fromJson(key, value));
      });
    }
    // billing =
    //     json['billing'] != null ? new Billing.fromJson(json['billing']) : null;

    if (json['meta_data'] != null && Map.of(json['meta_data']).isNotEmpty) {
      this.metaData = [];
      Map.from(json['meta_data']).forEach((key, value) {
        this.metaData.add(MetaData.fromJson(key, value));
      });
    }

    if (json['lineItems'] != null && Map.of(json['lineItems']).isNotEmpty) {
      this.metaData = [];
      Map.from(json['lineItems']).forEach((key, value) {
        this.metaData.add(MetaData.fromJson(key, value));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customerId'] = this.customerId;
    data['number'] = this.number;
    data['orderKey'] = this.orderKey;
    data['createdVia'] = this.createdVia;
    data['status'] = this.status;
    data['total'] = this.total;
    data['paymentMethod'] = this.paymentMethod;
    data['paymentMethodTitle'] = this.paymentMethodTitle;

    // data['first_name'] = this.firstName;
    // data['last_name'] = this.lastName;
    // data['display_name'] = this.displayName;
    // data['avatar'] = this.avatar;
    if (this.shipping != null) {
      data['shipping'] = this.shipping.map((e) => e.toJson()).toList();
    }
    if (this.billing != null) {
      data['billing'] = this.billing.map((e) => e.toJson()).toList();
    }
    if (this.metaData != null) {
      data['meta_data'] = this.metaData.map((e) => e.toJson()).toList();
    }
    if (this.lineItems != null) {
      data['lineItems'] = this.lineItems.map((e) => e.toJson()).toList();
    }

    return data;
  }

  /// Returns an array of meta data from a WP MetaData [key]
  ///
  /// Returns List<dynamic>
  List<dynamic> getMetaDataArrayWhere(String key) {
    MetaData metaData =
        this.metaData.firstWhere((e) => e.key == key, orElse: () => null);
    if (metaData == null || metaData.value == null) {
      return null;
    }
    return metaData.value;
  }

  /// Returns an array of meta data from a WP Shipping [key]
  ///
  /// Returns List<dynamic>
  List<dynamic> getShippingArrayWhere(String key) {
    MetaData shipping =
        this.shipping.firstWhere((e) => e.key == key, orElse: () => null);
    if (shipping == null || shipping.value == null) {
      return null;
    }
    return shipping.value;
  }

  /// Returns an array of meta data from a WP Billing [key]
  ///
  /// Returns List<dynamic>
  List<dynamic> getBillingArrayWhere(String key) {
    MetaData billing =
        this.billing.firstWhere((e) => e.key == key, orElse: () => null);
    if (billing == null || billing.value == null) {
      return null;
    }
    return billing.value;
  }

  /// Returns an array of meta data from a WP MetaData [key]
  ///
  /// Returns List<dynamic>
  List<dynamic> getLineItemsArrayWhere(String key) {
    MetaData lineItems =
        this.lineItems.firstWhere((e) => e.key == key, orElse: () => null);
    if (lineItems == null || lineItems.value == null) {
      return null;
    }
    return lineItems.value;
  }

  /// Returns a single meta data value from a WP shipping [key]
  ///
  /// Returns dynamic
  dynamic getShippingFirstWhere(String key) {
    MetaData shipping =
        this.shipping.firstWhere((e) => e.key == key, orElse: () => null);
    if (shipping == null ||
        shipping.value == null ||
        shipping.value.length < 1) {
      return null;
    }
    return shipping.value.first;
  }
}

//   /// Returns a single meta data value from a WP billing [key]
//   ///
//   /// Returns dynamic
//   dynamic getBillingFirstWhere(String key) {
//     MetaData billing =
//         this.billing.firstWhere((e) => e.key == key, orElse: () => null);
//     if (billing == null ||
//         billing.value == null ||
//         billing.value.length < 1) {
//       return null;
//     }
//     return billing.value.first;
//   }
// }

//   /// Returns a single meta data value from a WP MetaData [key]
//   ///
//   /// Returns dynamic
//   dynamic getMetaDataFirstWhere(String key) {
//     MetaData metaData =
//         this.metaData.firstWhere((e) => e.key == key, orElse: () => null);
//     if (metaData == null ||
//         metaData.value == null ||
//         metaData.value.length < 1) {
//       return null;
//     }
//     return metaData.value.first;
//   }
// }

class Shipping {
  String firstName;
  String lastName;
  String company;
  String address1;
  String address2;
  String city;
  String state;
  String postcode;
  String country;

  Shipping(
      {this.firstName,
      this.lastName,
      this.company,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.postcode,
      this.country});

  Shipping.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    company = json['company'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['company'] = this.company;
    data['address_1'] = this.address1;
    data['address_2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['postcode'] = this.postcode;
    data['country'] = this.country;
    return data;
  }
}

class Billing {
  String firstName;
  String lastName;
  String company;
  String address1;
  String address2;
  String city;
  String state;
  String postcode;
  String country;
  String email;
  String phone;

  Billing(
      {this.firstName,
      this.lastName,
      this.company,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.postcode,
      this.country,
      this.email,
      this.phone});

  Billing.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    company = json['company'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    country = json['country'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['company'] = this.company;
    data['address_1'] = this.address1;
    data['address_2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['postcode'] = this.postcode;
    data['country'] = this.country;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}

class MetaData {
  String key;
  List<dynamic> value;

  MetaData({this.key, this.value});

  MetaData.fromJson(String key, List<dynamic> value) {
    this.key = key;
    this.value = value;
  }

  Map<String, dynamic> toJson() {
    final Map<String, List<dynamic>> data = new Map<String, List<dynamic>>();
    if (key != null) {
      data[key] = this.value;
    }
    return data;
  }
}
