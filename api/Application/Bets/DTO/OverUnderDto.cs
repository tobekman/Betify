using Domain;
using Domain.Teams;

namespace Application.Bets.DTO;

public class OverUnderDto
{
    public Guid Id { get; set; }
    public DateTime Date { get; set; }
    public double Stake { get; set; }
    public double Odds { get; set; }
    public BetResult Result { get; set; }
    public Team HomeTeam { get; set; }
    public Team AwayTeam { get; set; }
    public OverUnderType Prediction { get; set; }
    public byte HomeTeamScore { get; set; }
    public byte AwayTeamScore { get; set; }
}