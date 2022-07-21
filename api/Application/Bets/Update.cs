using AutoMapper;
using Domain;
using MediatR;
using Persistence;

namespace Application.Bets;

public class Update
{
    public class Command : IRequest
    {
        public Bet Bet { get; set; }
    }

    public class Handler : IRequestHandler<Command>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;

        public Handler(DataContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        
        public async Task<Unit> Handle(Command request, CancellationToken cancellationToken)
        {
            var bet = await _context.Bets.FindAsync(request.Bet.Id);

            _mapper.Map(request.Bet, bet);
            
            await _context.SaveChangesAsync();
            
            return Unit.Value;
        }
    }
}