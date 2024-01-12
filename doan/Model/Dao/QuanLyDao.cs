using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;


namespace Model.Dao
{
    public class QuanLyDao
    {
        doanDbContext db = null;
        public QuanLyDao()
        {
            db = new doanDbContext();
        }

        //Xem chi tiết Khách hàng
        public QuanLy ViewDetail(int id)
        {
            return db.QuanLies.Find(id);
        }

    }
}
