class TeamsData {
  TeamsData({
    required this.success,
    required this.result,
  });
  late final int success;
  late final List<Result> result;

  TeamsData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    result = List.from(json['result']).map((e) => Result.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['result'] = result.map((e) => e.toJson()).toList();
    return data;
  }
}

class Result {
  Result({
    required this.teamKey,
    this.teamName,
    this.teamLogo,
    required this.players,
    required this.coaches,
  });
  late final int teamKey;
  late final String? teamName;
  late final String? teamLogo;
  late final List<Players> players;
  late final List<Coaches> coaches;

  Result.fromJson(Map<String, dynamic> json) {
    teamKey = json['team_key'];
    teamName = json['team_name'] ;
    teamLogo = json['team_logo'] ;
    players = List.from(json['players']).map((e) => Players.fromJson(e)).toList();
    coaches = List.from(json['coaches']).map((e) => Coaches.fromJson(e)).toList();
  }

  get playerNumber => null;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['team_key'] = teamKey;
    data['team_name'] = teamName;
    data['team_logo'] = teamLogo;
    data['players'] = players.map((e) => e.toJson()).toList();
    data['coaches'] = coaches.map((e) => e.toJson()).toList();
    return data;
  }
}

class Players {
  Players({
    required this.playerKey,
    this.playerImage,
    required this.playerName,
    required this.playerNumber,
    required this.playerCountry,
    required this.playerType,
    required this.playerAge,
    required this.playerMatchPlayed,
    required this.playerGoals,
    required this.playerYellowCards,
    required this.playerRedCards,
    required this.playerInjured,
    required this.playerSubstituteOut,
    required this.playerSubstitutesOnBench,
    required this.playerAssists,
    this.playerBirthdate,
    required this.playerIsCaptain,
    required this.playerShotsTotal,
    required this.playerGoalsConceded,
    required this.playerFoulsCommitted,
    required this.playerTackles,
    required this.playerBlocks,
    required this.playerCrossesTotal,
    required this.playerInterceptions,
    required this.playerClearances,
    required this.playerDispossesed,
    required this.playerSaves,
    required this.playerInsideBoxSaves,
    required this.playerDuelsTotal,
    required this.playerDuelsWon,
    required this.playerDribbleAttempts,
    required this.playerDribbleSucc,
    required this.playerPenComm,
    required this.playerPenWon,
    required this.playerPenScored,
    required this.playerPenMissed,
    required this.playerPasses,
    required this.playerPassesAccuracy,
    required this.playerKeyPasses,
    required this.playerWoordworks,
    required this.playerRating,
  });
  late final int playerKey;
  late final String? playerImage;
  late final String? playerName;
  late final String? playerNumber;
  late final Null playerCountry;
  late final String playerType;
  late final String playerAge;
  late final String playerMatchPlayed;
  late final String playerGoals;
  late final String playerYellowCards;
  late final String playerRedCards;
  late final String playerInjured;
  late final String playerSubstituteOut;
  late final String playerSubstitutesOnBench;
  late final String playerAssists;
  late final String? playerBirthdate;
  late final String playerIsCaptain;
  late final String playerShotsTotal;
  late final String playerGoalsConceded;
  late final String playerFoulsCommitted;
  late final String playerTackles;
  late final String playerBlocks;
  late final String playerCrossesTotal;
  late final String playerInterceptions;
  late final String playerClearances;
  late final String playerDispossesed;
  late final String playerSaves;
  late final String playerInsideBoxSaves;
  late final String playerDuelsTotal;
  late final String playerDuelsWon;
  late final String playerDribbleAttempts;
  late final String playerDribbleSucc;
  late final String playerPenComm;
  late final String playerPenWon;
  late final String playerPenScored;
  late final String playerPenMissed;
  late final String playerPasses;
  late final String playerPassesAccuracy;
  late final String playerKeyPasses;
  late final String playerWoordworks;
  late final String playerRating;

