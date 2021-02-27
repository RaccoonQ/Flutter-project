import 'dart:convert';

class WooMember {
  int id;
  int customerId;
  int planId;
  String status;
  int orderId;
  int productId;
  int subscriptionId;
  String dateCreated;
  String dateCreatedGmt;
  String startDate;
  String startDateGmt;
  String endDate;
  String endDateGmt;
  String pausedDate;
  String pausedDateGmt;
  String cancelledDate;
  String cancelledDateGmt;
  String viewUrl;
  List<MetaData> metaData;
  Links lLinks;

  WooMember(
      {this.id,
      this.customerId,
      this.planId,
      this.status,
      this.orderId,
      this.productId,
      this.subscriptionId,
      this.dateCreated,
      this.dateCreatedGmt,
      this.startDate,
      this.startDateGmt,
      this.endDate,
      this.endDateGmt,
      this.pausedDate,
      this.pausedDateGmt,
      this.cancelledDate,
      this.cancelledDateGmt,
      this.viewUrl,
      this.metaData,
      this.lLinks});

  WooMember.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    planId = json['plan_id'];
    status = json['status'];
    orderId = json['order_id'];
    productId = json['product_id'];
    subscriptionId = json['subscription_id'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    startDate = json['start_date'];
    startDateGmt = json['start_date_gmt'];
    endDate = json['end_date'];
    endDateGmt = json['end_date_gmt'];
    pausedDate = json['paused_date'];
    pausedDateGmt = json['paused_date_gmt'];
    cancelledDate = json['cancelled_date'];
    cancelledDateGmt = json['cancelled_date_gmt'];
    viewUrl = json['view_url'];
    if (json['meta_data'] != null) {
      metaData = new List<MetaData>();
      json['meta_data'].forEach((v) {
        metaData.add(new MetaData.fromJson(v));
      });
    }
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['plan_id'] = this.planId;
    data['status'] = this.status;
    data['order_id'] = this.orderId;
    data['product_id'] = this.productId;
    data['subscription_id'] = this.subscriptionId;
    data['date_created'] = this.dateCreated;
    data['date_created_gmt'] = this.dateCreatedGmt;
    data['start_date'] = this.startDate;
    data['start_date_gmt'] = this.startDateGmt;
    data['end_date'] = this.endDate;
    data['end_date_gmt'] = this.endDateGmt;
    data['paused_date'] = this.pausedDate;
    data['paused_date_gmt'] = this.pausedDateGmt;
    data['cancelled_date'] = this.cancelledDate;
    data['cancelled_date_gmt'] = this.cancelledDateGmt;
    data['view_url'] = this.viewUrl;
    if (this.metaData != null) {
      data['meta_data'] = this.metaData.map((v) => v.toJson()).toList();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}

class MetaData {
  int id;
  String key;
  String value;

  MetaData({this.id, this.key, this.value});

  MetaData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['key'] = this.key;
    data['value'] = this.value;
    return data;
  }
}

class Links {
  List<Self> self;
  List<Collection> collection;
  List<Customer> customer;

  Links({this.self, this.collection, this.customer});

  Links.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      self = new List<Self>();
      json['self'].forEach((v) {
        self.add(new Self.fromJson(v));
      });
    }
    if (json['collection'] != null) {
      collection = new List<Collection>();
      json['collection'].forEach((v) {
        collection.add(new Collection.fromJson(v));
      });
    }
    if (json['customer'] != null) {
      customer = new List<Customer>();
      json['customer'].forEach((v) {
        customer.add(new Customer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self.map((v) => v.toJson()).toList();
    }
    if (this.collection != null) {
      data['collection'] = this.collection.map((v) => v.toJson()).toList();
    }
    if (this.customer != null) {
      data['customer'] = this.customer.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Self {
  String href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class Collection {
  String href;

  Collection({this.href});

  Collection.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class Customer {
  String href;

  Customer({this.href});

  Customer.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

Map<String, dynamic> toMap(WooMember woomember) => {
      'id': woomember.id,
      'customer_id': woomember.customerId,
      'plan_id': woomember.planId,
      'status': woomember.status,
      "order_id": woomember.orderId,
      "product_id": woomember.productId,
      "subscription_id": woomember.subscriptionId,
    };

String encodeMembers(List<WooMember> woomember) => json.encode(
      woomember
          .map<Map<String, dynamic>>((woomember) => toMap(woomember))
          .toList(),
    );

List<WooMember> decodeMembers(String woomember) =>
    (json.decode(woomember) as List<dynamic>)
        .map<WooMember>((item) => WooMember.fromJson(item))
        .toList();
