using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DTO;

namespace BL.Converters
{
    class UsersConverters
    {

       public static Users ConvertUsersToDal(UsersDTO userDTO)
        {
            Users userDAL = new Users();
            userDAL.UserID = userDTO.UserID;
            userDAL.FirstName = userDTO.FirstName;
            userDAL.LastName = userDTO.LastName;
            userDAL.Tz = userDTO.Tz;
            userDAL.IdHMO = userDTO.IdHMO;
            userDAL.IdKind = userDTO.IdKind;
            userDAL.DateOfBirth = userDTO.DateOfBirth;
            return userDAL;

        }
        public static UsersDTO ConvertUserToDTO(Users userDAL)
        {
            UsersDTO userDTO = new UsersDTO();
            userDTO.UserID = userDAL.UserID;
            userDTO.Tz = userDAL.Tz;
            userDTO.FirstName = userDAL.Tz;
            userDTO.LastName = userDAL.LastName;
            userDTO.DateOfBirth = userDAL.DateOfBirth;
            userDTO.IdHMO = userDAL.IdHMO;
            userDTO.IdKind = userDAL.IdKind;
            return userDTO;
            
        }
        public static List<UsersDTO> ConvertUsersToDTO(List<Users> usersDAL)
        {
            List<UsersDTO> usersDTO = new List<UsersDTO>();
            foreach (var userDAL in usersDAL)
            {
                usersDTO.Add(ConvertUserToDTO(userDAL));
            }
            return usersDTO;
        }
        



    }
}
