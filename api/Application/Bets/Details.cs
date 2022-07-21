using Domain;
using MediatR;
using Persistence;

namespace Application.Bets;

public class Details
{
    public class Query : IRequest<Bet>
    {
        public Guid Id { get; set; }
    }

    public class Handler : IRequestHandler<Query, Bet>
    {
        private readonly DataContext _context;

        public Handler(DataContext context)
        {
            _context = context;
        }
        
        public async Task<Bet> Handle(Query request, CancellationToken cancellationToken)
        {
            return await _context.Bets.FindAsync(request.Id);
        }
    }
}