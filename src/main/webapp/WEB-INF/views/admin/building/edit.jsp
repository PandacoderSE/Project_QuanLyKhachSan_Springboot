<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingEditUrl" value="/admin/building-edit"/>
<html>
<head>
    <title>Thêm tòa nhà</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {}
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Home</a>
                </li>
                <li class="active">Thêm tòa nhà</li>
            </ul><!-- /.breadcrumb -->
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>
                    Thêm tòa nhà
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        overview &amp; stats
                    </small>
                </h1>
            </div><!-- /.page-header -->
            <div class="row" style="font-family: 'Times New Roman', Times, serif;">
                <div class="col-xs-12">
                    <form:form action='${buildingEditUrl}' method="post" modelAttribute="modelEdit" id="form_edit">
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Tên Tòa Nhà</label>
                            <div class="col-xs-9">
                                <form:input path="name" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group" style="display: flex;">
                            <label class="col-xs-3 title_text" style="margin-right: 10px;">Quận Hiện Có</label>
                            <div class="col-xs-3">
                                <form:select path="district" class="form-control">
                                    <form:option value="">Chọn quận</form:option>
                                    <%--                                                                ở đây dùng options thay cho foreach cũng đc--%>
                                    <form:options items="${listDistricts}"/>
                                </form:select>
                            </div>

                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Phường</label>
                            <div class="col-xs-9">
                                <form:input path="ward" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Đường</label>
                            <div class="col-xs-9">
                                <form:input path="street" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Kết Cấu</label>
                            <div class="col-xs-9">
                                <form:input path="structure" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Số Tầng Hầm</label>
                            <div class="col-xs-9">
                                <form:input path="numberOfBasement" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Diện Tích Sàn</label>
                            <div class="col-xs-9">
                                <form:input path="floorArea" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Hướng</label>
                            <div class="col-xs-9">
                                <form:input path="direction" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Hạng</label>
                            <div class="col-xs-9">
                                <form:input path="level" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Diện Tích Thuê</label>
                            <div class="col-xs-9">
                                <form:input path="rentArea" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Giá Thuê</label>
                            <div class="col-xs-9">
                                <form:input path="rentPrice" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Mô Tả Giá</label>
                            <div class="col-xs-9">
                                <form:input path="rentPriceDescription" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Phí Dịch Vụ</label>
                            <div class="col-xs-9">
                                <form:input path="serviceFee" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Phí ô tô</label>
                            <div class="col-xs-9">
                                <form:input path="carFee" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Phí Mô tô</label>
                            <div class="col-xs-9">
                                <form:input path="motoFee" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Phí ngoài giờ</label>
                            <div class="col-xs-9">
                                <form:input path="overtimeFee" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Tiền Điện</label>
                            <div class="col-xs-9">
                                <form:input path="electricityFee" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Đặt Cọc</label>
                            <div class="col-xs-9">
                                <form:input path="deposit" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Thanh Toán</label>
                            <div class="col-xs-9">
                                <form:input path="payment" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Thời Gian Thuê</label>
                            <div class="col-xs-9">
                                <form:input path="rentTime" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Thời Gian Trang Trí</label>
                            <div class="col-xs-9">
                                <form:input path="decorationTime" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Tên Quản Lý</label>
                            <div class="col-xs-9">
                                <form:input path="managerName" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">SĐT Quản Lý</label>
                            <div class="col-xs-9">
                                <form:input path="managerPhone" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Phí Môi Giới</label>
                            <div class="col-xs-9">
                                <form:input path="brokerageFee" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Loại Tòa Nhà</label>
                            <div class="col-xs-9 ">
                                <form:checkboxes path="typeCode" items="${listTypes}" cssStyle="margin: 20px 0px 10px 10px"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Ghi Chú</label>
                            <div class="col-xs-9">
                                <form:input path="note" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Hình Đại Diện</label>
                            <div class="col-xs-9">
                                <input type="file" name="file" required /><br>
                                <c:if test="${not empty modelEdit.imageName}">
                                    <div>
                                        <span>File đã tải lên: ${modelEdit.imageName}</span><br>
                                        <img src="${pageContext.request.contextPath}/uploads/${modelEdit.imageName}" alt="Uploaded Image" style="max-width: 300px; max-height: 300px;" />
                                    </div>
                                </c:if>

                            </div>
                        </div>
                        <div class="form-group">
<%--                          kiểm tra bằng thẻ if trong JSP--%>
                            <div class="col-xs-9">
                                <c:if test="${not empty modelEdit.id}">
                                    <button type="button" class="btn btn-primary" data-toggle="button" style="font-size: 23px;" id="btnAddOrUpdateBuilding">Cập Nhật Tòa Nhà</button>
                                    <button type="button" class="btn btn-primary" data-toggle="button" style="margin-left: 15px; font-size: 23px;" id="btnHuy">Hủy Thao Tác</button>
                                </c:if>
                                <c:if test="${empty modelEdit.id}">
                                    <button type="button" class="btn btn-primary" data-toggle="button" style="font-size: 23px;" id="btnAddOrUpdateBuilding">Thêm Tòa Nhà</button>
                                    <button type="button" class="btn btn-primary" data-toggle="button" style="margin-left: 15px; font-size: 23px;" id="btnHuy">Hủy Thao Tác</button>
                                </c:if>
                            </div>
                        </div>
