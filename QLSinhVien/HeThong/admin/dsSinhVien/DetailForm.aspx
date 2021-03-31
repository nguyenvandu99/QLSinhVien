<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailForm.aspx.cs" Inherits="QLSinhVien.HeThong.admin.dsSinhVien.DetailForm" %>


<h4 style="text-align: center;">Cập nhập thông tin sinh viên</h4>
<form autocomplete="off" onsubmit="event.preventDefault();" class="form-horizontal" id="frmHS" role="form">
    <input type="hidden" name="ItemID" value="<%=itemID %>" />
    <input type="hidden" name="do" value="<%=doAction%>" />
    <div class="form-group">
        <label class="control-label col-sm-2">Họ và tên(*)
        </label>
        <div class="col-sm-10">
            <input name="txtTen" type="text" id="txtTen" class="form-control" value="<%=hs.TEN %>" placeholder="Nhập họ tên" />
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2">Năm sinh:</label>
        <div class="col-sm-10">
            <input name="dateNgaySinh" id="dateNgaySinh" type="date" class="form-control"  value="<%= Convert.ToDateTime(hs.NGAYSINH).ToString("yyyy-MM-dd") %>" />
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2">Giới tính: </label>
        <div class="col-sm-10">
            <label class="radio-inline">
                <input name="rdoGioiTinh" id="rdoGTNam" type="radio" value="false" <%= (hs.GIOITINH == false ? "checked":"") %>  />Nam
            </label>
            <label class="radio-inline">
                <input name="rdoGioiTinh" id="rdoGTNu" type="radio" value="true" <%= (hs.GIOITINH == true ? "checked":"") %> />Nữ              
            </label>   
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2">Quê quán:</label>
        <div class="col-sm-10">
            <div>
                <textarea rows="5" cols="100" name="txtQueQuan" id="txtQueQuan" class="form-control"  placeholder="Nhập quê quán" > <%=hs.QUEQUAN %> </textarea>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2">Lớp:</label>
        <div class="col-sm-10">
            <select name="sltLop" class="form-control" id="sltLop">
                <% foreach (var item in tbl_lopHocs)
                        {%>
                    <option value="<%=item.ID %>" <%= (hs.LOPID == item.ID ? "selected" : "") %>><%= item.TEN %></option>
                    <% } %>
            </select>
        </div>
    </div>
    <div class="form-group" style="margin-left: 40%; margin-top: 10%;">
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
            var dataPostBack = $("#frmHS").find("input,textarea,select,hidden").not("#__VIEWSTATE,#__EVENTVALIDATION").serialize();           
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
        if (document.getElementById("txtTen").value == "") {
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
