<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailForm.aspx.cs" Inherits="QLSinhVien.HeThong.admin.xemDiemThi.DetailForm" %>

<h4 style="text-align: center;">Cập nhập thông tin điểm thi</h4>


<form class="form-horizontal">
    <div class="form-group">
        <label class="control-label col-sm-2">Mã sinh viên:</label>
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
        <label class="control-label col-sm-2">Tên học phần:</label>
        <div class="col-sm-10">
            <input name="txtTenHocPhan" type="text" id="txtTenHocPhan" class="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2">Số tín chỉ:</label>
        <div class="col-sm-10">
            <input name="txtSotinchi" type="text" id="txtSotinchi" class="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2">Điểm kiểm tra số 1:</label>
        <div class="col-sm-10">
            <input name="txtDiemKT1" type="text" id="txtDiemKT1" class="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2">Điểm kiểm tra số 2:</label>
        <div class="col-sm-10">
            <input name="txtDiemKT2" type="text" id="txtDiemKT2" class="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2">Điểm thi kết thúc học phần:</label>
        <div class="col-sm-10">
            <input name="txtDiemThiKT" type="text" id="txtDiemThiKT" class="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2">Tổng kết:</label>
        <div class="col-sm-10">
            <input name="txtTongKet" type="text" id="txtTongKet" class="form-control" />
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2">Điểm chữ:</label>
        <div class="col-sm-10">
            <input name="txtDiemChu" type="text" id="txtDiemChu" class="form-control" />
        </div>
    </div>

    <div class="form-group" style="margin-left: 40%;">
        <button name="btnSave" id="btnSave" class="btn btn-success">Lưu lại</button>
        <button name="btnExit" id="btnExit" class="btn btn-danger">Thoát</button>
    </div>
</form>
