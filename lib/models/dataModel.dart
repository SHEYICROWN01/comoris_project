class Post {
  String? ridersFullname;
  String? ridersRegCode;
  String? ridersTrackingId;
  String? ridersPhone;
  String? ridersPhoto;
  String? employerFullname;
  String? employerGender;
  String? employerAddress;
  String? employerRelationship;
  String? employerPhoto;
  String? employerRidersCode;

  Post(
      {this.ridersFullname,
        this.ridersRegCode,
        this.ridersTrackingId,
        this.ridersPhone,
        this.ridersPhoto,
        this.employerFullname,
        this.employerGender,
        this.employerAddress,
        this.employerRelationship,
        this.employerPhoto,
        this.employerRidersCode});

  Post.fromJson(Map<String, dynamic> json) {
    ridersFullname = json['riders_fullname'];
    ridersRegCode = json['riders_regCode'] == null ? '' : json['riders_regCode'];
    ridersTrackingId = json['riders_tracking_id'] == null ? '' : json['riders_tracking_id'];
    ridersPhone = json['riders_phone'] == null ? '' : json['riders_phone'];
    ridersPhoto = json['riders_photo'] == null ? '' : json['riders_photo'] ;
    employerFullname = json['employer_fullname'] == null ? '' :json['employer_fullname'] ;
    employerGender = json['employer_gender'] == null ? '' : json['employer_gender'] ;
    employerAddress = json['employer_address'] == null ? '' : json['employer_address'] ;
    employerRelationship = json['employer_relationship'] == null ? '' :json['employer_relationship'] ;
    employerPhoto = json['employer_photo'] == null ? '' : json['employer_photo'] ;
    employerRidersCode = json['employer_ridersCode'] == null ? '' : json['employer_ridersCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['riders_fullname'] = this.ridersFullname;
    data['riders_regCode'] = this.ridersRegCode;
    data['riders_tracking_id'] = this.ridersTrackingId;
    data['riders_phone'] = this.ridersPhone;
    data['riders_photo'] = this.ridersPhoto;
    data['employer_fullname'] = this.employerFullname;
    data['employer_gender'] = this.employerGender;
    data['employer_address'] = this.employerAddress;
    data['employer_relationship'] = this.employerRelationship;
    data['employer_photo'] = this.employerPhoto;
    data['employer_ridersCode'] = this.employerRidersCode;
    return data;
  }
}