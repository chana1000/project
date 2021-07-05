using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
   public class ChildrenDTO
    {
        public int ChildId { get; set; }
        public int IdParent { get; set; }
        public string ChildName { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string Tz { get; set; }


    }
}
