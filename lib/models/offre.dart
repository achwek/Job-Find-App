class Offre {
  String company;
  String logoUrl;

  bool isMark;

  String title;

  String location;

  String time;

  List<String> req;
  Offre(this.company, this.logoUrl, this.isMark, this.title, this.location,
      this.time, this.req);
  static List<Offre> generateOffres() {
    return [
      Offre("Google", "assets/images/google.png", false, "Product Design",
          "San Francisco", "Full time", [
        "Proven ability to appraise different materials and identify ideal production methods for a project.",
        " Expertise in design, color and shape to create aesthetically pleasing end results.",
        " Possess knowledge of manufacturing techniques and materials to achieve desired design outcomes. ",
      ]),
      Offre("Google", "assets/images/google.png", true, "Software Engineer",
          "San Francisco", "Part Time", [
        "HTML/CSS",
        "Javascript",
        "PHP",
        "Python",
        "Ruby",
        "NodeJS",
        "Java",
        "C#",
      ]),
      Offre("Google", "assets/images/google.png", false, "Software Engineer",
          "San Francisco", "Full time", [
        "HTML/CSS",
        "Java",
        "C#",
      ]),
      Offre("Google", "assets/images/google.png", false, "Software Engineer",
          "San Francisco", "Part Time", [
        "HTML/CSS",
        "Javascript",
        "PHP",
      ]),
    ];
  }
}
