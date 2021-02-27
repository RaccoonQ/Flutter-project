import 'package:woocommerce/models/customer.dart';

class MembershipName {
  int id;
  String name;
  String slug;
  String status;
  String accessMethod;
  bool hasSubscription;
  bool hasSubscriptionInstallment;
  List<Null> accessProductIds;
  String accessLengthType;
  String subscriptionAccessLengthType;
  Null accessLength;
  Null subscriptionAccessLength;
  Null accessStartDate;
  Null accessStartDateGmt;
  Null accessEndDate;
  Null accessEndDateGmt;
  Null subscriptionAccessStartDate;
  Null subscriptionAccessStartDateGmt;
  Null subscriptionAccessEndDate;
  Null subscriptionAccessEndDateGmt;
  String dateCreated;
  String dateCreatedGmt;
  String dateModified;
  String dateModifiedGmt;
  List<MetaData> metaData;
  Links lLinks;

  MembershipName(
      {this.id,
      this.name,
      this.slug,
      this.status,
      this.accessMethod,
      this.hasSubscription,
      this.hasSubscriptionInstallment,
      this.accessProductIds,
      this.accessLengthType,
      this.subscriptionAccessLengthType,
      this.accessLength,
      this.subscriptionAccessLength,
      this.accessStartDate,
      this.accessStartDateGmt,
      this.accessEndDate,
      this.accessEndDateGmt,
      this.subscriptionAccessStartDate,
      this.subscriptionAccessStartDateGmt,
      this.subscriptionAccessEndDate,
      this.subscriptionAccessEndDateGmt,
      this.dateCreated,
      this.dateCreatedGmt,
      this.dateModified,
      this.dateModifiedGmt,
      this.metaData,
      this.lLinks});

  MembershipName.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    status = json['status'];
    accessMethod = json['access_method'];
    hasSubscription = json['has_subscription'];
    hasSubscriptionInstallment = json['has_subscription_installment'];
    if (json['access_product_ids'] != null) {
      accessProductIds = json['accessProductIds'];
    }
    accessLengthType = json['access_length_type'];
    subscriptionAccessLengthType = json['subscription_access_length_type'];
    accessLength = json['access_length'];
    subscriptionAccessLength = json['subscription_access_length'];
    accessStartDate = json['access_start_date'];
    accessStartDateGmt = json['access_start_date_gmt'];
    accessEndDate = json['access_end_date'];
    accessEndDateGmt = json['access_end_date_gmt'];
    subscriptionAccessStartDate = json['subscription_access_start_date'];
    subscriptionAccessStartDateGmt = json['subscription_access_start_date_gmt'];
    subscriptionAccessEndDate = json['subscription_access_end_date'];
    subscriptionAccessEndDateGmt = json['subscription_access_end_date_gmt'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModified = json['date_modified'];
    dateModifiedGmt = json['date_modified_gmt'];
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
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['access_method'] = this.accessMethod;
    data['has_subscription'] = this.hasSubscription;
    data['has_subscription_installment'] = this.hasSubscriptionInstallment;
    if (this.accessProductIds != null) {
      data['accessProductIds'] = this.accessProductIds;
    }
    data['access_length_type'] = this.accessLengthType;
    data['subscription_access_length_type'] = this.subscriptionAccessLengthType;
    data['access_length'] = this.accessLength;
    data['subscription_access_length'] = this.subscriptionAccessLength;
    data['access_start_date'] = this.accessStartDate;
    data['access_start_date_gmt'] = this.accessStartDateGmt;
    data['access_end_date'] = this.accessEndDate;
    data['access_end_date_gmt'] = this.accessEndDateGmt;
    data['subscription_access_start_date'] = this.subscriptionAccessStartDate;
    data['subscription_access_start_date_gmt'] =
        this.subscriptionAccessStartDateGmt;
    data['subscription_access_end_date'] = this.subscriptionAccessEndDate;
    data['subscription_access_end_date_gmt'] =
        this.subscriptionAccessEndDateGmt;
    data['date_created'] = this.dateCreated;
    data['date_created_gmt'] = this.dateCreatedGmt;
    data['date_modified'] = this.dateModified;
    data['date_modified_gmt'] = this.dateModifiedGmt;
    if (this.metaData != null) {
      data['meta_data'] = this.metaData.map((v) => v.toJson()).toList();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}

class Links {
  List<Self> self;
  List<Collection> collection;

  Links({this.self, this.collection});

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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self.map((v) => v.toJson()).toList();
    }
    if (this.collection != null) {
      data['collection'] = this.collection.map((v) => v.toJson()).toList();
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
