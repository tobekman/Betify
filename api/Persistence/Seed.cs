using System.Diagnostics;
using Domain;
using Domain.Users;
using Microsoft.AspNetCore.Identity;

namespace Persistence;

public class Seed
    {
        public static async Task SeedData(DataContext context, UserManager<AppUser> userManager)
        {
            if (!userManager.Users.Any())
            {
                var users = new List<AppUser>
                {
                    new AppUser {DisplayName = "Bob", UserName = "bob", Email = "bob@test.com"},
                    new AppUser {DisplayName = "Tommy", UserName = "tommy", Email = "tommy@test.com"},
                    new AppUser {DisplayName = "Skåne", UserName = "skåne", Email = "skane@test.com"},
                    new AppUser {DisplayName = "Rebecca", UserName = "rebecca", Email = "rebecca@test.com"},
                };

                foreach (var user in users)
                {
                    Console.WriteLine(user.DisplayName);
                    await userManager.CreateAsync(user, "Passw0rd");
                }
            }
            
            if (context.Bets.Any()) return;
            
            var bets = new List<Bet>
            {
                new Bet
                {
                    Date = DateTime.Now.AddMonths(-2),
                    Odds = 1.54,
                    Stake = 250,
                    Result = BetResult.WIN
                },
                new Bet
                {
                    Date = DateTime.Now.AddMonths(-1),
                    Odds = 2.12,
                    Stake = 250,
                    Result = BetResult.NONE
                },
                new Bet
                {
                    Date = DateTime.Now.AddMonths(-3),
                    Odds = 3.51,
                    Stake = 250,
                    Result = BetResult.LOSS
                },
                new Bet
                {
                    Date = DateTime.Now.AddMonths(-2),
                    Odds = 1.54,
                    Stake = 250,
                    Result = BetResult.LOSS
                },
                new Bet
                {
                    Date = DateTime.Now.AddMonths(-1),
                    Odds = 2.12,
                    Stake = 250,
                    Result = BetResult.NONE
                },
                new Bet
                {
                    Date = DateTime.Now.AddMonths(-3),
                    Odds = 3.51,
                    Stake = 250,
                    Result = BetResult.NONE
                }
            };

            await context.Bets.AddRangeAsync(bets);
            await context.SaveChangesAsync();
        }
    }