using System.Security.Claims;
using Application.Interfaces;
using Microsoft.AspNetCore.Http;

namespace Infrastructure.Security;

public class UserAccessor : IUserAccessor
{
    private readonly IHttpContextAccessor _httpContextAccessor;

    public UserAccessor(IHttpContextAccessor httpContextAccessor)
    {
        _httpContextAccessor = httpContextAccessor;
    }

    public string GetUsername()
    {
        return _httpContextAccessor.HttpContext.User
            .FindFirstValue(ClaimTypes.Name);
    }

    public string GetEmail()
    {
        return _httpContextAccessor.HttpContext.User
            .FindFirstValue(ClaimTypes.Email);
    }
    
    public Guid GetId()
    {
        return Guid.Parse(_httpContextAccessor.HttpContext.User
            .FindFirstValue(ClaimTypes.NameIdentifier));
    }
    
}