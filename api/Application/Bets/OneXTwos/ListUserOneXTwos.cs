using Application.Bets.DTO;
using Application.Core;
using Application.Interfaces;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using MediatR;
using Persistence;

namespace Application.Bets.OneXTwos;

public class ListUserOneXTwos
{
    public class Query : IRequest<Result<PagedList<OneXTwoDto>>>
    {
        public BetParams Params { get; set; }
    }
    
    public class Handler : IRequestHandler<Query, Result<PagedList<OneXTwoDto>>>
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

        public async Task<Result<PagedList<OneXTwoDto>>> Handle(Query request, CancellationToken cancellationToken)
        {
            var query = _context.OneXTwoBets
                .Where(b => b.User.UserName == _accessor.GetUsername())
                .Where(b => b.Date > request.Params.StartDate && b.Date < request.Params.EndDate)
                .OrderBy(b => b.Date)
                .Reverse()
                .ProjectTo<OneXTwoDto>(_mapper.ConfigurationProvider)
                .AsQueryable();
            
            return Result<PagedList<OneXTwoDto>>.Sucess(
                await PagedList<OneXTwoDto>.CreateAsync(query, 
                    request.Params.PageNumber,
                    request.Params.PageSize)
            );
        }
    }
}