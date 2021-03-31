var rIndex,
    table = document.getElementById("tbSinhVien");

function autoSlider() {
    $('#slider').jqFancyTransitions({
        delay: 2000,

    })
};

//loadd file DH7C1
function loadFileDH7C1() {
    $(document).ready(function () {
        $("#loadCotPhai").load("MainDH7C1.aspx");
    });

};
//loadd file DH7C2
function loadFileDH7C2() {
    $(document).ready(function () {
        $("#loadCotPhai").load("MainDH7C2.aspx");
    });

};
//loadd file DH7C3
function loadFileDH7C3() {
    $(document).ready(function () {
        $("#loadCotPhai").load("MainDH7C3.aspx");
    });

};
//function formAdd() {
//    myModal("plpopup", "DetailForm.aspx");
    
//    return false;
//}
//function myModal(dialogName, addUrl) {
//    $("#" + dialogName).load(addUrl).dialog({
//        autoOpen: true,
//        height: 700,
//        width: 1000,
//        modal: true,
//        position: 'top'

//    });
//    return false;
//}



////popup modal new
//function formAdd() {
//    resetForm();
//    var addDialog = document.getElementById('addDialog');
//    addDialog.showModal();
//    var cancelButton = document.getElementById('cancelButton');
//    var addDialog = document.getElementById('addDialog');
//    cancelButton.addEventListener('click', function () {
//        addDialog.close();
//    });

//    //myModal("plpopup", "DetailForm.aspx");
//    //return false;
//}


//function closeDialog() {
//    $("#jdialog").dialog('close');

//}

//var selectedRow = null


//function readFormData() {
//    var formData = {};
//    formData["txtMaSinhVien"] = document.getElementById("txtMaSinhVien").value;
//    formData["txtHoTen"] = document.getElementById("txtHoTen").value;
//    formData["dateNamSinh"] = document.getElementById("dateNamSinh").value;
//    formData["rdoGioiTinh"] = document.querySelector('input[name = "rdoGioiTinh"]:checked').value;
//    formData["txtQueQuan"] = document.getElementById("txtQueQuan").value;
//    formData["chkLop"] = document.querySelector('input[name = "chkLop"]:checked').value;
//    formData["selectKhoa"] = document.getElementById("selectKhoa").value;
//    return formData;
//}

//function insertNewRecord(data) {
//    if ($("#tbSinhVien tbody").length == 0) {
//        $("#tbSinhVien").append("<tbody></tbody>");
//    }
//    var table = document.getElementById("tbSinhVien").getElementsByTagName('tbody')[0];
//    var newRow = table.insertRow(table.length);
//    cell0 = newRow.insertCell(0);
//    cell0.innerHTML = ` <input name=courseIds type=checkbox />`;
//    cell1 = newRow.insertCell(1);
//    cell1.innerHTML = data.txtMaSinhVien;
//    cell2 = newRow.insertCell(2);
//    cell2.innerHTML = data.txtHoTen;
//    cell3 = newRow.insertCell(3);
//    cell3.innerHTML = data.dateNamSinh;
//    cell4 = newRow.insertCell(4);
//    cell4.innerHTML = data.rdoGioiTinh;
//    cell5 = newRow.insertCell(5);
//    cell5.innerHTML = data.txtQueQuan;
//    cell6 = newRow.insertCell(6);
//    cell6.innerHTML = data.chkLop;
//    cell7 = newRow.insertCell(7);
//    cell7.innerHTML = data.selectKhoa;
//    cell8 = newRow.insertCell(8);
//    cell8.innerHTML = `<a href="#" onclick="onEdit(this);" data-toggle="tooltip" title="Sửa">Sửa</a>
//                      <a onClick="onDelete(this);"  data-toggle="tooltip" title="Xóa"">Xóa</a>`;

//    var checkboxAll = $('#checkbox-all');
//    var courseItemCheckbox = $('input[name ="courseIds"]');
//    var checkAllSumitBtn = $('#button-delete');
//    var containerForm = document.forms['container-form'];
//    //checkbox tất cả
//    checkboxAll.change(function () {
//        var isCheckedAll = $(this).prop('checked');
//        courseItemCheckbox.prop('checked', isCheckedAll);
//        renderCheckAllSubmitBtn();
//    });
//    // course item checkbox changed
//    courseItemCheckbox.change(function () {
//        var isCheckedAll = courseItemCheckbox.length == $('input[name ="courseIds"]:checked').length;
//        checkboxAll.prop('checked', isCheckedAll);
//        renderCheckAllSubmitBtn();

