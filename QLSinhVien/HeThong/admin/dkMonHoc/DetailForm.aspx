<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailForm.aspx.cs" Inherits="QLSinhVien.HeThong.admin.dkMonHoc.DetailForm" %>



<h4 class="modal-title" style="text-align: center;">Cập nhập thông tin môn học</h4>

<form class="form-horizontal" role="form">
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
    <div class="form-group" style="margin-left:40%;">
         <button name="btnSave" id="btnSave" class="btn btn-success" >Lưu lại</button>
         <button name="btnExit" id="btnExit" class="btn btn-danger" >Thoát</button>
    </div>
</form>
