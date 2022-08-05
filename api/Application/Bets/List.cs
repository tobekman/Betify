using Application.Bets.DTO;
using Application.Core;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Domain;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Bets;

public class List
{
    public class Query : IRequest<Result<List<BetDto>>> {}
    
    public class Handler : IRequestHandler<Query, Result<List<BetDto>>>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;

        public Handler(DataContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<Result<List<BetDto>>> Handle(Query request, CancellationToken cancellationToken)
        {
            var bets = await _context.Bets
                .ProjectTo<BetDto>(_mapper.ConfigurationProvider)
                .ToListAsync();

            return Result<List<BetDto>>.Sucess(bets);
        }
    }
}