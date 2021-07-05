using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.ClassesDAL
{
  public  class KindDAL
    {
        public static List<Kind> GetKind()
        {
            try
            {
                using (CityBookDBEntities1 DB = new CityBookDBEntities1())
                {
                  return  DB.Kind.ToList();
                }
            }
            catch (Exception)
            {

                throw;
            }


        }

    }
}
