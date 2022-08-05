

using Domain;
using Domain.Bets.BetTypes;
using Domain.Teams;
using Domain.Users;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace Persistence;

public class DataContext : IdentityDbContext<AppUser>
{
    public DataContext(DbContextOptions options) : base(options)
    {
        
    }

    public DbSet<Bet> Bets { get; set; }
    public DbSet<OneXTwo> OneXTwoBets { get; set; }
    public DbSet<OverUnder> OverUnderBets { get; set; }
    public DbSet<Team> Teams { get; set; }

}