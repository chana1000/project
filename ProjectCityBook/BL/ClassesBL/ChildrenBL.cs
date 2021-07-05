using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DTO;
namespace BL.ClassesBL
{
  public  class ChildrenBL
    {
        public static void PostChildBL(ChildrenDTO newChild)
        {
            DAL.ClassesDAL.ChildrenDAL.PostChild(Converters.ChildrenConverters.ConvertChildrenToDal(newChild));
        }
        public static List<ChildrenDTO> GetChildrenBL()
        {
            List<ChildrenDTO> children = new List<ChildrenDTO>();
            children = Converters.ChildrenConverters.ConvertChildrenToDTO(DAL.ClassesDAL.ChildrenDAL.GetChildren());
            return children;
        }
       public static int theChildAlreadyExist(string tzParent,string tzChild)
        {
            return DAL.ClassesDAL.ChildrenDAL.GetParentChildId(tzParent, tzChild);
        }
    }
}
