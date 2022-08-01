using Application.Core;
using Application.Interfaces;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using MediatR;
using Microsoft.EntityFrameworkCore;
using Persistence;

namespace Application.Bets;

public class ListUserBets
{
    public class Query : IRequest<Result<List<BetDto>>> {}
    
    public class Handler : IRequestHandler<Query, Result<List<BetDto>>>
    {
        private readonly DataContext _context;
        private readonly IMapper _mapper;
        private readonly IUserAccessor _accessor;

        public Handler(DataContext context, IMapper mapper, IUserAccessor accessor)
        {
            _context = context;
            _mapper = mapper;
            _accessor = accessor;
        }

        public async Task<Result<List<BetDto>>> Handle(Query request, CancellationToken cancellationToken)
        {
            var bets = await _context.Bets
                .Where(b => b.User.UserName == _accessor.GetUsername())
                .ProjectTo<BetDto>(_mapper.ConfigurationProvider)
                .ToListAsync();

            return Result<List<BetDto>>.Sucess(bets);
        }
    }
}