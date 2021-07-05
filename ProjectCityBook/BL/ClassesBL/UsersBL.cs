using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DTO;

namespace BL.ClassesBL
{
   public class UsersBL
    {
        public  static void PostUserBL(UsersDTO newUser)
        {
            DAL.ClassesDAL.UsersDAL.PostUser(Converters.UsersConverters.ConvertUsersToDal(newUser));          
        }
        public static List<UsersDTO> GetUsersBL()
        {
            List<UsersDTO> usersDTO = new List<UsersDTO>();
            usersDTO = Converters.UsersConverters.ConvertUsersToDTO(DAL.ClassesDAL.UsersDAL.GetUsers());
            return usersDTO;
        }
        public static bool IsChildNewForThisParent(string tzChild,string tzParent)
        {
            UsersDTO parent = new UsersDTO();
            parent = GetUsersBL().First(u => u.Tz == tzParent);
            return  ChildrenBL.GetChildrenBL().Exists(c => c.IdParent == parent.UserID&&c.Tz==tzChild);
        }
        public static UsersDTO GetUserBl(string tz)
        {
            return BL.Converters.UsersConverters.ConvertUserToDTO( DAL.ClassesDAL.UsersDAL.GetUser(tz));
        }
    }
}
