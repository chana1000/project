using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace DAL.ClassesDAL
{
  public  class ChildrenDAL
    {
        public static void PostChild(Children newChild)
        {
            try
            {
                using (CityBookDBEntities1 DB=new CityBookDBEntities1())
                {
                    DB.Children.Add(newChild);
                    DB.SaveChanges();
                }
            }
            catch (Exception)
            {
                throw;
            }


        }
        public static List<Children> GetChildren()
        {
            try
            {
                using (CityBookDBEntities1 DB=new CityBookDBEntities1())
                {
                    return DB.Children.ToList();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public static int GetParentChildId(string tzParent,string tzchild)
        {
            try
            {
                using (CityBookDBEntities1 DB=new CityBookDBEntities1())
                {
                    Users p = DB.Users.FirstOrDefault(a => a.Tz == tzParent) as Users;
                    if (p != null)
                    {
                        int idP = p.UserID;
                        Children c = DB.Children.FirstOrDefault(a => a.Tz == tzchild && a.IdParent == idP) as Children;
                        if (c == null)
                        {
                            return idP;
                        }
                        return -1;//the child still sign in

                    }
                    return -2;//the father no sign in
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

    }
}
