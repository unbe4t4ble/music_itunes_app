const String baseUrl = 'https://itunes.apple.com/';

String searchUrl(String str){
  String searchUrl = 'search?term=$str&media=music&entity=song&attribute=artistTerm';
  return baseUrl + searchUrl;
}