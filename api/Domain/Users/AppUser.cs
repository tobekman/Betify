using Domain.Tokens;
using Microsoft.AspNetCore.Identity;

namespace Domain.Users;

public class AppUser : IdentityUser
{
    public string DisplayName { get; set; }
    public ICollection<Bet> Bets { get; set; } = new List<Bet>();
    public ICollection<RefreshToken> RefreshTokens { get; set; } = new List<RefreshToken>();
}