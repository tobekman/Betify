using Application.Bets;
using Domain;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers;

public class BetsController : BaseApiController
{
    [HttpGet]
    public async Task<ActionResult<List<Bet>>> GetBets()
    {
        return await Mediator.Send(new List.Query());
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<Bet>> GetBet(Guid id)
    {
        return await Mediator.Send(new Details.Query{Id = id});
    }

    [HttpPost]
    public async Task<IActionResult> CreateBet(Bet bet)
    {
        bet.Date = DateTime.Now;
        return Ok(await Mediator.Send(new Create.Command{Bet = bet}));
    }
    
    [HttpPut("{id}")]
    public async Task<IActionResult> UpdateBet(Guid id, Bet bet)
    {
        bet.Id = id;
        return Ok(await Mediator.Send(new Update.Command{Bet = bet}));
    }

    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteBet(Guid id)
    {
        return Ok(await Mediator.Send(new Delete.Command{Id = id}));
    }

}