  Players.fromJson(Map<String, dynamic> json) {
    playerKey = json['player_key'];
    playerImage = json['player_image'] ;
    playerName = json['player_name'];
    playerNumber = json['player_number'];
    playerCountry = json['player_country'];
    playerType = json['player_type'];
    playerAge = json['player_age'];
    playerMatchPlayed = json['player_match_played'];
    playerGoals = json['player_goals'];
    playerYellowCards = json['player_yellow_cards'];
    playerRedCards = json['player_red_cards'];
    playerInjured = json['player_injured'];
    playerSubstituteOut = json['player_substitute_out'];
    playerSubstitutesOnBench = json['player_substitutes_on_bench'];
    playerAssists = json['player_assists'];
    playerBirthdate = json['player_birthdate'];
    playerIsCaptain = json['player_is_captain'];
    playerShotsTotal = json['player_shots_total'];
    playerGoalsConceded = json['player_goals_conceded'];
    playerFoulsCommitted = json['player_fouls_committed'];
    playerTackles = json['player_tackles'];
    playerBlocks = json['player_blocks'];
    playerCrossesTotal = json['player_crosses_total'];
    playerInterceptions = json['player_interceptions'];
    playerClearances = json['player_clearances'];
    playerDispossesed = json['player_dispossesed'];
    playerSaves = json['player_saves'];
    playerInsideBoxSaves = json['player_inside_box_saves'];
    playerDuelsTotal = json['player_duels_total'];
    playerDuelsWon = json['player_duels_won'];
    playerDribbleAttempts = json['player_dribble_attempts'];
    playerDribbleSucc = json['player_dribble_succ'];
    playerPenComm = json['player_pen_comm'];
    playerPenWon = json['player_pen_won'];
    playerPenScored = json['player_pen_scored'];
    playerPenMissed = json['player_pen_missed'];
    playerPasses = json['player_passes'];
    playerPassesAccuracy = json['player_passes_accuracy'];
    playerKeyPasses = json['player_key_passes'];
    playerWoordworks = json['player_woordworks'];
    playerRating = json['player_rating'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['player_key'] = playerKey;
    data['player_image'] = playerImage;
    data['player_name'] = playerName;
    data['player_number'] = playerNumber;
    data['player_country'] = playerCountry;
    data['player_type'] = playerType;
    data['player_age'] = playerAge;
    data['player_match_played'] = playerMatchPlayed;
    data['player_goals'] = playerGoals;
    data['player_yellow_cards'] = playerYellowCards;
    data['player_red_cards'] = playerRedCards;
    data['player_injured'] = playerInjured;
    data['player_substitute_out'] = playerSubstituteOut;
    data['player_substitutes_on_bench'] = playerSubstitutesOnBench;
    data['player_assists'] = playerAssists;
    data['player_birthdate'] = playerBirthdate;
    data['player_is_captain'] = playerIsCaptain;
    data['player_shots_total'] = playerShotsTotal;
    data['player_goals_conceded'] = playerGoalsConceded;
    data['player_fouls_committed'] = playerFoulsCommitted;
    data['player_tackles'] = playerTackles;
    data['player_blocks'] = playerBlocks;
    data['player_crosses_total'] = playerCrossesTotal;
    data['player_interceptions'] = playerInterceptions;
    data['player_clearances'] = playerClearances;
    data['player_dispossesed'] = playerDispossesed;
    data['player_saves'] = playerSaves;
    data['player_inside_box_saves'] = playerInsideBoxSaves;
    data['player_duels_total'] = playerDuelsTotal;
    data['player_duels_won'] = playerDuelsWon;
    data['player_dribble_attempts'] = playerDribbleAttempts;
    data['player_dribble_succ'] = playerDribbleSucc;
    data['player_pen_comm'] = playerPenComm;
    data['player_pen_won'] = playerPenWon;
    data['player_pen_scored'] = playerPenScored;
    data['player_pen_missed'] = playerPenMissed;
    data['player_passes'] = playerPasses;
    data['player_passes_accuracy'] = playerPassesAccuracy;
    data['player_key_passes'] = playerKeyPasses;
    data['player_woordworks'] = playerWoordworks;
    data['player_rating'] = playerRating;
    return data;
  }
}

class Coaches {
  Coaches({
    required this.coachName,
    this.coachCountry,
    this.coachAge,
  });
  late final String coachName;
  late final Null coachCountry;
  late final Null coachAge;

  Coaches.fromJson(Map<String, dynamic> json) {
    coachName = json['coach_name'];
    coachCountry = json['coach_country'] ;
    coachAge = json['coach_age'] ;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['coach_name'] = coachName;
    data['coach_country'] = coachCountry;
    data['coach_age'] = coachAge;
    return data;
  }
}
