using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.ClassesDAL
{
  public  class UsersDAL
    {
        public static void PostUser(Users newUser)
        {
            try
            {
                using (CityBookDBEntities1 DB =new CityBookDBEntities1())
                {
                    DB.Users.Add(newUser);
                    DB.SaveChanges();
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }
        public static List<Users> GetUsers()
        {
            try
            {
                using (CityBookDBEntities1 DB=new CityBookDBEntities1())
                {
                    return DB.Users.ToList();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
        public static Users GetUser(string tz)
        {
            try
            {
                using (CityBookDBEntities1 DB=new CityBookDBEntities1())
                {
                    return DB.Users.FirstOrDefault(a => a.Tz == tz);
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
