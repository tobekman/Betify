using Application.Bets.DTO;
using Application.Core;
using Application.Interfaces;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using MediatR;
using Persistence;

namespace Application.Bets;

public class ListUserBets
{
    public class Query : IRequest<Result<PagedList<BetDto>>>
    {
        public BetParams Params { get; set; }
    }
    
    public class Handler : IRequestHandler<Query, Result<PagedList<BetDto>>>
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

        public async Task<Result<PagedList<BetDto>>> Handle(Query request, CancellationToken cancellationToken)
        {
            var query = _context.Bets
                .Where(b => b.User.UserName == _accessor.GetUsername())
                .Where(b => b.Date > request.Params.StartDate && b.Date < request.Params.EndDate)
                .OrderBy(b => b.Date)
                .Reverse()
                .ProjectTo<BetDto>(_mapper.ConfigurationProvider)
                .AsQueryable();
            
            return Result<PagedList<BetDto>>.Sucess(
                await PagedList<BetDto>.CreateAsync(query, 
                    request.Params.PageNumber,
                    request.Params.PageSize)
                );
        }
    }
}