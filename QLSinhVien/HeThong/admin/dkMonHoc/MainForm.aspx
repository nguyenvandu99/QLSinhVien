<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/dkMonHoc.master" AutoEventWireup="true" CodeBehind="MainForm.aspx.cs" Inherits="QLSinhVien.HeThong.admin.dkMonHoc.MainForm" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cplDkMonHoc" runat="server">

<div class="khungChuaBang">
        <div class="head1">
            Thêm mới,chỉnh sửa đăng ký học khoa công nghệ thông tin
        </div>


        <div class="col-sm-12">
            <button id="btnAdd" name="btnAdd" class="btn btn-primary " type="button">Thêm</button>
            <button id="button-delete" name="button-delete" class="btn btn-danger  disabled" type="submit">Xóa</button>
            <div style="float: right">
                <input type="text" name="txtSearch" id="txtSearch" value="" placeholder="Tìm kiếm theo tên" style="width: 250px;" />
                <button id="btnSearch">Tìm kiếm</button>
            </div>
        </div>
      

        <table class="table table-bordered" id="tbDangKyHoc">
            <thead>
                <tr>
                    <th class="cotCheckBox">
                        <input type="checkbox" id="checkbox-all" /></th>
                    <th class="cotMa">Mã đăng ký</th>
                    <th class="cotTen">Năm học</th>
                    <th class="cotNamSinh">Tên học sinh</th>
                     <th class="cotNamSinh">Tên môn học</th>
                     <th class="cotNamSinh">Tên giáo viên</th>
                     <th class="cotNamSinh"> Ngày đăng ký</th>
                    <th class="cotCongCu">Công cụ</th>
                </tr>
            </thead>
            <tbody id="dataList">
            </tbody>
        </table>
        <div id="jdialog"></div>
    </div>
    


    <script>
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
                $("#jdialog").dialog({ title: "Thêm mới đăng ký học", width: formWidth, height: formHeight }).dialog("open");
                return false;
            });
            //button search
            $("#btnSearch").click(function () {
                Search();
            });

            $("#button-delete").click(function () {
                var sel = false;
                var ch = $('#tbDangKyHoc').find('tbody input[type=checkbox]');
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
                        + "<td><input name=courseIds class='checkItem' type=checkbox /> </td>"
                        + "<td><a href=\"#\" onclick=\"FormView(" + data[i].ID + ");\">" + data[i].ID + "</a></td>"
                        + "<td class='row_data'>" + data[i].NAMHOC + "</td>"
                        + "<td>" + data[i].HOCHAM_HOCVI + "</td>"
                        + "<td><button class='btn btn-warning'  onclick=\"EditItem(" + data[i].ID + ");\">Sửa</button>"
                        + "<button class='btn btn-danger'  onclick=\"DeleteItem(" + data[i].ID + ");\">Xóa</button></td>"
                        + "</tr>";

                } $("#dataList").html(htmlData);
            })
        };
        // load data
        function loadData() {
            $.post(encodeURI(urlActionHandler), { "do": "loaddata" }, function (data) {
                var htmlData = "";
                for (var i = 0; i < data.length; i++) {
                    htmlData +=
                        "<tr row_id=" + data[i].ID + ">"
                        + "<td><input name=courseIds class='checkItem' type=checkbox /> </td>"
                        + "<td><a href=\"#\" onclick=\"FormView(" + data[i].ID + ");\">" + data[i].ID + "</a></td>"
                        + "<td class='row_data'>" + data[i].NAMHOC + "</td>"
                        + "<td>" + data[i].TenHocSinh + "</td>"
                        + "<td>" + data[i].TenMonHoc + "</td>"
                        + "<td>" + data[i].TenGiaoVien + "</td>"
                        + "<td>" + GetFormattedDate(data[i].NGAYDANGKY)+ "</td>"
                        + "<td><button  class='btn btn-warning' id='btnEd'   onclick=\"EditItem(" + data[i].ID + ");\">Sửa</button>"
                        + "<button class='btn btn-danger' id='btnDele' onclick=\"DeleteItem(" + data[i].ID + ");\"> Xóa</button></td>"
                        + "</tr>";
                }
                $("#dataList").html(htmlData);
                CheckboxAll();
            });
            function GetFormattedDate(tempDatetime) {
                var date = new Date(tempDatetime);
                var month = (date.getMonth() > 8) ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1));
                var day = (date.getDate() > 9) ? date.getDate() : ('0' + date.getDate());
                var year = date.getFullYear();
                var hour = date.getHours();
                var mm = date.getMinutes();
                
                return hour + ":" + mm + "-" +  day + "/" + month + "/" + year;
            }

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
            $("#jdialog").dialog({ title: "Cập nhật thông tin đăng ký học có mã ID = " + itemID, width: formWidth, height: formHeight }).dialog("open");
        }
        function DeleteItem(itemID) {
            var c = confirm('Bạn muốn xóa lựa chọn ?');
            if (c) {
                $.post(encodeURI(urlActionHandler), { "do": "delete", "itemid": itemID }, function (data) {
                    loadData();
                });
            }
        }



    </script>

</asp:Content>
