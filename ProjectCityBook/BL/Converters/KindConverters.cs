using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;
namespace BL.Converters
{
    class KindConverters
    {
        public static KindDTO ConvertKindToDTO(Kind kindDAL)
        {
            KindDTO kind = new KindDTO();
            kind.KindId = kindDAL.KindId;
            kind.KindName = kindDAL.KindName;
            return kind;

        }
        public static List<KindDTO> ConvertKindsToDTO(List<Kind> kindsDAL)
        {
            List<KindDTO> kinds = new List<KindDTO>();
            foreach (var kindDAL in kindsDAL)
            {
                kinds.Add(ConvertKindToDTO(kindDAL));
            }
            return kinds;
        }

       

    }
}
