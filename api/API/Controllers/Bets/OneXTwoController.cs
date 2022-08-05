using Application.Bets;
using Application.Bets.OneXTwos;
using Domain;
using Domain.Bets.BetTypes;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers.Bets;

public class OneXTwoController : BaseApiController
{
    [HttpGet]
    public async Task<IActionResult> GetUserBets([FromQuery]BetParams param)
    {
        return HandlePagedResult(await Mediator.Send(new ListUserBets.Query{Params = param}));
    }

    [Authorize(Policy = "IsBetOwner")]
    [HttpGet("{id}")]
    public async Task<IActionResult> GetBet(Guid id)
    {
        return HandleResult(await Mediator.Send(new Details.Query{Id = id}));
    }

    [HttpPost]
    public async Task<IActionResult> CreateBet(OneXTwo bet)
    {
        bet.Date = DateTime.Now;
        return HandleResult(await Mediator.Send(new CreateOneXTwo.Command{Bet = bet}));
    }
    
    [Authorize(Policy = "IsBetOwner")]
    [HttpPut("{id}")]
    public async Task<IActionResult> UpdateBet(Guid id, Bet bet)
    {
        bet.Id = id;
        return HandleResult(await Mediator.Send(new Update.Command{Bet = bet}));
    }

    [Authorize(Policy = "IsBetOwner")]
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteBet(Guid id)
    {
        return HandleResult(await Mediator.Send(new Delete.Command{Id = id}));
    }
}