using Model.Dao;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using doan.Controllers;
using doan.Common;
using System.Data.Entity;


namespace doan.Areas.Admin.Controllers
{
    public class KhuyenMaiController : Controller
    {
        // GET: Admin/KhuyenMai
        private doanDbContext db = new doanDbContext();
        private SanPham sp = new SanPham();
        private SanPhamDao spdao = new SanPhamDao();
        private NguoiDungDao nddao = new NguoiDungDao();
        private KhuyenMaiDao kmdao = new KhuyenMaiDao();

        //hien thi danh sach khuyen mai Controller
        public ActionResult DanhSachKhuyenMai(string searchString)
        {
            var session = (UserLogin)Session[CommonConstants.USER_SESSION];
            if (session == null)
            {
                return Redirect("/dang-nhap");
            }
            else
            {
                ViewBag.session = session;
                var nd = nddao.ViewDetailEmail(session.UserName);
                if (nd.Role != "Nhân viên" && nd.Role != "ADMIN")
                {
                    return Redirect("/");
                }
                ViewBag.ndd = nd;
            }

            var kms = kmdao.ViewAll();
            ViewBag.kms = kms;
            return View(kms);
        }

        public ActionResult Details(long id)
        {
            var session = (UserLogin)Session[CommonConstants.USER_SESSION];
            if (session == null)
            {
                return Redirect("/dang-nhap");
            }
            else
            {
                ViewBag.session = session;
                var nddd = nddao.ViewDetailEmail(session.UserName);
                if (nddd.Role != "Nhân viên" && nddd.Role != "ADMIN")
                {
                    return Redirect("/");
                }
                ViewBag.ndd = nddd;
            }

            var km = kmdao.ViewDetail(id); 
            ViewBag.km = km;

            return View(km);
        }


        private void ApDungKhuyenMaiChoSanPham(long idKhuyenMai)
        {
            var khuyenMai = db.KhuyenMais.Find(idKhuyenMai);

            if (khuyenMai != null && IsNgayHienTaiTrongKhoang(khuyenMai.NgayBatDau, khuyenMai.NgayKetThuc))
            {
                var danhSachSanPham = db.ChiTietSanPhams.Where(c => c.Status == true && c.Gia != null && c.Gia > 0).ToList();

                foreach (var chiTietSanPham in danhSachSanPham)
                {
                    // Kiểm tra xem sản phẩm đã áp dụng khuyến mãi chưa
                    var daApDung = db.ChiTietSanPhams.Any(ct => ct.ID == chiTietSanPham.ID && ct.IDKhuyenMai == idKhuyenMai);

                    if (!daApDung)
                    {
                        // Tạo mới chi tiết sản phẩm và áp dụng khuyến mãi
                        var chiTietSanPhamKM = new ChiTietSanPham
                        {
                            ID = chiTietSanPham.ID,
                            IDKhuyenMai = idKhuyenMai,
                            GiaKhuyenMai = chiTietSanPham.Gia - (chiTietSanPham.Gia * khuyenMai.PhanTramKM / 100),
                            // Các thông tin khác của chi tiết sản phẩm
                        };

                        // Thêm mới vào DbSet
                        db.ChiTietSanPhams.Add(chiTietSanPhamKM);
                    }
                    else
                    {
                        // Nếu đã áp dụng khuyến mãi, bạn có thể cập nhật giá ở đây nếu cần
                        var chiTietSanPhamKM = db.ChiTietSanPhams.SingleOrDefault(ct => ct.ID == chiTietSanPham.ID && ct.IDKhuyenMai == idKhuyenMai);
                        if (chiTietSanPhamKM != null)
                        {
                            chiTietSanPhamKM.GiaKhuyenMai = chiTietSanPham.Gia - (chiTietSanPham.Gia * khuyenMai.PhanTramKM / 100);
                            db.Entry(chiTietSanPhamKM).State = EntityState.Modified;
                        }
                    }
                }

                db.SaveChanges();
            }
            else if (khuyenMai != null && !IsNgayHienTaiTrongKhoang(khuyenMai.NgayBatDau, khuyenMai.NgayKetThuc))
            {
                // Khuyến mãi đã kết thúc

                // Đặt trạng thái của khuyến mãi thành false
                khuyenMai.Status = false;
                db.Entry(khuyenMai).State = EntityState.Modified;
                db.SaveChanges();

                // Xóa chi tiết khuyến mãi khỏi ChiTietSanPhams
                var chiTietSanPhamsToDelete = db.ChiTietSanPhams
                    .Where(c => c.IDKhuyenMai == idKhuyenMai)
                    .ToList();

                foreach (var chiTietSanPham in chiTietSanPhamsToDelete)
                {
                    db.ChiTietSanPhams.Remove(chiTietSanPham);
                }

                db.SaveChanges();
            }
        }



        private bool IsNgayHienTaiTrongKhoang(DateTime? ngayBatDau, DateTime? ngayKetThuc)
        {
            if (ngayBatDau.HasValue && ngayKetThuc.HasValue)
            {
                DateTime ngayHienTai = DateTime.Now;
                return ngayHienTai >= ngayBatDau?.Date && ngayHienTai <= ngayKetThuc?.Date;
            }

            return false;
        }


