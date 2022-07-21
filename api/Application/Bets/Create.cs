using Domain;
using MediatR;
using Persistence;

namespace Application.Bets;

public class Create
{
    public class Command : IRequest
    {
        public Bet Bet { get; set; }
    }

    public class Handler : IRequestHandler<Command>
    {
        private readonly DataContext _context;

        public Handler(DataContext context)
        {
            _context = context;
        }
        
        public async Task<Unit> Handle(Command request, CancellationToken cancellationToken)
        {
            _context.Bets.Add(request.Bet);
            
            await _context.SaveChangesAsync();
            
            return Unit.Value;
        }
    }
}