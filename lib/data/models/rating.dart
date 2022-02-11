class Rating {
    Rating({
        required this.cEmail,
        required this.behaviourWithStaff,
        required this.cleanliness,
        required this.payment,
        required this.poolBehaviour,
        required this.timelyCheckout,
    });

    String cEmail;
    int behaviourWithStaff;
    int cleanliness;
    int payment;
    int poolBehaviour;
    int timelyCheckout;

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        cEmail: json["cEmail"],
        behaviourWithStaff: json["behaviourWithStaff"],
        cleanliness: json["cleanliness"],
        payment: json["payment"],
        poolBehaviour: json["poolBehaviour"],
        timelyCheckout: json["timelyCheckout"],
    );

    Map<String, dynamic> toJson() => {
        "cEmail": cEmail,
        "behaviourWithStaff": behaviourWithStaff,
        "cleanliness": cleanliness,
        "payment": payment,
        "poolBehaviour": poolBehaviour,
        "timelyCheckout": timelyCheckout,
    };
}