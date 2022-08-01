using Application.Profiles;
using Domain;

namespace Application.Bets;

public class BetDto
{
    public Guid Id { get; set; }
    public DateTime Date { get; set; }
    public double Stake { get; set; }
    public double Odds { get; set; }
    public BetResult Result { get; set; }
    public Profile User { get; set; }
}