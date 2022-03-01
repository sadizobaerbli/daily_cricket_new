
const appBaseUrl = 'https://dailycricket.com.bd';

const liveMatchesUrl = '$appBaseUrl/live/matches?status=3&per_page=10&paged=1&token=9e272eadc7907624ee8bb8d4b0eca1f5';

const featuredVideosUrl = 'https://admin.dailycricket.com.bd/api/en/v1/videos';

const editorsPickUrl = 'https://admin.dailycricket.com.bd/api/en/v1/latest-article';

String matchDetailsLiveUrl(int matchId) => 'https://dailycricket.com.bd/live/matches/$matchId/live?token=9e272eadc7907624ee8bb8d4b0eca1f5';

