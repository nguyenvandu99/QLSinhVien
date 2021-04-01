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
