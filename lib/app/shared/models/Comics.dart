class Comics {
  int id;
  String title;
  String description;
  String thumbnailUrl;
  String price;
  String copyright;

  Comics({
    this.id,
    this.title,
    this.description,
    this.thumbnailUrl,
    this.price,
    this.copyright,
  });

  String httpToHttpsConvert(String thumbnailUrl) {
    // * Verify if thumbnailUrl string is empty
    // * Verify if thumbnailUrl starting with https or http
    // * case intitialize with http, replace to https

    if (thumbnailUrl.isNotEmpty) {
      if (!thumbnailUrl.startsWith('https://')) {
        thumbnailUrl = thumbnailUrl.replaceFirst('http', 'https');
      }
    }

    return thumbnailUrl;
  }

  // This functiton get comic description and run substring
  // for return the first 200 characters
  String modifyDescription(String description) {
    if (description.length > 250) {
      description = description.substring(0, 250);
    } else if (description.length == 0) {
      description = "";
    }

    return description;
  }
}
