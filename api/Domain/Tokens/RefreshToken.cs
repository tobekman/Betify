using Domain.Users;

namespace Domain.Tokens;

public class RefreshToken
{
    public int Id { get; set; }
    public AppUser AppUser { get; set; }
    public string Token { get; set; }
    public DateTime Expires { get; set; } = DateTime.UtcNow.AddDays(7);
    public bool isExpired => DateTime.UtcNow >= Expires;
    public DateTime? Revoked { get; set; }
    public bool isActive => Revoked == null && !isExpired;

}