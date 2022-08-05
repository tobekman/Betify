using Domain.Teams;

namespace Domain.Bets.BetTypes;

public class OneXTwo : Bet
{
    public Team HomeTeam { get; set; }
    public Team AwayTeam { get; set; }
    public OneXTwoType OneXTwoPrediction { get; set; }
    public byte HomeTeamScore { get; set; }
    public byte AwayTeamScore { get; set; }
}