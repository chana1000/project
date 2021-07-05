using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;
namespace BL.Converters
{
    class ChildrenConverters
    {
        
        public static Children ConvertChildrenToDal(ChildrenDTO childDTO)
        {
            Children childDAL = new Children();
            childDAL.IdParent = childDTO.IdParent;
            childDAL.ChildName = childDTO.ChildName;
            childDAL.DateOfBirth = childDTO.DateOfBirth;
            childDAL.Tz = childDTO.Tz;
            return childDAL;
        }
        public static ChildrenDTO ConvertChildToDTO(Children childDAL)
        {
            ChildrenDTO childDTO = new ChildrenDTO();
            childDTO.ChildId = childDAL.ChildId;
            childDTO.ChildName = childDAL.ChildName;
            childDTO.DateOfBirth = childDAL.DateOfBirth;
            childDTO.IdParent = childDAL.IdParent;
            childDTO.Tz = childDAL.Tz;
            return childDTO;

        }
        public static List<ChildrenDTO> ConvertChildrenToDTO(List<Children> childrenDAL)
        {
            List<ChildrenDTO> childrenDTO = new List<ChildrenDTO>();
            foreach (var childDAL in childrenDAL)
            {
                childrenDTO.Add(ConvertChildToDTO(childDAL));
            }
            return childrenDTO;
        }

    }
}
