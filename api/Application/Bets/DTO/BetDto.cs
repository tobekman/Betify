using Domain;

namespace Application.Bets.DTO;

public class BetDto
{
    public Guid Id { get; set; }
    public DateTime Date { get; set; }
    public double Stake { get; set; }
    public double Odds { get; set; }
    public BetResult Result { get; set; }
}