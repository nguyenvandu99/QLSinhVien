<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailForm.aspx.cs" Inherits="QLSinhVien.HeThong.admin.dsGiangVien.DetailForm" %>


<form class="form-horizontal" role="form" id="frmGV">   
     <input type="hidden" name="ItemID" value="<%=itemID %>" />
     <input type="hidden" name="do" value="<%=doAction%>" />
    <div class="form-group">
        <label class="control-label col-sm-2">Họ và tên(*):</label>
        <div class="col-sm-10">
            <input name="txtTen" type="text" id="txtTen" class="form-control" value="<%=gv.TEN %>" />

        </div>
    </div>
    <div class="form-group">
        <label class="control-label col-sm-2">Học hàm học vị:</label>
        <div class="col-sm-10">
            <input name="txtHocHamHocVi" id="txtHocHamHocVi" type="text" class="form-control" value="<%=gv.HOCHAM_HOCVI %>" />
        </div>
    </div>
   
    <div class="form-group" style="margin-left: 40%;margin-top:50%;">
         <button name="btnSave" id="btnSaveGiaoVien" type="button" class="btn btn-success">Lưu lại</button>
        <button name="btnExit" id="btnExit" onclick="javascrip:closeDialog()" class="btn btn-danger">Thoát</button>
    </div>
</form>
<script type="text/javascript">   
  
    $(document).ready(function () {
        $("#btnSaveGiaoVien").click(function () {
            if (validate()) {
                SubmitForm();
            }
        });
    });
    function SubmitForm() {
        //onSubmit           
        var urlActionHandler = "ActionHandler.aspx";
        var dataPostBack = $("#frmGV").find("input,textarea,select,hidden").not("#__VIEWSTATE,#__EVENTVALIDATION").serialize();           
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
        var Action = "<%=doAction%>"; //Lấy tên hành động
        var TenGV = "<%=gv.TEN %>"; // Lấy giá trị trả về của tên
        var listTenGV = [];
        // Lấy ra danh sách tên lớp học vào mảng
        listTenGV.push(<% foreach (var item in tbl_GiaoViens) {%>"<%=item.TEN%>", <% } %>);
        //Kiểm tra xem hành động có phải là edit không ?
        if (Action == 'edit') {
            //Nếu là edit thì xóa tên hiện tại trong mảng
            NewlistTenGV = listTenGV.filter(item => item !== TenGV);
            var checkItem = NewlistTenGV.indexOf(document.getElementById("txtTen").value);
        } else {
            //Nếu không phải edit thì kiểm tra ở mảng khởi tạo ban đầu
            var checkItem = listTenGV.indexOf(document.getElementById("txtTen").value);
        }
        if (document.getElementById("txtTen").value == "") {
            isValid = false;
            alert('Vui lòng nhập đầy đủ tên giáo viên .');
        }
        else if (checkItem >= 0) {
            isValid = false;
            alert('Tên giáo viên đã tồn tại vui lòng nhập tên khác.');
        }
        else {
            isValid = true;
        }
        return isValid;
    }



    function closeDialog() {
        $("#jdialog").html("").dialog('close');
    }


</script>
