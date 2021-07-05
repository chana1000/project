using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;


namespace BL.ClassesBL
{
    public class KindBL
    {
      public static List<KindDTO> GetKindsBL()
        {
            List<KindDTO> kinds = new List<KindDTO>();
             kinds = Converters.KindConverters.ConvertKindsToDTO(DAL.ClassesDAL.KindDAL.GetKind());
            return kinds;
        }
    }
}
