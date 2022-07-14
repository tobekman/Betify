using System.Diagnostics;
using Domain;

namespace Persistence;

public class Seed
    {
        public static async Task SeedData(DataContext context)
        {
            if (context.Bets.Any()) return;
            
            var bets = new List<Bet>
            {
                new Bet
                {
                    Date = DateTime.Now.AddMonths(-2),
                    Odds = 1.54,
                    Stake = 250,
                    isWin = false
                },
                new Bet
                {
                    Date = DateTime.Now.AddMonths(-1),
                    Odds = 2.12,
                    Stake = 250,
                    isWin = false
                },
                new Bet
                {
                    Date = DateTime.Now.AddMonths(-3),
                    Odds = 3.51,
                    Stake = 250,
                    isWin = false
                },
                new Bet
                {
                    Date = DateTime.Now.AddMonths(-2),
                    Odds = 1.54,
                    Stake = 250,
                    isWin = false
                },
                new Bet
                {
                    Date = DateTime.Now.AddMonths(-1),
                    Odds = 2.12,
                    Stake = 250,
                    isWin = false
                },
                new Bet
                {
                    Date = DateTime.Now.AddMonths(-3),
                    Odds = 3.51,
                    Stake = 250,
                    isWin = false
                }
            };

            await context.Bets.AddRangeAsync(bets);
            await context.SaveChangesAsync();
        }
    }