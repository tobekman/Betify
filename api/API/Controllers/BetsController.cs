using Application.Bets;
using Domain;
using Domain.Users;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers;

public class BetsController : BaseApiController
{
    [HttpGet]
    public async Task<IActionResult> GetBets()
    {
        return HandleResult(await Mediator.Send(new ListUserBets.Query()));
    }

    [Authorize(Policy = "IsBetOwner")]
    [HttpGet("{id}")]
    public async Task<IActionResult> GetBet(Guid id)
    {
        return HandleResult(await Mediator.Send(new Details.Query{Id = id}));
    }

    [HttpPost]
    public async Task<IActionResult> CreateBet(Bet bet)
    {
        bet.Date = DateTime.Now;
        return HandleResult(await Mediator.Send(new Create.Command{Bet = bet}));
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