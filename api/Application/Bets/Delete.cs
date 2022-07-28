using Application.Core;
using MediatR;
using Microsoft.EntityFrameworkCore.Update;
using Persistence;

namespace Application.Bets;

public class Delete
{
    public class Command : IRequest<Result<Unit>>
    {
        public Guid Id { get; set; }
    }

    public class Handler : IRequestHandler<Command, Result<Unit>>
    {
        
        private readonly DataContext _context;

        public Handler(DataContext context)
        {
            _context = context;
        }
        
        public async Task<Result<Unit>> Handle(Command request, CancellationToken cancellationToken)
        {
            var bet = await _context.Bets.FindAsync(request.Id);

            // if (bet == null)
            // {
            //     return null;
            // }
            
            _context.Bets.Remove(bet);
            var result = await _context.SaveChangesAsync() > 0;

            if (!result)
            {
                return Result<Unit>.Failure("Failed to delete the bet");
            }
            return Result<Unit>.Sucess(Unit.Value);
        }
    }
}