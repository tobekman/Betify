using Domain;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace API.Controllers;

public class BetsController : BaseApiController
{
    private readonly DataContext _context;

    public BetsController(DataContext context)
    {
        _context = context;
    }

    [HttpGet]
    public async Task<ActionResult<List<Bet>>> GetBets()
    {
        return await _context.Bets.ToListAsync();
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<Bet>> GetBet(Guid id)
    {
        return await _context.Bets.FindAsync(id);
    }
    
}