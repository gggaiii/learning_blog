SELECT Track.Name, Track.Difficulty, GameCharacter.Name 
FROM Track
JOIN Result ON Track.Name = Result.Track
JOIN Player ON (Result.Player1 = Player.ID OR Result.Player2 = Player.ID)
JOIN GameCharacter ON Player.ChosenChar = GameCharacter.Name
WHERE (Result.Player1Wins = 'TRUE' AND Result.Player1 = Player.ID)
   OR (Result.Player2Wins = 'TRUE' AND Result.Player2 = Player.ID);
