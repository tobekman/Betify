using AutoMapper;
using Domain;
using Domain.Users;

namespace Application.Core;

public class MappingProfiles : Profile
{
    public MappingProfiles()
    {
        CreateMap<Bet, Bet>();
    }
}