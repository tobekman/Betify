using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Infrastructure.Security;

public class IsBetOwnerRequirement : IAuthorizationRequirement
{
    
}

public class IsBetOwnerRequirementHandler : AuthorizationHandler<IsBetOwnerRequirement>
{
    private readonly DataContext _dbContext;
    private readonly IHttpContextAccessor _httpContextAccessor;

    public IsBetOwnerRequirementHandler(DataContext dbContext, IHttpContextAccessor httpContextAccessor)
    {
        _dbContext = dbContext;
        _httpContextAccessor = httpContextAccessor;
    }

    protected override Task HandleRequirementAsync(AuthorizationHandlerContext context, IsBetOwnerRequirement requirement)
    {
        var userId = context.User.FindFirstValue(ClaimTypes.NameIdentifier);

        if (userId == null)
        {
            return Task.CompletedTask;
        }

        var betId = Guid.Parse(_httpContextAccessor.HttpContext?.Request
                .RouteValues
                .SingleOrDefault(x => x.Key == "id").Value?.ToString() ?? string.Empty
        );

        var bet = _dbContext.Bets.
            Include(x => x.User)
            .FirstOrDefaultAsync(b => b.Id == betId)
            .Result;

        if (bet == null)
        {
            return Task.CompletedTask;
        }

        if (bet.User.Id == userId)
        {
            context.Succeed(requirement);
        }
        
        return Task.CompletedTask;
    }
}