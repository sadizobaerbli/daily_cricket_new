const appBaseUrl = 'https://dailycricket.com.bd';
const _apiKey = '9e272eadc7907624ee8bb8d4b0eca1f5';

const liveMatchesUrl =
    '$appBaseUrl/live/matches?status=3&per_page=10&paged=1&token=$_apiKey';

const featuredVideosUrl = 'https://admin.dailycricket.com.bd/api/en/v1/videos';

const editorsPickUrl =
    'https://admin.dailycricket.com.bd/api/en/v1/latest-article';

String matchDetailsLiveUrl(int matchId) =>
    '$appBaseUrl/live/matches/$matchId/live?token=$_apiKey';

String matchDetailsScoreboardUrl(int matchId) =>
    '$appBaseUrl/live/matches/$matchId/scorecard?token=$_apiKey';
