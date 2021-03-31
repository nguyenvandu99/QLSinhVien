<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/dkMonHoc.master" AutoEventWireup="true" CodeBehind="MainForm.aspx.cs" Inherits="QLSinhVien.HeThong.admin.dkMonHoc.MainForm" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cplDkMonHoc" runat="server">


    <div class="khungChuaBang">
        <div class="head1">
            Thêm mới,chỉnh sửa môn học
        </div>
        

        <div class="col-sm-12">
    <button id="button-add" name="button-add" onclick="javascript:formAdd()" class="btn btn-primary " type="button">Thêm</button>
    <button id="button-delete" onClick="javascript:deleteRows(this);" name="button-delete" class="btn btn-danger  disabled" type="submit">Xóa</button>
         </div>

        
        <div id="plpopup" class="plpopup" >
            
        </div>

        <table class="table table-bordered" id="tbMonHoc">
            <tr>
                 <th class="cotCheckBox">
            <input type="checkbox" id="checkbox-all"  /></th>
                <th class="cotLopHocPhan">Lớp học phần</th>
                <th class="cotHocPhan">Học Phần</th>
                <th class="cotThoiGian">Thời gian</th>
                <th class="cotDiaDiem">Địa điểm</th>
                <th class="cotSiSo">Sĩ số</th>
                <th class="cotSoDK">Số đăng ký</th>
                <th class="cotSoTC">Số tín chỉ</th>
                <th class="cotCongCu">Công cụ</th>
            </tr>      
        </table>
    </div>
     <dialog id="addDialog" style="width:55%;height:58%;" >         
<form  autocomplete="off" onsubmit="event.preventDefault();" class="form-horizontal" id="formSV" method="dialog" role="form" >    
    <h4 style="text-align: center;">Cập nhập thông tin sinh viên</h4>
    <div class="form-group">
        <label class="control-label col-sm-2">Lớp học phần:</label>
        <div class="col-sm-10">
            <input name="txtLopHocPhan" id="txtLopHocPhan" type="text" class="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2">Học Phần:</label>

        <div class="col-sm-10">
            <input name="txtHocPhan" type="text" id="txtHocPhan" class="form-control" />
        </div>
    </div>
    <div class="form-group">
       
        <label class="control-label col-sm-2"> Bắt đầu:</label>
        <div class="col-sm-10">
            <input name="dateThoiGian" id="dateThoiGian" type="date" class="form-control" />
        </div>
        <label class="control-label col-sm-2"> Kết thúc:</label>
        <div class="col-sm-10">
            <input name="dateThoiGian" id="dateThoiGian1" type="date" class="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2">Địa điểm:</label>
        <div class="col-sm-10">
            <input name="txtDiaDiem" type="text" id="txtDiaDiem" class="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2">Sĩ Số:</label>
        <div class="col-sm-10">
            <input name="txtSiSo" type="text" id="txtSiSo" class="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2">Số Đăng Ký:</label>
        <div class="col-sm-10">
            <input name="txtSoDangKy" type="text" id="txtSoDangKy" class="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2">Số Tín Chỉ:</label>
        <div class="col-sm-10">
            <input name="txtSoTinChi" type="text" id="txtSoTinChi" class="form-control" />
        </div>
    </div>
    <div class="form-group" style="margin-left: 40%;margin-top:5%;">     
        <button name="btnSave" id="btnSave" type="submit" onclick="javascrip:onFormSubmit();" class="btn btn-success">Lưu lại</button>      
        <button name="btnExit" id="cancelButton" onclick="javascrip:closeDialog(this);"   class="btn btn-danger">Thoát</button>
    </div>
</form>
 </dialog>


        <script>
            $(document).ready(function () {

                // Cấu hình các nhãn phân trang
                $('#tbMonHoc').dataTable({
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

            });
        </script>

</asp:Content>
