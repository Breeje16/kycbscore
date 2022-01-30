class Customer {
  Customer({
    required this.cEmail,
    required this.cFirstName,
    required this.cLastName,
    required this.cCity,
    required this.cCountry,
    required this.noOfRatings,
    required this.netBehaviourWithStaff,
    required this.netCleanliness,
    required this.netPayment,
    required this.netPoolBehaviour,
    required this.netTimelyCheckout,
    required this.netScore,
  });

  final String cEmail;
  final String cFirstName;
  final String cLastName;
  final String cCity;
  final String cCountry;
  final int noOfRatings;
  final String netBehaviourWithStaff;
  final String netCleanliness;
  final String netPayment;
  final String netPoolBehaviour;
  final String netTimelyCheckout;
  final String netScore;

  factory Customer.fromMap(Map<String, dynamic> json) => Customer(
        cEmail: json["cEmail"],
        cFirstName: json["cFirstName"],
        cLastName: json["cLastName"],
        cCity: json["cCity"],
        cCountry: json["cCountry"],
        noOfRatings: json["noOfRatings"],
        netBehaviourWithStaff: json["netBehaviourWithStaff"],
        netCleanliness: json["netCleanliness"],
        netPayment: json["netPayment"],
        netPoolBehaviour: json["netPoolBehaviour"],
        netTimelyCheckout: json["netTimelyCheckout"],
        netScore: json["netScore"],
      );

  Map<String, dynamic> toMap() => {
        "cEmail": cEmail,
        "cFirstName": cFirstName,
        "cLastName": cLastName,
        "cCity": cCity,
        "cCountry": cCountry,
        "noOfRatings": noOfRatings,
        "netBehaviourWithStaff": netBehaviourWithStaff,
        "netCleanliness": netCleanliness,
        "netPayment": netPayment,
        "netPoolBehaviour": netPoolBehaviour,
        "netTimelyCheckout": netTimelyCheckout,
        "netScore": netScore,
      };
}