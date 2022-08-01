using Application.Core;

namespace Application.Bets;

public class BetParams : PagingParams
{
    public DateTime StartDate { get; set; } = DateTime.MinValue;
    public DateTime EndDate { get; set; } = DateTime.Now;
}