<%--                        để check lúc sửa hoặc thêm--%>
                        <form:hidden path="id" id="buildingID"/>
                    </form:form>
                </div>
            </div>
        </div>

        <!-- PAGE CONTENT ENDS -->
    </div><!-- /.page-content -->
</div>

<%-- sử lý js --%>
<script>
    // sử dụng JS lấy data
    <%--$('#btnAddOrUpdateBuilding').click(function() {--%>
    <%--    var data = {};--%>
    <%--    var typecode = [];--%>
    <%--    var formData = $('#form_edit').serializeArray();--%>
    <%--    console.log(formData);--%>
    <%--    $.each(formData, function (i, v) {--%>
    <%--        if (v.name != 'typeCode') {--%>
    <%--            data["" + v.name + ""] = v.value;--%>
    <%--        } else {--%>
    <%--            typecode.push(v.value);--%>

    <%--        }--%>
    <%--    });--%>
    <%--    data['typeCode'] = typecode;--%>
    <%--    if(typecode!= ''){--%>
    <%--        addOrUpdateBuilding(data) ;--%>
    <%--    }else{--%>
    <%--        window.location.href ="<c:url value="/admin/building-edit?typeCode=require" />" ;--%>
    <%--    }--%>
    <%--}) ;--%>
    $('#btnAddOrUpdateBuilding').click(function () {
        var formData = new FormData(); // Tạo đối tượng FormData
        var typecode = [];

        // Lấy tất cả các giá trị từ form (trừ ảnh) và thêm vào formData
        $('#form_edit').find('input, select, textarea').each(function () {
            var input = $(this);

            if (input.attr('type') === 'file') {
                // Nếu là trường file, thêm file vào formData
                if (input[0].files.length > 0) {
                    formData.append(input.attr('name'), input[0].files[0]);
                }
            } else if (input.attr('name') === 'typeCode') {
                // Lưu typeCode vào mảng
                typecode.push(input.val());
            } else {
                // Thêm dữ liệu text thông thường
                formData.append(input.attr('name'), input.val());
            }
        });

        // Thêm typeCode mảng vào formData
        formData.append('typeCode', typecode);

        // Kiểm tra nếu typeCode không rỗng, gửi yêu cầu
        if (typecode.length !== 0) {
            addOrUpdateBuilding(formData);
        } else {
            window.location.href = "<c:url value='/admin/building-edit?typeCode=require' />";
        }
    });
    function addOrUpdateBuilding(data) {
        $.ajax({
            type: "POST",
            url: "/api/building",
            data: data, // Sử dụng FormData đã được tạo ở bước trước
            processData: false,  // Bắt buộc phải là false khi dùng FormData
            contentType: false,  // Bắt buộc phải là false khi dùng FormData
            success: function (response, status, xhr) {
                if (xhr.status === 200 || xhr.status === 204) {
                    console.log("Operation successful");
                    swal({
                        title: "Thành Công",
                        icon: "success",  // Kiểu thông báo (success, error, warning)
                        text: "Bạn Đã Thêm Hoặc Cập Nhật Thành Công",
                        confirmButtonText: "OK",
                        confirmButtonClass: "btn btn-success"
                    });
                }
            },
            error: function (response) {
                console.log(response);
            },
        });
    }


    // function addOrUpdateBuilding(data){
    //     $.ajax({
    //         // type :loại GEt hay post, del ...
    //         type: "POST",
    //         // đặt đường dẫn mong muốn còn với url bên cotrol thì đặt theo trang : bởi vì url luân chuyển với api
    //         url: "/api/building",
    //         data: JSON.stringify(data),
    //         // client -> server thì dùng contenType định dạng
    //         contentType: "application/json",
    //         // server - > client thì dùng DataType định dạng
    //         dataType: "JSON",
    //         success: function (respond,status, xhr) {
    //             if (xhr.status === 200 || xhr.status === 204) {
    //                 console.log("Delete successful");
    //                 swal({
    //                     title: "Thành Công",
    //                     icon: "success",  // Kiểu thông báo (success, error, warning)
    //                     text :"Bạn Đã Thêm Hoặc Cập Nhật Thành Công",
    //                     confirmButtonText: "OK",
    //                     confirmButtonClass: "btn btn-success"
    //                 });
    //             }
    //         },
    //         error: function (respond) {
    //             console.log(respond);
    //         },
    //     })
    // }
        // call API : jQuery AJAX Methods

    // cách hủy thao tác
    $('#btnHuy').click(function (){
        window.location.href = "/admin/building-list" ;
    })
</script>
</body>
</html>
