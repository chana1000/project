using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
 public class UsersDTO
    {
        public int UserID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Tz { get; set; }
        public DateTime DateOfBirth { get; set; }
        public int IdHMO { get; set; }
        public int IdKind { get; set; }
    }
}
