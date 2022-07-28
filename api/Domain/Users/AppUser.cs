using Microsoft.AspNetCore.Identity;

namespace Domain.Users;

public class AppUser : IdentityUser
{
    public string DisplayName { get; set; }
}