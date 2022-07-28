using Application.Core;
using Domain;
using MediatR;
using Persistence;

namespace Application.Bets;

public class Details
{
    public class Query : IRequest<Result<Bet>>
    {
        public Guid Id { get; set; }
    }

    public class Handler : IRequestHandler<Query, Result<Bet>>
    {
        private readonly DataContext _context;

        public Handler(DataContext context)
        {
            _context = context;
        }
        
        public async Task<Result<Bet>> Handle(Query request, CancellationToken cancellationToken)
        {
            var bet = await _context.Bets.FindAsync(request.Id);
            
            return Result<Bet>.Sucess(bet);
        }
    }
}