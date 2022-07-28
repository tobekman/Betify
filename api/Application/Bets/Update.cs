using Application.Core;
using AutoMapper;
using Domain;
using FluentValidation;
using MediatR;
using Persistence;

namespace Application.Bets;

public class Update
{
    public class Command : IRequest<Result<Unit>>
    {
        public Bet Bet { get; set; }
    }

    public class CommandValidator : AbstractValidator<Create.Command>
    {
        public CommandValidator()
        {
            RuleFor(x => x.Bet).SetValidator(new BetValidator());
        }
    }
    
    public class Handler : IRequestHandler<Command, Result<Unit>>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;
        
        public Handler(DataContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        
        public async Task<Result<Unit>> Handle(Command request, CancellationToken cancellationToken)
        {
            var bet = await _context.Bets.FindAsync(request.Bet.Id);
            
            if (bet == null)
            {
                return null;
            }

            _mapper.Map(request.Bet, bet);
            
            var result = await _context.SaveChangesAsync() > 0;

            if (!result)
            {
                return Result<Unit>.Failure("Failed to update bet");
            }
            
            return Result<Unit>.Sucess(Unit.Value);
        }
    }
}