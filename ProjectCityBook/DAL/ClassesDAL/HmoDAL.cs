using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.ClassesDAL
{
   public class HmoDAL
    {
        public static List<HMO> GetHMO()
        {
            try
            {
                using (CityBookDBEntities1 DB = new CityBookDBEntities1())
                {
                    return DB.HMO.ToList();
                }
            }
            catch (Exception)
            {

                throw;
            }


        }

    }
}
