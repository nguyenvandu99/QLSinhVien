<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailForm.aspx.cs" Inherits="QLSinhVien.HeThong.admin.dsGiangVien.DetailForm" %>

<h4 class="modal-title" style="text-align: center;">Cập nhập thông tin giảng viên</h4>

<form class="form-horizontal" role="form">
    <div class="form-group">
        <label class="control-label col-sm-2">Mã giảng viên:</label>
        <div class="col-sm-10">
            <input name="txtMaSinhVien" id="txtMaSinhVien" type="text" class="form-control" />
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
    <div class="form-group" style="margin-left: 40%;">
        <button name="btnSave" id="btnSave" class="btn btn-success">Lưu lại</button>
        <button name="btnExit" id="btnExit" class="btn btn-danger">Thoát</button>
    </div>
</form>

