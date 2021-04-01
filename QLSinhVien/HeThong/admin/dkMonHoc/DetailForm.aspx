<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailForm.aspx.cs" Inherits="QLSinhVien.HeThong.admin.dkMonHoc.DetailForm" %>


<form autocomplete="off" onsubmit="event.preventDefault();" class="form-horizontal" id="frmDKH" role="form">
    <input type="hidden" name="ItemID" value="<%=itemID %>" />
    <input type="hidden" name="do" value="<%=doAction%>" />
    <div class="form-group">
        <label class="control-label col-sm-2">Năm Học(*)
        </label>
        <div class="col-sm-10">
            <input name="txtNamHoc" type="text" id="txtNamHoc" class="form-control" value="<%=dkh.NAMHOC %>" placeholder="Nhập năm học" />
        </div>
    </div>
     <div class="form-group">
        <label class="control-label col-sm-2">Tên sinh viên:</label>
        <div class="col-sm-10">
            <select name="sltHocSinh" class="form-control" id="sltHocSinh">
                <% foreach (var item in tbl_HocSinhs)
                        {%>
                    <option value="<%=item.ID %>" <%= (dkh.HOCSINH == item.ID ? "selected" : "") %>><%= item.TEN %></option>
                    <% } %>
            </select>
        </div>
    </div>
     <div class="form-group">
        <label class="control-label col-sm-2">Tên môn học:</label>
        <div class="col-sm-10">
            <select name="sltMonHoc" class="form-control" id="sltMonHoc">
                <% foreach (var item in tbl_MonHocs)
                        {%>
                    <option value="<%=item.ID %>" <%= (dkh.MONHOC == item.ID ? "selected" : "") %>><%= item.TEN %></option>
                    <% } %>
            </select>
        </div>
    </div>
     <div class="form-group">
        <label class="control-label col-sm-2">Tên giáo viên:</label>
        <div class="col-sm-10">
            <select name="sltGiaoVien" class="form-control" id="sltGiaoVien">
                <% foreach (var item in tbl_GiaoViens)
                        {%>
                    <option value="<%=item.ID %>" <%= (dkh.GIAOVIEN == item.ID ? "selected" : "") %>><%= item.TEN %></option>
                    <% } %>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2">Ngày đăng ký:</label>
        <div class="col-sm-10">
            <input name="dateNgayDangKy" id="dateNgayDangKy" type="datetime-local" class="form-control"  value="<%= Convert.ToDateTime(dkh.NGAYDANGKY).ToString("yyyy-MM-ddThh:mm") %>" />
        </div>
    </div>
    <div class="form-group" style="margin-left: 40%; margin-top: 30%;">
        <button name="btnSave" id="btnSaveStudent" type="button" class="btn btn-success">Lưu lại</button>
        <button name="btnExit" id="btnExit" onclick="javascrip:closeDialog()" class="btn btn-danger">Thoát</button>
    </div>
</form>
<script type="text/javascript">
    var urlActionHandler = "ActionHandler.aspx";
    $(document).ready(function () {
        $("#btnSaveStudent").click(function () {
            if (validate()) {
                SubmitForm();
            }
        });
    });
    function SubmitForm() {
        //onSubmit              
        var dataPostBack = $("#frmDKH").find("input,textarea,select,hidden").not("#__VIEWSTATE,#__EVENTVALIDATION").serialize();
        $.post(urlActionHandler, dataPostBack, function (data) {
            if (data.Erros) {
                alert(data.Message);
                $("#jdialog", window.parent.document).scrollTop(0);
            }
            else {
                $("#jdialog").html("").dialog('close');
                loadData();
            }
        });
    }
    function validate() {
        isValid = true;
        if (document.getElementById("txtNamHoc").value == "") {
            isValid = false;
            alert('Vui lòng nhập đầy đủ năm học.');

        } else {
            isValid = true;

        }
        return isValid;
    }
    function closeDialog() {
        $("#jdialog").html("").dialog('close');
    }


</script>