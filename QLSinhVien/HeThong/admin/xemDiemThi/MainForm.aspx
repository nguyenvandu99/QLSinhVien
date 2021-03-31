<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/xemDiemThi.master" AutoEventWireup="true" CodeBehind="MainForm.aspx.cs" Inherits="QLSinhVien.HeThong.admin.xemDiemThi.MainForm" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cplxemDiemThi" runat="server">
    <div class="khungChuaBang">
        <div class="head1">
            Điểm thi sinh viên
        </div>              
        <div class="col-sm-12">
    <button id="button-add" name="button-add" onclick="javascript:formAdd()" class="btn btn-primary " type="button">Thêm</button>
    <button id="button-delete" onClick="javascript:deleteRows(this);" name="button-delete" class="btn btn-danger  disabled" type="submit">Xóa</button>
         </div>
       
       
        <div id="plpopup" class="plpopup" >            
        </div>
        <table class="table table-bordered" id="tbXemDiemThi">            
            <tr>
                <th> <input type="checkbox" id="select-all" onclick="javascript:checkAll(this)"/></th>
                <th class="cotMa">Mã sinh viên</th>
                <th class="cotTen">Họ và tên</th>
                <th class="cotTenHocPhan">Tên học phần</th>
                <th class="cotSoTC">Số tín chỉ</th>
                <th class="cotDiemKT1">Điểm kiểm tra số 1</th>
                <th class="cotDiemKT2">Điểm kiểm tra số 2</th>
                <th class="cotThiKetThucHocPhan">Thi kết thúc học phần</th>
                <th class="cotTongKet">Tổng kết</th>
                <th class="cotDiemChu">Điểm chữ</th>
                <th class="cotCongCu">Công cụ</th>
            </tr>            
        </table>
    </div>
        <script>
        $(document).ready(function() {

            // Cấu hình các nhãn phân trang
            $('#tbXemDiemThi').dataTable({
                "language": {
                    "sProcessing": "Đang xử lý...",
                    "sLengthMenu": "Xem _MENU_ mục",
                    "sZeroRecords": "Không tìm thấy dòng nào phù hợp",
                    "sInfo": "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
                    "sInfoEmpty": "Đang xem 0 đến 0 trong tổng số 0 mục",
                    "sInfoFiltered": "(được lọc từ _MAX_ mục)",
                    "sInfoPostFix": "",
                    "sSearch": "Tìm:",
                    "sUrl": "",
                    "oPaginate": {
                        "sFirst": "Đầu",
                        "sPrevious": "Trước",
                        "sNext": "Tiếp",
                        "sLast": "Cuối"
                    }
                },
                "processing": true, // tiền xử lý trước
                "aLengthMenu": [[5, 10, 20, 50], [5, 10, 20, 50]], // danh sách số trang trên 1 lần hiển thị bảng
                "order": [[1, 'desc']] //sắp xếp giảm dần theo cột thứ 1
            });
       
  } ); 
        </script>
</asp:Content>
