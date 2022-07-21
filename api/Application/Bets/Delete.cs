using MediatR;
using Microsoft.EntityFrameworkCore.Update;
using Persistence;

namespace Application.Bets;

public class Delete
{
    public class Command : IRequest
    {
        public Guid Id { get; set; }
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
            var bet = await _context.Bets.FindAsync(request.Id);
            _context.Bets.Remove(bet);
            await _context.SaveChangesAsync();
            return Unit.Value;
        }
    }
}