using Domain;
using FluentValidation;

namespace Application.Bets;

public class BetValidator : AbstractValidator<Bet>
{
    public BetValidator()
    {
        RuleFor(b => b.Stake).NotEmpty();
        RuleFor(b => b.Odds).NotEmpty();
    }
}