using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;


namespace BL.ClassesBL
{
   public class HmoBL
    {
        public static List<HmoDTO> GetHmosBL()
        {
            List<HmoDTO> hmos = new List<HmoDTO>();
            hmos = Converters.HmoConverters.ConvertHmosToDAL(DAL.ClassesDAL.HmoDAL.GetHMO());
            return hmos;
        }
    }
}
