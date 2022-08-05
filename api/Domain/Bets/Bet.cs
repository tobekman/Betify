using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using Domain.Users;

namespace Domain
{
    public class Bet
    {
        public Guid Id { get; set; }
        public DateTime Date { get; set; }
        public double Stake { get; set; }
        public double Odds { get; set; }
        public BetResult Result { get; set; }
        public BetType BetType { get; set; }
        public AppUser? User { get; set; }

    }
}