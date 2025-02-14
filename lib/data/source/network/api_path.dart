class ApiPath {
  static const String _apiPath = 'api/v1';

  // User
  static const String userPath = '$_apiPath/user';
  static const String photoUpload = '$_apiPath/uploads';
  static const String suggestEdit = '$_apiPath/suggestion';
  static const String approveSuggestion = '$_apiPath/suggestion/approve';
  static const String rejectSuggestion = '$_apiPath/suggestion/reject';
  static const String suggestions = '$_apiPath/suggestion/pizzaPlace';
  static const String userProfile = '$_apiPath/user/profile';

  static const String userAccessTokenPath = '$_apiPath/auth/login';
  static const String userRegisterPath = '$_apiPath/auth/signUp';
  static const String pizzaPlaces = '$_apiPath/places';
  static const String userPlaces = '$_apiPath/user/places';
  static const String userValidateRegisterPath = '$userPath/validateregister';
  static const String searchPlaces = '$_apiPath/places';
  static const String pizzaPlaceReviews = '$_apiPath/reviews/place/';
  static const String addPizzaPlaceReview = '$_apiPath/reviews';

  static const String userResetPasswordPath = '$userPath/sendpasswordresetmail';
  static const String userMePath = '$userPath/me';

  static String userShowPath({required int userId}) => '$userPath/$userId/show';
  static const String userBookmarkPath = '$userPath/bookmark';
  static const String userUnbookmarkPath = '$userPath/unbookmark';

  static String userSuggestedPath({required int userId}) =>
      '$userPath/$userId/suggestedusers';

  static String userSocialFriendsPath({required int userId}) =>
      '$userPath/$userId/socialfriends';
  static const String userSearchedPath = '$userPath/search';
  static const String userFollowPath = '$userPath/follow';
  static const String userUnfollowPath = '$userPath/unfollow';
  static const String userEditPath = '$userPath/edit';
  static const String userRankingPath = '$userPath/ranking';

  static String userPointDetails({required int userId}) =>
      '$userPath/$userId/pointdetails';

  static String userFeedPath({required int userId}) => '$userPath/$userId/feed';

  static String userCheckInsPath({required int userId}) =>
      '$userPath/$userId/checkins';

  static String userBookmarksPath({required int userId}) =>
      '$userPath/$userId/bookmarks';

  // Device
  static const String devicePath = '$_apiPath/device';
  static const String deviceInfoPath = '$devicePath/info';
  static const String deviceUpdateTokenPath = '$devicePath/updatetoken';
  static const String deviceLoginPath = '$devicePath/login';
  static const String deviceLogoutPath = '$devicePath/logout';

  // Shop
  static const String shopPath = '$_apiPath/shop';
  static const String shopListPath = '$shopPath/list';
  static const String shopListAllPath = '$shopPath/list/all';
  static const String shopRecommendedPath = '$shopPath/recommended';
  static const String submitHalalTips = '$shopPath/halaltip/submit';
  static const String sendreport = '$_apiPath/sendreport';
  static const String sendreview = '$_apiPath/review/add';

  static String shopShowPath({required int shopId}) => '$shopPath/$shopId/show';
  static const String shopGenrePath = '$_apiPath/genre/list';
  static const String shopJapanGenrePath = '$shopGenrePath/japan';
  static const String addNewShopPath = '$shopPath/add';

  static String shopPhotosPath({required int shopId}) =>
      '$shopPath/$shopId/photos';

  // Landmark
  static const String landmarkPath = '$_apiPath/landmark';

  // Landmark
  static const String sendReport = '$_apiPath/sendreport';

  // Mosque
  static const String mosquePath = '$_apiPath/mosque';
  static const String mosqueListPath = '$mosquePath/list';
  static const String addNewMosquePath = '$mosquePath/add';

  static String mosqueShowPath({required int mosqueId}) =>
      '$shopPath/$mosqueId/show';

  // Explore
  static const String explorePath = '$_apiPath/explore';
  static const String exploreCurationsPath = '$explorePath/curations';

  // Common
  static const String areaListPath = '$_apiPath/area/list';
  static const String stateListPath = '$_apiPath/state/list';
  static const String cityListPath = '$_apiPath/city/list';
  static const String pointCountsPath = '$_apiPath/pointcounts';
  static const String registerSurveyPath = '$_apiPath/registersurvey';
  static const String formattedAddressPath =
      '$_apiPath/location/fromcoordinate';
  static const String reviewPath = 'reviews';
  static const String halaltips = 'halaltips';
  static const String halaltipList = '$_apiPath/halaltip/list';
  static const String commentsPath = 'comments';

  static const String placePath =
      'https://maps.googleapis.com/maps/api/place/autocomplete/json';

  static const String placeDetailsPath =
      'https://maps.googleapis.com/maps/api/place/details/json';
  static const String pinCodeLocation =
      'https://maps.googleapis.com/maps/api/geocode/json';
}
