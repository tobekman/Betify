using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Domain
{
    public class Bet
    {
        public Guid Id { get; set; }
        public DateTime Date { get; set; }
        public double Stake { get; set; }
        public double Odds { get; set; }
        public bool isWin { get; set; }

    }
}