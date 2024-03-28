class DeliveryInfo {
  String? idDelivery;
  String? sender;
  String? addressee;
  String? stateDelivery;

  DeliveryInfo(
      {this.idDelivery, this.sender, this.addressee, this.stateDelivery});

  DeliveryInfo.fromJson(Map<String, dynamic> json) {
    idDelivery = json['id_delivery'];
    sender = json['sender'];
    addressee = json['addressee'];
    stateDelivery = json['state_Delivery'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_delivery'] = idDelivery;
    data['sender'] = sender;
    data['addressee'] = addressee;
    data['state_Delivery'] = stateDelivery;
    return data;
  }
}