        public ActionResult ThemKhuyenMai(KhuyenMai model)
        {
            var session = (UserLogin)Session[CommonConstants.USER_SESSION];
            if (session == null)
            {
                return Redirect("/dang-nhap");
            }
            else
            {
                ViewBag.session = session;
                var nddd = nddao.ViewDetailEmail(session.UserName);
                if (nddd.Role != "Nhân viên" && nddd.Role != "ADMIN")
                {
                    return Redirect("/");
                }
                ViewBag.ndd = nddd;
            }

            var err = "";
            if (ModelState.IsValid)
            {
                // Kiểm tra tên khuyến mãi đã tồn tại hay chưa
                if (kmdao.IsTenKhuyenMaiExists(model.TenKM))
                {
                    err += "Tên khuyến mãi đã tồn tại. ";
                    ViewBag.err = err;
                    return View();
                }

                // Xử lý thêm khuyến mãi vào CSDL
                var khuyenMai = new KhuyenMai
                {
                   
                    TenKM = model.TenKM,
                    PhanTramKM = model.PhanTramKM,
                    Status = true,
                    NgayBatDau = model.NgayBatDau,
                    NgayKetThuc = model.NgayKetThuc,
                    MoTa = model.MoTa
                   
                };

                var idkm = kmdao.Insert(khuyenMai);

                if (model.Status==true)
                {
                    ApDungKhuyenMaiChoSanPham(idkm);
                }

                if (idkm > 0)
                {
                    // Các xử lý thêm thành công
                    return Redirect("/admin/khuyen-mai");
                }
                else
                {
                    err += "Thêm thất bại. ";
                }
            }
            else
            {
                var list = ModelState.ToDictionary(x => x.Key, y => y.Value.Errors.Select(x => x.ErrorMessage).ToArray())
                    .Where(m => m.Value.Count() > 0);
                foreach (var itm in list)
                {
                    err += string.Concat(string.Join(",", itm.Value.ToArray()), "");
                }
                ViewBag.err = err;
                return View();
            }

            return View();
        }


        public ActionResult ChinhSuaKhuyenMai(long id, int trangThai)
        {
            var session = (UserLogin)Session[CommonConstants.USER_SESSION];
            if (session == null)
            {
                return Redirect("/dang-nhap");
            }
            else
            {
                ViewBag.session = session;
                var nddd = nddao.ViewDetailEmail(session.UserName);
                if (nddd.Role != "Nhân viên" && nddd.Role != "ADMIN")
                {
                    return Redirect("/");
                }
                ViewBag.ndd = nddd;
            }

            // Lấy thông tin chi tiết khuyến mãi
            var khuyenMai = kmdao.ViewDetail(id);

            if (khuyenMai != null)
            {
                // Kiểm tra nếu trạng thái được chỉnh sửa thành 0
                if (trangThai == 0)
                {
                    // Nếu đã qua ngày kết thúc, đặt trạng thái trở thành false
                    if (!IsNgayHienTaiTrongKhoang(khuyenMai.NgayBatDau, khuyenMai.NgayKetThuc))
                    {
                        khuyenMai.Status = false;
                        db.Entry(khuyenMai).State = EntityState.Modified;
                        db.SaveChanges();

                        // Đặt giá sản phẩm về giá cũ
                        var danhSachSanPham = db.ChiTietSanPhams.Where(c => c.IDKhuyenMai == id).ToList();
                        foreach (var chiTietSanPham in danhSachSanPham)
                        {
                            chiTietSanPham.GiaKhuyenMai = chiTietSanPham.GiaCu; // Đặt giá sản phẩm về giá cũ
                            db.Entry(chiTietSanPham).State = EntityState.Modified;
                        }

                        db.SaveChanges();

                        var msg = "Chỉnh sửa trạng thái thành công.";
                        ViewBag.msg = msg;
                    }
                    else
                    {
                        var msg = "Không thể hủy áp dụng khuyến mãi khi đang trong thời gian diễn ra.";
                        ViewBag.msg = msg;
                    }
                }
                else
                {
                    // Nếu trạng thái không được chỉnh sửa thành 0, thực hiện các bước chỉnh sửa khác
                    // (có thể cập nhật các thông tin khác nếu cần)
                    // Ví dụ: khuyenMai.PhanTramKM = newPercentage;

                    // Lưu thay đổi vào CSDL
                    var isUpdated = kmdao.Update(khuyenMai);

                    if (isUpdated)
                    {
                        var msg = "Chỉnh sửa thông tin khuyến mãi thành công.";
                        ViewBag.msg = msg;
                    }
                    else
                    {
                        ModelState.AddModelError("", "Không lưu được vào CSDL");
                    }
                }
            }
            else
            {
                ModelState.AddModelError("", "Không tìm thấy khuyến mãi");
            }

            // Chuyển hướng về trang chi tiết khuyến mãi
            return Redirect("~/admin/khuyen-mai/chinh-sua/" + id);
        }


      



    }
   
}
    








