using Domain.Teams;

namespace Domain.Bets.BetTypes;

public class OverUnder : Bet
{
    public Team HomeTeam { get; set; }
    public Team AwayTeam { get; set; }
    public OverUnderType OverUnderPrediction { get; set; }
    public byte AmountOfGoals { get; set; }
    public byte HomeTeamScore { get; set; }
    public byte AwayTeamScore { get; set; }
}