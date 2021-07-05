using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Converters
{
    class HmoConverters
    {
        public static HmoDTO ConvertHmoToDTO(HMO hmoDAL)
        {
            HmoDTO hmo = new HmoDTO();
            hmo.HmoId = hmoDAL.HmoId;
            hmo.HmoName = hmoDAL.HmoName;
            return hmo;
        }
        public static List<HmoDTO> ConvertHmosToDAL(List<HMO> hmosDAL)
        {
            List<HmoDTO> hmos = new List<HmoDTO>();
            foreach (var hmoDAL in hmosDAL)
            {
                hmos.Add(ConvertHmoToDTO(hmoDAL));
            }
            return hmos;
        }
    }
}
