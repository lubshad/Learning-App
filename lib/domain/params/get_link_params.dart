class GetLinkParams {
  final String link;

  GetLinkParams({required this.link});

  toMap() {
    return {
      "link": link
    };
  }
}
