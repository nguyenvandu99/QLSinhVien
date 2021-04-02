<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="MainForm.aspx.cs" Inherits="QLSinhVien.HeThong.admin.dsLopHoc.MainForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cplMain" runat="server">

    <div class="khungChuaBang">
        <div class="head1">
            Thêm mới,chỉnh sửa môn học
        </div>


        <div class="col-sm-12">
            <button id="btnAdd" name="btnAdd" class="btn btn-primary " type="button">Thêm</button>
            <button id="button-delete" name="button-delete" class="btn btn-danger  disabled" type="submit">Xóa</button>
            <div style="float: right">
                <input type="text" name="txtSearch" id="txtSearch" value="" placeholder="Tìm kiếm theo tên" style="width: 250px;" />
                <button id="btnSearch">Tìm kiếm</button>
            </div>
        </div>


        <table class="table table-bordered" id="tbLopHoc">
            <thead>
                <tr>
                    <th class="cotCheckBox">
                        <input type="checkbox" id="checkbox-all" />All</th>
                    <th class="cotMa">Mã lớp học</th>
                    <th class="cotTen">Tên lớp học</th>
                    <th class="cotNamSinh">Chủ nhiệm</th>
                    <th class="cotCongCu">Công cụ</th>
                </tr>
            </thead>
            <tbody id="dataList">
            </tbody>
        </table>
        <div id="jdialog"></div>
        <select name="pagenum" id="pagenum">
            <option value="1">1 </option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
        </select>
    </div>



    <script>
        <%=""%>
        var urlForm = "DetailForm.aspx";
        var urlActionHandler = "ActionHandler.aspx";
        var formWidth = 800;
        var formHeight = 600;
        
        $(document).ready(function () {
            loadData();
            RegisterMainEvent();

        });
        function RegisterMainEvent() {
            $("#btnAdd").click(function () {
                $.post(encodeURI(urlForm), { "do": "add" }, function (data) {
                    $("#jdialog").html(data);
                });
                $("#jdialog").dialog({ title: "Thêm mới lớp học", width: formWidth, height: formHeight }).dialog("open");
                return false;
            });
            //button search
            $("#btnSearch").click(function () {
                Search();
            });

            $("#button-delete").click(function () {
                var sel = false;
                var ch = $('#tbLopHoc').find('tbody input[type=checkbox]');
                var c = confirm('Bạn muốn xóa lựa chọn ?');
                if (c) {
                    ch.each(function () {
                        var $this = $(this);
                        if ($this.is(':checked')) {
                            sel = true;	//set to true if there is/are selected row
                            $this.parents('tr').fadeOut(function () {
                                $this.remove(); //remove row when animation is finished                                
                            });
                        }
                    });
                    if (!sel) alert('No data selected');
                }
                return false;
            });
        }
        //Tìm kiếm 
        function Search() {
            $.post(encodeURI(urlActionHandler), {
                "do": "search",
                "value": $("#txtSearch").val(),
                "page": $("#pagenum").val()
            }, function (data) {
                var htmlData = "";
                for (var i = 0; i < data.length; i++) {
                    htmlData +=
                        "<tr row_id=" + data[i].ID + ">"
                        + "<td class='cotCheckBox'><input name=courseIds  class='checkItem' type=checkbox /> </td>"
                        + "<td class='cotMa'><a href=\"#\" onclick=\"FormView(" + data[i].ID + ");\">" + data[i].ID + "</a></td>"
                        + "<td class='row_data'>" + data[i].TEN + "</td>"
                        + "<td class='cotSoTC'>" + data[i].CHUNHIEM + "</td>"
                        + "<td class='cotCongCu'><a href='#' title='Sửa' onclick=\"EditItem(" + data[i].ID + ");\"><i class='fa fa-edit'></i> </a>"
                        + "<a href='#' title='Xóa' onclick=\"DeleteItem(" + data[i].ID + ");\"><i class='fa fa-trash-alt'></i> </a> </td>"
                        + "</tr>";
                } $("#dataList").html(htmlData);
            })
        };

        // load data
        function loadData(numCheckDelete) {
            $.post(encodeURI(urlActionHandler), { "do": "loaddata" }, function (data) {
                var htmlData = "";
                for (var i = 0; i < data.length; i++) {
                    htmlData +=
                        "<tr row_id=" + data[i].ID + ">"
                        + "<td><input name=courseIds class='checkItem' type=checkbox /> </td>"
                        + "<td class='cotMa'><a href=\"#\" onclick=\"FormView(" + data[i].ID + ");\">" + data[i].ID + "</a></td>"
                        + "<td class='row_data'>" + data[i].TEN + "</td>"
                        + "<td class='cotSoTC'>" + data[i].CHUNHIEM + "</td>"
                        + "<td class='cotCongCu'><a href='#' title='Sửa' onclick=\"EditItem(" + data[i].ID + ");\"><i class='fa fa-edit'></i> </a>"
                        + "<a href='#' title='Xóa' onclick=\"DeleteItem(" + data[i].ID + ");\"><i class='fa fa-trash-alt'></i> </a> </td>"
                        + "</tr>";
                }

                $("#dataList").html(htmlData);
                CheckboxAll();
                var newCheckDelete = $('.checkItem');
                //check xóa thành công hay không
                if (newCheckDelete.length == numCheckDelete) {
                    alert('Không thể xóa lớp học vì còn sinh viên tồn tại trong lớp.')
                   
                }                                               
            });
            

        }

        function CheckboxAll() {
            // check box all
            var courseItemCheckbox = $('.checkItem');
            var checkboxAll = $('#checkbox-all');
            var checkAllSumitBtn = $('#button-delete');
            var containerForm = document.forms['container-form'];

            checkboxAll.change(function () {
                courseItemCheckbox.prop("checked", $(this).prop("checked"))
                renderCheckAllSubmitBtn();
            });
            // course item checkbox changed

            courseItemCheckbox.change(function () {
                var isCheckedAll = $('.checkItem').length == $('.checkItem:checked').length;
                checkboxAll.prop('checked', isCheckedAll);
                renderCheckAllSubmitBtn();

            });
            checkAllSumitBtn.click(function (e) {
                e.preventDefault();
                var isSumittable = !$(this).hasClass('disabled');
            });
            // khởi động nút xóa nhiều
            function renderCheckAllSubmitBtn() {
                var checkedCount = $('input[name ="courseIds"]:checked').length;
                if (checkedCount > 0) {
                    checkAllSumitBtn.removeClass('disabled');
                } else {
                    checkAllSumitBtn.addClass('disabled');
                }
            };
        }
        function EditItem(itemID) {
            $.post(encodeURI(urlForm), { "do": "edit", "itemid": itemID }, function (data) {
                $("#jdialog").html(data);
            });
            $("#jdialog").dialog({ title: "Cập nhật thông tin lớp học có mã ID = " + itemID, width: formWidth, height: formHeight }).dialog("open");
        }

        function DeleteItem(itemID) {
            var checkDelete = $('.checkItem');
            var numCheckDelete = checkDelete.length;
            var c = confirm('Bạn muốn xóa lựa chọn ?');
            if (c) {
                $.post(encodeURI(urlActionHandler), { "do": "delete", "itemid": itemID }, function (data) {
                    loadData(numCheckDelete);                   
                });
            }


        }

    </script>

</asp:Content>
