using System.Security.Claims;
using API.DTO;
using API.services;
using Domain.Users;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API.Controllers.Account;

[ApiController]
[Route("api/[controller]")]
public class AccountController : ControllerBase
{
    private readonly UserManager<AppUser> _userManager;
    private readonly SignInManager<AppUser> _signInManager;
    private readonly TokenService _tokenService;

    public AccountController(UserManager<AppUser> userManager, SignInManager<AppUser> signInManager, TokenService tokenService)
    {
        _userManager = userManager;
        _signInManager = signInManager;
        _tokenService = tokenService;
    }

    [AllowAnonymous]
    [HttpPost("login")]
    public async Task<ActionResult<UserDto>> Login(LoginDto loginDto)
    {
        var user = await _userManager.FindByEmailAsync(loginDto.Email);

        if (user == null)
        {
            return Unauthorized();
        }

        var result = await _signInManager.CheckPasswordSignInAsync(user, loginDto.Password, false);

        if (result.Succeeded)
        {
            await SetRefreshToken(user);
            return CreateUserDto(user);
        }

        return Unauthorized();
    }
    
    [AllowAnonymous]
    [HttpPost("register")]
    public async Task<ActionResult<UserDto>> Register(RegisterDto registerDto)
    {
        if (await _userManager.Users.AnyAsync(u => u.Email == registerDto.Email))
        {
            return BadRequest("Email taken");
        }
        
        if (await _userManager.Users.AnyAsync(u => u.UserName == registerDto.Username))
        {
            return BadRequest("Username taken");
        }

        var user = new AppUser
        {
            DisplayName = registerDto.DisplayName,
            Email = registerDto.Email,
            UserName = registerDto.Username
        };

        var result = await _userManager.CreateAsync(user, registerDto.Password);

        if (result.Succeeded)
        {
            await SetRefreshToken(user);
            return CreateUserDto(user);
        }

        return BadRequest("Problem creating account");
    }

    [Authorize]
    [HttpGet]
    public async Task<ActionResult<UserDto>> GetCurrentUser()
    {
        var user = await _userManager.FindByEmailAsync(User.FindFirstValue(ClaimTypes.Email));
        await SetRefreshToken(user);
        return CreateUserDto(user);
    }

    [Authorize]
    [HttpPost("refreshToken")]
    public async Task<ActionResult<UserDto>> RefreshToken()
    {
        var refreshToken = Request.Cookies["refreshToken"];
        var user = await _userManager.Users.Include(r => r.RefreshTokens)
            .FirstOrDefaultAsync(u => u.UserName == User.FindFirstValue(ClaimTypes.Name));

        if (user == null)
        {
            return Unauthorized();
        }

        var oldToken = user.RefreshTokens.SingleOrDefault(r => r.Token == refreshToken);

        if (oldToken != null && !oldToken.isActive)
        {
            return Unauthorized();
        }

        if (oldToken != null)
        {
            oldToken.Revoked = DateTime.UtcNow;
        }

        return CreateUserDto(user);
    }

    private async Task SetRefreshToken(AppUser user)
    {
        var refreshToken = _tokenService.GenerateRefreshToken();
        
        user.RefreshTokens.Add(refreshToken);

        await _userManager.UpdateAsync(user);

        var cookieOptions = new CookieOptions
        {
            HttpOnly = true,
            Expires = DateTimeOffset.UtcNow.AddDays(7)
        };

        Response.Cookies.Append("refreshToken", refreshToken.Token, cookieOptions);
    }
    
    private UserDto CreateUserDto(AppUser user)
    {
        return new UserDto
        {
            DisplayName = user.DisplayName,
            Username = user.UserName,
            Token = _tokenService.CreateToken(user)
        };
    }
}