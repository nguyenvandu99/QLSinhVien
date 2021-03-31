<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Main.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="QLSinhVien.HeThong.admin.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cplMain" runat="server">

    <div class="col-sm-3" id="sidebarLeft">
        <div class="zone zone--list" id="zone1">
            <h3 class="label1">CHỦ ĐỀ NỔI BẬT</h3>
            <div class="zone__body">
                <ul>
                    <li class="has-border-left orange">
                        <h3>
                            <a href="#" class="topic">BẢO HIỂM XÃ HỘI </a>

                        </h3>
                        <div class="number">464</div>
                    </li>

                    <li class="has-border-left yellow">
                        <h3>
                            <a href="#" class="topic">THI QUỐC GIA </a>

                        </h3>
                        <div class="number">955</div>
                    </li>

                    <li class="has-border-left turquoise">
                        <h3>
                            <a href="#" class="topic">CẤM DẠY THÊM </a>

                        </h3>
                        <div class="number">425</div>
                    </li>

                    <li class="has-border-left orange">
                        <h3>
                            <a href="#" class="topic">TIẾNG DÂN </a>

                        </h3>
                        <div class="number">1957</div>
                    </li>

                    <li class="has-border-left purple">
                        <h3>
                            <a href="#" class="topic">LẠM THU </a>

                        </h3>
                        <div class="number">489</div>
                    </li>

                    <li class="has-border-left yellow">
                        <h3>
                            <a href="#" class="topic">GƯƠNG SÁNG CÔ THẦY </a>

                        </h3>
                        <div class="number">548</div>
                    </li>

                    <li class="has-border-left purple">
                        <h3>
                            <a href="#" class="topic">ĐỔI MỚI GIÁO DỤC PHỔ THÔNG </a>

                        </h3>
                        <div class="number">1571</div>
                    </li>

                    <li class="has-border-left lime">
                        <h3>
                            <a href="#" class="topic">Tư vấn pháp luật </a>

                        </h3>
                        <div class="number">
                            473
                        </div>
                    </li>

                    <li class="has-border-left yellow">
                        <h3>
                            <a href="#" class="topic">Hội thảo tọa đàm chính sách </a>

                        </h3>
                        <div class="number">146</div>
                    </li>

                    <li class="has-border-left purple">
                        <h3>
                            <a href="#" class="topic">Thi tốt nghiệp trung học phổ
                                <br />
                                thông và tuyển sinh đại học </a>

                        </h3>
                        <div class="number">661</div>
                    </li>
                </ul>
            </div>
        </div>

    </div>




    <div class="col-sm-5" id="content">
        <div id="top-left">
            <div class="flexslider">
                <div id="slider">
                    <a href="#">
                        <img src="../../img/a4.jpg" style="width: 100%;height: auto;" border="0" />
                    </a><a href="#">
                        <img id="Right1_Slide1_rptAdv_ctl00_imgImage" src="../../img/a2.jpg" style="width: 100%;height: auto;" border="0" />
                    </a><a href="#">
                        <img id="Right1_Slide1_rptAdv_ctl01_imgImage" src="../../img/a1.jpg" style="width: 100%;height: auto;" border="0" />
                    </a><a href="#">
                        <img id="Right1_Slide1_rptAdv_ctl02_imgImage" src="../../img/a3.jpg" style="width: 100%;height: auto;" border="0" />
                    </a>
                    <a href="#">
                        <img id="Right1_Slide1_rptAdv_ctl03_imgImage" src="../../img/a4.jpg" style="width: 100%;height: auto;" border="0" />
                    </a><a href="#">
                        <img id="Img1" src="../../img/a1.jpg" style="width: 100%;height: auto;" border="0" />
                    </a><a href="#">
                        <img id="Img2" src="../../img/a3.jpg" style="width: 100%;height: auto;" border="0" />
                    </a>
                    <a href="#">
                        <img id="Img3" src="../../img/a4.jpg" style="width: 100%;height: auto;" border="0" />
                    </a>
                </div>
                <script>
                    autoSlider();
                </script>
            </div>
        </div>
        <div class="tieude">
            <a href="#">
                <h3>Khoe bảng điểm con: phụ huynh cũng là nạn nhân của xã hội trọng bằng cấp </h3>
            </a>
            <div class="col-sm-2">
                <img src="../../img/bang-diem-348.jpeg" style='max-width: 80px; max-height: 80px;' />
            </div>
            <div class="col-sm-10">
                <div class="sumary">
                    GDVN- Chị H.N., phụ huynh của trường mầm non Ngôi Nhà Hạnh Phúc, thành phố Thủ Đức, Thành phố Hồ Chí Minh bức xúc vì con mình bị bêu xấu trong lớp học.
                </div>
            </div>
        </div>
        <br />
        <div class="tieude">
            <a href="#">
                <h3>Không phải thầy cô nào cũng "đi sếp" dịp Tết </h3>
            </a>
            <div class="col-sm-2">
                <img src="../../img/minhhoa-9200.jpg" style='max-width: 80px; max-height: 80px;' />
            </div>
            <div class="col-sm-10">
                <div class="sumary">
                    GDVN- Những người không được ban giám hiệu ưu ái, không có cơ hội dạy thêm, thăng tiến  mà họ đã yên ổn công việc thì ít khi đến tặng quà, chúc Tết lãnh đạo của mình.
                </div>
            </div>
        </div>
    </div>


    <div class="col-sm-2" id="sidebarRight">

        <div class="sidebar">
            <p class="sidebar-head">THÔNG TIN CẦN BIẾT</p>
            <div class="form-group" style="margin-left: 10px;">
                <img src="../../img/sidebar/1.jpg" style='width: 100%;height: auto;' />

                <p><a href="#">VinFuture công bố tiêu chí giải thưởng  và  nhận đề cử trên phạm vi toàn cầu</a></p>
            </div>


            <div class="form-group">

                <div class="col-sm-6">

                    <img src="../../img/sidebar/2.jpg" style="width:100%; height: auto;" />
                    <p><a href="#">Ngân hàng đầu tiên trong Big4 hỗ trợ khách hàng trên Zalo</a></p>
                </div>
                <div class="col-sm-6">

                    <img src="../../img/sidebar/3.jpg" style="width: 100%; height: auto;" />
                    <p><a href="#">EVNNPC: Triển khai các biện pháp cấp bách phòng chống dịch bệnh Covid-19</a></p>
                </div>

            </div>
            <div class="form-group">

                <div class="col-sm-6">

                    <img src="../../img/sidebar/4.jpg" style="width: 100%; height: auto;" />

                    <p><a href="#">Tập đoàn TH tặng 201.600 ly sữa tươi sạch và các loại đồ uống góp sức chống dịch</a></p>

                </div>
                <div class="col-sm-6">

                    <img src="../../img/sidebar/5.jpg" style="width: 100%; height: auto;" />

                    <p><a href="#">Ngày 31/1, chính thức khởi công Bệnh viện Dã chiến thứ ba tại Hải Dương</a></p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
