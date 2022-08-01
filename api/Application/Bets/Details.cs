using Application.Core;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Domain;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Bets;

public class Details
{
    public class Query : IRequest<Result<BetDto>>
    {
        public Guid Id { get; set; }
    }

    public class Handler : IRequestHandler<Query, Result<BetDto>>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;

        public Handler(DataContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }
        
        public async Task<Result<BetDto>> Handle(Query request, CancellationToken cancellationToken)
        {
            var bet = await _context.Bets
                .ProjectTo<BetDto>(_mapper.ConfigurationProvider)
                .FirstOrDefaultAsync(b => b.Id == request.Id);
            
            return Result<BetDto>.Sucess(bet);
        }
    }
}