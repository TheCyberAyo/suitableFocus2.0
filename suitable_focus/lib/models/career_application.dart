class CareerApplication {
  final String applicantName;
  final String email;
  final String? resumeUrl;
  final String? portfolioUrl;
  final String positionId; // Optional, if you want to track the position applied for

  CareerApplication({
    required this.applicantName,
    required this.email,
    this.resumeUrl,
    this.portfolioUrl,
    required this.positionId,
  });

  factory CareerApplication.fromJson(Map<String, dynamic> json) {
    return CareerApplication(
      applicantName: json['applicantName'],
      email: json['email'],
      resumeUrl: json['resumeUrl'],
      portfolioUrl: json['portfolioUrl'],
      positionId: json['positionId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "applicantName": applicantName,
      "email": email,
      "resumeUrl": resumeUrl,
      "portfolioUrl": portfolioUrl,
      "positionId": positionId,
    };
  }
}