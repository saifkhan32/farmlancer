class PostModel {
  String title;
  String desc;
  String deadline;
  String budget;
  String approval;
  String contact;
  String uid;
  

  PostModel({
    required this.title,
    required this.desc,
    required this.deadline,
    required this.budget,
    required this.approval,
    required this.contact,
     required this.uid
   
  });

  // from map
  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      title: map['title'] ?? '',
      desc : map['desc'] ?? '',
      deadline: map['deadline'] ?? '',
      budget: map['budget'] ?? '',
      approval: map['approval'] ?? '',
      contact : map['contact'] ?? '',
      uid: map['uid'] ?? '',
    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "budget": budget,
      "deadline": deadline,
     "approval" : approval,
      "desc": desc,
       "contact" : contact ,
       "uid" : uid
    };
  }
}

class ApplicantModel {
  String name;
  String contact;
  String work;
  String budget;
  String time;
  String uid;
  

  ApplicantModel({
    required this.name,
    required this.time,
    required this.budget,
    required this.contact,
    required this.work,

     required this.uid
   
  });

  // from map
  factory ApplicantModel.fromMap(Map<String, dynamic> map) {
    return ApplicantModel(
      name: map['name'] ?? '',
      time : map['time'] ?? '',
      budget: map['budget'] ?? '',
      contact: map['contact'] ?? '',
      work: map['work'] ?? '',
      uid: map['uid'] ?? '',
    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "time":time ,
      "budget": budget,
     "work" : work,
       "contact" : contact ,
       "uid" : uid
    };
  }
}
