using Domain;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Bets;

public class List
{
    public class Query : IRequest<List<Bet>> {}
    
    public class Handler : IRequestHandler<Query, List<Bet>>
    {
        private readonly DataContext _context;

        public Handler(DataContext context)
        {
            _context = context;
        }

        public async Task<List<Bet>> Handle(Query request, CancellationToken cancellationToken)
        {
            return await _context.Bets.ToListAsync();
        }
    }
}