<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/dsGiangVien.master" AutoEventWireup="true" CodeBehind="MainForm.aspx.cs" Inherits="QLSinhVien.HeThong.admin.dsGiangVien.MainForm" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cplGiangVien" runat="server">

    <div class="khungChuaBang">
        <div class="head1">
            Thêm mới,chỉnh sửa giảng viên khoa công nghệ thông tin
        </div>


        <div class="col-sm-12">
    <button id="button-add" name="button-add" onclick="javascript:formAdd()" class="btn btn-primary " type="button">Thêm</button>
    <button id="button-delete" onClick="javascript:deleteRows(this);" name="button-delete" class="btn btn-danger  disabled" type="submit">Xóa</button>
         </div>
       
       
        <div id="plpopup" class="plpopup" >
            
        </div>

        <table class="table table-bordered" id="tbGiangVien">

            <tr>
                <th class="cotCheckBox">
                <input type="checkbox" id="checkbox-all"  /></th>
                <th class="cotMa">Mã giảng viên</th>
                <th class="cotTen">Họ và tên</th>
                <th class="cotNamSinh">Năm sinh</th>
                <th class="cotGioiTinh">Giới tính</th>
                <th class="cotQueQuan">Quê quán</th>
                <th class="cotMaKhoa">Mã Khoa</th>
                <th class="cotCongCu">Công cụ</th>
            </tr>           
        </table>
    </div>

 <dialog id="addDialog" style="width:55%;height:58%;" >         
<form  autocomplete="off" onsubmit="event.preventDefault();" class="form-horizontal" id="formSV" method="dialog" role="form" >    
    <div class="form-group">
        <label class="control-label col-sm-2">Mã giảng viên:</label>
        <div class="col-sm-10">
            <input name="txtMaGiangVien" id="txtMaGiangVien" type="text" class="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2">Họ và tên:</label>
        <div class="col-sm-10">
            <input name="txtHoTen" type="text" id="txtHoTen" class="form-control" />

        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2">Năm sinh:</label>
        <div class="col-sm-10">
            <input name="dateNamSinh" id="dateNamSinh" type="date" class="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2">Giới tính:</label>
        <div class="col-sm-10">
            <label class="radio-inline">
                <input name="radioGioiTinh" id="radioGTNam" type="radio" value="Nam" />Nam
            </label>
            <label class="radio-inline">
                <input name="radioGioiTinh" id="radioGTNu" type="radio" value="Nữ" />Nữ              
            </label>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2">Quê quán:</label>
        <div class="col-sm-10">
            <textarea rows="5" cols="100" name="txtQueQuan" id="txtQueQuan" class="form-control"></textarea>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2">Khoa:</label>
        <div class="col-sm-10">
            <select name="selectKhoa" class="form-control" id="selectKhoa">
                <option value="KhoaCNTT">Khoa công nghệ thông tin</option>
                <option value="KhoaKT">Khoa kế toán</option>

            </select>
        </div>
    </div>
 
    <div class="form-group" style="margin-left: 40%;margin-top:5%;">     
        <button name="btnSave" id="btnSave" type="submit" onclick="javascrip:onFormSubmit();" class="btn btn-success">Lưu lại</button>      
        <button name="btnExit" id="cancelButton" onclick="javascrip:closeDialog(this);"   class="btn btn-danger">Thoát</button>
    </div>
</form>
 </dialog>

    <script>
        $(document).ready(function() {

            // Cấu hình các nhãn phân trang
            $('#tbGiangVien').dataTable({
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
