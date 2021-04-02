<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainDH7C2.aspx.cs" Inherits="QLSinhVien.HeThong.admin.dsSinhVien.MainDH7C2" %>


    
    <div class="loadCotPhai" id="loadCotPhai">
  <div class="khungChuaBang1">
            <div class="head1">
                Thêm mới,chỉnh sửa sinh viên lớp DH7C1
            </div>
            <div class="col-sm-12">
                <button id="btnAdd" name="button-add"  class="btn btn-primary " type="button">Thêm</button>
                <button id="button-delete" name="button-delete" class="btn btn-danger  disabled" type="submit">Xóa</button>

                <div style="float: right">
                    <input type="text" name="txtSearch" id="txtSearch" value="" placeholder="Tìm kiếm theo tên " style="width: 250px;" />
                    <button id="btnSearch">Tìm kiếm</button>
                </div>
            </div>
        </div>


        <table class="table table-bordered table-condensed table-striped" id="tbSinhVien">
            <thead>
                <tr>
                    <th class="cotCheckBox">
                        <input type="checkbox" id="checkbox-all" />
                        All</th>
                    <th class="cotMa">Mã sinh viên</th>
                    <th class="cotTen">Họ và tên</th>
                    <th class="cotNamSinh">Năm sinh</th>
                    <th class="cotGioiTinh">Giới tính</th>
                    <th class="cotQueQuan">Quê quán</th>
                    <th class="cotLop">Lớp</th>
                    <th class="cotCongCu">Công cụ</th>
                </tr>
            </thead>
            <tbody id="dataList">
            </tbody>

        </table>
    </div>
  

    <script type="text/javascript">
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
                $("#jdialog").dialog({ title: "Thêm mới học sinh", width: formWidth, height: formHeight }).dialog("open");
                return false;
            });
            //button search
            $("#btnSearch").click(function () {
                Search();
            });

            $("#button-delete").click(function () {
                var sel = false;
                var ch = $('#tbSinhVien').find('tbody input[type=checkbox]');
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
        //Tìm kiếm sinh viên
        function Search() {
            $.post(encodeURI(urlActionHandler), {
                "do": "searchlop2",
                "value": $("#txtSearch").val(),
                "page": $("#pagenum").val()
            }, function (data) {
                var htmlData = "";
                for (var i = 0; i < data.length; i++) {
                    htmlData +=
                        "<tr row_id=" + data[i].ID + ">"
                        + "<td><input name=courseIds class='checkItem' type=checkbox /> </td>"
                        + "<td class='cotMa'><a href=\"#\" onclick=\"FormView(" + data[i].ID + ");\">" + data[i].ID + "</a></td>"
                        + "<td class='row_data'>" + data[i].TEN + "</td>"
                        + "<td class='cotNamSinh'>" + GetFormattedDate(data[i].NGAYSINH) + "</td>"
                        + "<td class='cotGioiTinh'>" + (data[i].GIOITINH == 0 ? "Nam" : "Nữ") + "</td>"
                        + "<td class='cotQueQuan'>" + data[i].QUEQUAN + "</td>"
                        + "<td class='cotMa'>" + data[i].TenLop + "</td>"
                        + "<td class='cotCongCu'><a href='#' title='Sửa' onclick=\"EditItem(" + data[i].ID + ");\"><i class='fa fa-user-edit'></i> </a>"
                        + "<a href='#' title='Xóa' onclick=\"DeleteItem(" + data[i].ID + ");\"><i class='fa fa-user-times'></i> </a> </td>"
                        + "</tr>";
                } $("#dataList").html(htmlData);
            })
            //fommatdate
            function GetFormattedDate(tempDatetime) {
                var date = new Date(tempDatetime);
                var month = (date.getMonth() > 8) ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1));
                var day = (date.getDate() > 9) ? date.getDate() : ('0' + date.getDate());
                var year = date.getFullYear();
                return day + "/" + month + "/" + year;
            }
        };
        // load sinh viên
        function loadData() {
            $.post(encodeURI(urlActionHandler), { "do": "loaddatalop2" }, function (data) {
                var htmlData = "";
                for (var i = 0; i < data.length; i++) {
                    htmlData +=
                        "<tr row_id=" + data[i].ID + ">"
                        + "<td><input name=courseIds class='checkItem' type=checkbox /> </td>"
                        + "<td class='cotMa'><a href=\"#\" onclick=\"FormView(" + data[i].ID + ");\">" + data[i].ID + "</a></td>"
                        + "<td class='row_data'>" + data[i].TEN + "</td>"
                        + "<td class='cotNamSinh'>" + GetFormattedDate(data[i].NGAYSINH) + "</td>"
                        + "<td class='cotGioiTinh'>" + (data[i].GIOITINH == 0 ? "Nam" : "Nữ") + "</td>"
                        + "<td class='cotQueQuan'>" + data[i].QUEQUAN + "</td>"
                        + "<td class='cotMa'>" + data[i].TenLop + "</td>"
                        + "<td class='cotCongCu'><a href='#' title='Sửa' onclick=\"EditItem(" + data[i].ID + ");\"><i class='fa fa-user-edit'></i> </a>"
                        + "<a href='#' title='Xóa' onclick=\"DeleteItem(" + data[i].ID + ");\"><i class='fa fa-user-times'></i> </a> </td>"
                        + "</tr>";
                }
                $("#dataList").html(htmlData);
                CheckboxAll();
            });
            //fommatdate
            function GetFormattedDate(tempDatetime) {
                var date = new Date(tempDatetime);
                var month = (date.getMonth() > 8) ? (date.getMonth() + 1) : ('0' + (date.getMonth() + 1));
                var day = (date.getDate() > 9) ? date.getDate() : ('0' + date.getDate());
                var year = date.getFullYear();
                return day + "/" + month + "/" + year;
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
            // active menu lớp
            var header = document.getElementById("menuLop");
            var btns = header.getElementsByClassName("menuLop");
            for (var i = 0; i < btns.length; i++) {
                btns[i].addEventListener("click", function () {
                    var current = document.getElementsByClassName("active");
                    current[0].className = current[0].className.replace(" active", "");
                    this.className += " active";
                });
            };

        }
        function EditItem(itemID) {
            $.post(encodeURI(urlForm), { "do": "edit", "itemid": itemID }, function (data) {
                $("#jdialog").html(data);
            });
            $("#jdialog").dialog({ title: "Cập nhật thông tin sinh viên có mã ID = " + itemID, width: formWidth, height: formHeight }).dialog("open");
        }
        function DeleteItem(itemID) {
            var c = confirm('Bạn muốn xóa lựa chọn ?');
            if (c) {
                $.post(encodeURI(urlActionHandler), { "do": "delete", "itemid": itemID }, function (data) {
                    loadData();
                });
            }
        }
        function closeDialog() {
            $("#jdialog").dialog('close');

        }
    </script>  