//    });
//    checkAllSumitBtn.click(function (e) {
//        e.preventDefault();
//        var isSumittable = !$(this).hasClass('disabled');
//    });

//    // khởi động nút xóa nhiều
//    function renderCheckAllSubmitBtn() {
//        var checkedCount = $('input[name ="courseIds"]:checked').length;
//        if (checkedCount > 0) {
//            checkAllSumitBtn.removeClass('disabled');
//        } else {
//            checkAllSumitBtn.addClass('disabled');
//        }
//    };
//    closeDialog();

//}
//function resetForm() {
//    document.getElementById("txtMaSinhVien").value = "";
//    document.getElementById("txtHoTen").value = "";
//    document.getElementById("dateNamSinh").value = "";
//    document.getElementsByClassName("rdoGioiTinh").value = "";
//    document.getElementById("txtQueQuan").value = "";
//    document.getElementsByName("chkLop").value = "";
//    document.getElementById("selectKhoa").value = "";
//    selectedRow = null;
//}


//function onEdit(td) {
//    var addDialog = document.getElementById('addDialog');
//    addDialog.showModal();
//    selectedRow = td.parentElement.parentElement;
//    document.getElementById("txtMaSinhVien").value = selectedRow.cells[1].innerHTML;
//    document.getElementById("txtHoTen").value = selectedRow.cells[2].innerHTML;
//    document.getElementById("dateNamSinh").value = selectedRow.cells[3].innerHTML;
//    document.getElementsByClassName("rdoGioiTinh").value = selectedRow.cells[4].innerHTML;
//    document.getElementById("txtQueQuan").value = selectedRow.cells[5].innerHTML;
//    document.getElementsByName("chkLop").value = selectedRow.cells[6].innerHTML;
//    document.getElementById("selectKhoa").value = selectedRow.cells[7].innerHTML;

//}

//function updateRecord(formData) {
//    selectedRow.cells[1].innerHTML = formData.txtMaSinhVien;
//    selectedRow.cells[2].innerHTML = formData.txtHoTen;
//    selectedRow.cells[3].innerHTML = formData.dateNamSinh;
//    selectedRow.cells[4].innerHTML = formData.rdoGioiTinh;
//    selectedRow.cells[5].innerHTML = formData.txtQueQuan;
//    selectedRow.cells[6].innerHTML = formData.chkLop;
//    selectedRow.cells[7].innerHTML = formData.selectKhoa;
//    closeDialog();
//}

//function onDelete(td) {
//    if (confirm('Bạn có muốn xóa không ?')) {
//        row = td.parentElement.parentElement;
//        document.getElementById("tbSinhVien").deleteRow(row.rowIndex);
//        resetForm();
//    }
//}
//function validate() {
//    isValid = true;
//    if (document.getElementById("txtHoTen").value == "") {
//        isValid = false;
//        document.getElementById("txtHoTenValidationError").classList.remove("hide");

//    } else {
//        isValid = true;
//        if (!document.getElementById("txtHoTenValidationError").classList.contains("hide"))
//            document.getElementById("txtHoTenValidationError").classList.add("hide");
//    }
//    if (document.getElementById("txtMaSinhVien").value == "") {
//        isValid = false;
//        document.getElementById("txtMaSinhVienValidationError").classList.remove("hide");

//    } else {
//        isValid = true;
//        if (!document.getElementById("txtMaSinhVienValidationError").classList.contains("hide"))
//            document.getElementById("txtMaSinhVienValidationError").classList.add("hide");
//    }

//    return isValid;
//}

//$(document).ready(function () {
//    $("#search").on("keyup", function () {
//        var value = $(this).val().toLowerCase();
//        $("#tbSinhVien tbody tr").filter(function () {
//            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
//        });
//    });
//});

//function onFormSubmit() {
//    if (validate()) {
//        var formData = readFormData();
//        if (selectedRow == null) {
//            insertNewRecord(formData);
//        }
//        else
//            updateRecord(formData);
//        resetForm();
//    }
//};



