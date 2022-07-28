using Application.Core;
using Domain;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Bets;

public class List
{
    public class Query : IRequest<Result<List<Bet>>> {}
    
    public class Handler : IRequestHandler<Query, Result<List<Bet>>>
    {
        private readonly DataContext _context;

        public Handler(DataContext context)
        {
            _context = context;
        }

        public async Task<Result<List<Bet>>> Handle(Query request, CancellationToken cancellationToken)
        {
            return Result<List<Bet>>.Sucess(await _context.Bets.ToListAsync());
        }
    }
}