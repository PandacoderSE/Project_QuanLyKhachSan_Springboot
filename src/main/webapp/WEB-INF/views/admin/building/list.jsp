
<%@include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="buildingListUrl" value="/admin/building-list"/>
<html>
<head>
    <title>Danh Sách Tòa Nhà</title>

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
                    <li class="active">Dashboard</li>
                </ul><!-- /.breadcrumb -->
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>
                        Danh Sách Tòa Nhà
                        <span>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            overview &amp; stats
                        </span>
                    </h1>
                </div><!-- /.page-header -->
                <!-- Tìm kiếm -->

                <div class="row">
                    <div class="col-xs-12" bis_skin_checked="1">
                        <div class="widget-box" bis_skin_checked="1"
                             style="font-family: 'Times New Roman', Times, serif;">
                            <div class="widget-header" bis_skin_checked="1">
                                <h4 class="widget-title">Tìm Kiếm</h4>
                                <div class="widget-toolbar" bis_skin_checked="1">
                                    <a href="#" data-action="collapse">
                                        <i class="ace-icon fa fa-chevron-up"></i>
                                    </a>

                                    <a href="#" data-action="close">
                                        <i class="ace-icon fa fa-times"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="widget-body" bis_skin_checked="1">
                                <div class="widget-main" bis_skin_checked="1">
<%--                                    code giống php phết -> action : ấy 1 control ddeeer hứng dữ liệu--%>
                                    <form:form   id="listForm" action='${buildingListUrl}' method="get" modelAttribute="modalSearch">
                                        <div class="row">
                                                <div class="form-group">
                                                    <div class="col-xs-12">
                                                        <div class="col-xs-6">
                                                            <label class="name">Tên Tòa Nhà</label>
<%--                                                            <form:input path="name" type="text" class="form-control" id="name" name="name" value="${modalSearch.name}"/>--%>
                                                            <form:input path="name" class="form-control"/>
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <label class="name">Diện Tích Sàn</label>
<%--                                                            <input type="number" class="form-control" name="floorArea" value="${modalSearch.floorArea}">--%>
                                                            <form:input path="floorArea" class="form-control"/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="col-xs-12">
                                                        <div class="col-xs-2">
                                                            <label class="name">Quận Hiện Có</label>
                                                            <form:select path="district" class="form-control">
                                                                <form:option value="">Chọn quận</form:option>
<%--                                                                ở đây dùng options thay cho foreach cũng đc--%>
                                                                <form:options items="${listDistricts}"/>
                                                            </form:select>
                                                        </div>
                                                        <div class="col-xs-5">
                                                            <label class="name">Phường</label>
                                                            <form:input path="ward" class="form-control"/>
                                                        </div>
                                                        <div class="col-xs-5">
                                                            <label class="name">Đường</label>
                                                            <form:input path="street" class="form-control"/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="col-xs-12">
                                                        <div class="col-xs-4">
                                                            <label class="name">Số Tầng Hầm</label>
                                                            <form:input path="numberOfBasement" class="form-control"/>
                                                        </div>
                                                        <div class="col-xs-4">
                                                            <label class="name">Hướng</label>
                                                            <form:input path="direction" class="form-control"/>
                                                        </div>
                                                        <div class="col-xs-4">
                                                            <label class="name">Hạng</label>
                                                            <form:input path="level" class="form-control"/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="col-xs-12">
                                                        <div class="col-xs-3">
                                                            <label class="name">Diện tích từ</label>
                                                            <form:input path="areaFrom" class="form-control"/>
                                                        </div>
                                                        <div class="col-xs-3">
                                                            <label class="name">Diện tích đến</label>
                                                            <form:input path="areaTo" class="form-control"/>
                                                        </div>
                                                        <div class="col-xs-3">
                                                            <label class="name">Giá thuê từ</label>
                                                            <form:input path="rentPriceFrom" class="form-control"/>
                                                        </div>
                                                        <div class="col-xs-3">
                                                            <label class="name">Giá thuê đến</label>
                                                            <form:input path="rentPriceTo" class="form-control"/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="col-xs-12">
                                                        <div class="col-xs-5">
                                                            <label class="name">Tên quản lý</label>
                                                            <form:input path="managerName" class="form-control"/>
                                                        </div>
                                                        <div class="col-xs-5">
                                                            <label class="name">Điện thoại quản lý</label>
                                                            <form:input path="managerPhone" class="form-control"/>
                                                        </div>
                                                        <div class="col-xs-2">
                                                            <label class="name">Chọn nhân viên phụ trách</label>
                                                            <form:select path="staffId" class="form-control">
                                                                <form:option value="">---Chọn nhân viên---</form:option>
                                                                <c:forEach items="${listStaffs}" var="it">
                                                                    <form:option value="${it.key}" >${it.value}</form:option>
                                                                </c:forEach>
                                                            </form:select>
                                                        </div>
                                                        <div class="col-xs-5">
                                                            <form:checkboxes path="typeCode" items="${listTypes}" cssStyle="margin: 20px 0px 10px 10px"/>
                                                        </div>
                                                        <div class="col-xs-12">
                                                            <button class="btn btn-xs btn-danger" id="btnSearchBuilding">
                                                                <i class="ace-icon fa fa-search bigger-120 "></i> Tìm Kiếm
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="button_them_xoa" style="text-align: right; margin-right: 13px;">
                        <a href="/admin/building-edit">
                            <button class="btn btn-info">
                                <i class="fa-solid fa-building-circle-check bigger-120"></i>
                            </button>
                        </a>
                        <button class="btn btn-danger" title="xóa tòa nhà" id="btnDeleteBuildings">
                           <i class="fa-solid fa-building-circle-xmark bigger-120"></i></button>
                    </div>
                </div>
                <!--end Tìm kiếm -->
                <!-- Bảng danh sách -->
                <div class="row" style="margin-top: 70px;">
                    <div class="col-xs-12" bis_skin_checked="1">
                            <display:table name="model.listResult" cellspacing="0" cellpadding="0"
                                           requestURI="${buildingListUrl}" partialList="true" sort="external"
                                           size="${model.totalItems}" defaultsort="2" defaultorder="ascending"
                                           id="tableList" pagesize="${model.maxPageItems}"
                                           export="false"
                                           class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                           style="margin: 3em 0 1.5em;">
                                <display:column title="<fieldset class='form-group'>
                                                                                <input type='checkbox' id='checkAll' class='check-box-element'>
                                                                                </fieldset>" class="center select-cell"
                                                headerClass="center select-cell">
                                    <fieldset>
                                        <input type="checkbox" name="checkList" value="${tableList.id}"
                                               id="checkbox_${tableList.id}" class="check-box-element"/>
                                    </fieldset>
                                </display:column>
                                <display:column headerClass="text-left" property="name" title="Tên Toàn Nhà"/>
                                <display:column headerClass="text-left" property="address" title="Địa Chỉ"/>
                                <display:column headerClass="text-left" property="numberOfBasement" title="Số Tầng Hầm"/>
                                <display:column headerClass="text-left" property="managerName" title="Tên quản lý"/>
                                <display:column headerClass="text-left" property="managerPhoneNumber" title="SDT Quản Lý"/>
                                <display:column headerClass="text-left" property="floorArea" title="Diện tích Sàn"/>
                                <display:column headerClass="text-left" property="emptyArea" title="DT trống"/>
                                <display:column headerClass="text-left" property="rentArea" title="Diện Tích Thuê"/>
                                <display:column headerClass="text-left" property="rentPrice" title="Giá Thuê"/>
                                <display:column headerClass="text-left" property="brokerageFee" title="Trả Trước"/>
                                <display:column headerClass="text-left" property="serviceFee" title="Phí Dịch Vụ"/>
                                <display:column headerClass="col-actions" title="Thao tác">
                                    <div class="hidden-xs hidden-xs btn-group" bis_skin_checked="1">
                                        <!-- Nút giao tòa nhà -->
                                        <button class="btn btn-xs btn-success" title="giao tòa nhà" onclick="assingmentBuilding(${tableList.id})">
                                            <i class="fa-solid fa-building-user bigger-120"></i>
                                        </button>
                                        <!-- Nút chỉnh sửa tòa nhà -->
                                        <a class="btn btn-xs btn-info" href="/admin/building-edit-${tableList.id}" title="sửa tòa nhà">
                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                        </a>
                                        <!-- Nút xóa tòa nhà -->
                                        <button class="btn btn-xs btn-danger" title="xóa tòa nhà" onclick="deleteBuilding(${tableList.id})">
                                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                        </button>
                                    </div>
                                </display:column>
                            </display:table>
                    </div><!-- /.span -->
                </div>
                <!-- end Bảng danh sách -->
            </div>

            <!--End  Tìm kiếm -->

            <!-- PAGE CONTENT ENDS -->
        </div><!-- /.page-content -->
    </div>
<div class="modal fade" id="assingmentBuildingModal" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Danh Sách Nhân Viên</h5>
                <a type="button" class="close" data-dismiss="modal" style="margin-top: -27px;">&times;</a>
            </div>
            <div class="modal-body">
                <table class="table table-striped table-bordered table-hover" style="text-align: center;" id="staffList">
                    <thead>
                    <tr>
                        <th style="text-align: center;">Chọn</th>
                        <th style="text-align: center;">Tên Nhân Viên</th>
                    </tr>
                    </thead>
                    <tbody class="table-group-divider">

                    </tbody>
                </table>
                <input type="hidden" id="buildingId">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="btnAssingmentBuilding">Giao Tòa Nhà</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>

<!-- dùng modal để mở ra -->
<script>
    function assingmentBuilding(buildingId) {
        $('#assingmentBuildingModal').modal();

        loadStaff(buildingId) ;
        // gán giá trị để dùng cho phần giao vì mỗi lần nhấn thì sẽ gán vô luôn id để sau dùng
        $('#buildingId').val(buildingId);
    }
    // function load staff
    function loadStaff(buildingId){
        $.ajax({
            type: "Get",
            url :"/api/building/" + buildingId +"/staffs",
            data : JSON.stringify(buildingId),
            // client -> server thì dùng contenType định dạng
            contentType :"application/json",
            // server - > client thì dùng DataType định dạng
            dataType :"JSON",
            // nếu gét thì kế quả là respond và đem quăng ra view
            success : function(response){
                var row = '' ;
                $.each(response.data , function (index, item){
                    row += '<tr>' ;
                    row += '<td><input type="checkbox" name="check1" value="' + item.staffId + '" ' + item.checked +'></td>' ;
                    row += '<td>' + item.fullName +'</td>' ;
                    row += '</tr>';
                })
                //cách gọi ra bảng theo các lớp
                $('#staffList tbody').html(row) ;
                console.log("Success") ;
            },
            error :function(response){
                console.log(respondse) ;
                window.location.href ="<c:url value="/admin/building-list?message=errol" />" ;
            },
        })
    }
    // xây dựng chức năng giao tòa nhà cho nhân viên quản lý viết api
    $('#btnAssingmentBuilding').click(function (e) {
        e.preventDefault();
        var data = {};
        data['buildingId'] = $('#buildingId').val();
        // tìm cái nào checkboxx là checked thì sẽ lấy value
        var staffs = $('#staffList').find('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();

        data['staffs'] = staffs;
        if(data['staffs'] !=''){
            assignmentStaffBuilding(data) ;
        }else{
            swal("Thông báo", "Vui lòng chọn ít nhất một nhân vin để giao.", "warning");
        }
    })
    function assignmentStaffBuilding(data){
        $.ajax({
            type: "POST",
            url :"/api/building" + '/assignment',
            data : JSON.stringify(data),
            contentType :"application/json",
            dataType :"JSON",
            success : function(respond,status, xhr){
                if (xhr.status === 200 || xhr.status === 204) {
                    swal({
                        title: "Giao Thành Công!",
                        text: "Các building đã được xóa.",
                        icon: "success"
                    })
                }

            },
            error :function(respond){
                console.info("Giao ko thành cồng ")
                console.log(respond) ;
            },
        })
    }
</script>
<!-- Tìm kiếm js  -->
<script>
    $('#btnSearchBuilding').click(function (e) {
        e.preventDefault(); // Ngăn chặn hành vi submit mặc định

        // Loại bỏ input checkbox với name _typeCode nếu không được chọn
        var checkbox = $('input[name="_typeCode"]');
        if (!checkbox.is(':checked')) {
            checkbox.remove(); // Xóa checkbox nếu không được chọn
        }

        $('#listForm').submit(); // Submit form sau khi xử lý
    })
</script>
<%-- api : xoa tòa nahf--%>
<script>
    function deleteBuilding(Id){
            swal({
                title: "Xác nhận xóa",
                text: "Bạn có chắc chắn xóa những dòng đã chọn",
                type: "warning",
                showCancelButton: true,
                confirmButtonText: "Xác nhận",
                cancelButtonText: "Hủy bỏ",
                confirmButtonClass: "btn btn-success",
                cancelButtonClass: "btn btn-danger"
            }).then(function (res) {
                if(res.value){
                    deleteBuildings(Id) ;
                }else if(res.dismiss == 'cancel'){
                    console.log('cancel');
                }
            });
        //deleteBuildings(Id) ;
    }
    $('#btnDeleteBuildings').click(function (e) {
        e.preventDefault();
        // tìm cái nào checkboxx là checked thì sẽ lấy value
        var buildingids = $('#tableList').find('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        if (buildingids.length === 0) {
            swal("Thông báo", "Vui lòng chọn ít nhất một building để xóa.", "warning");
            return; // Nếu không có ID nào được chọn, dừng lại
        }else{
            swal({
                title: "Xác nhận xóa",
                text: "Bạn có chắc chắn xóa những dòng đã chọn",
                type: "warning",
                showCancelButton: true,
                confirmButtonText: "Xác nhận",
                cancelButtonText: "Hủy bỏ",
                confirmButtonClass: "btn btn-success",
                cancelButtonClass: "btn btn-danger"
            }).then(function (res) {
                if(res.value){
                    deleteBuildings(buildingids) ;
                }else if(res.dismiss == 'cancel'){
                    console.log('cancel');
                }
            });
        }

    })
    // xây hàm ajax chung cho xóa hết và xóa 1 cái
    function deleteBuildings(data){
        $.ajax({
            // type :loại GEt hay post, del ...
            type: "DELETE",
            // đặt đường dẫn mong muốn còn với url bên cotrol thì đặt theo trang : bởi vì url luân chuyển với api
            url :"/api/building/" + data,
            data : JSON.stringify(data),
            // client -> server thì dùng contenType định dạng
            contentType :"application/json",
            // server - > client thì dùng DataType định dạng
            dataType :"JSON",
            success : function(respond, status, xhr){
                if (xhr.status === 200 || xhr.status === 204) {
                    swal({
                        title: "Xóa thành công!",
                        text: "Các building đã được xóa.",
                        icon: "success"
                    }).then(() => {
                        window.location.href = "/admin/building-list"; // Chuyển hướng
                    });
                }
            },
            error :function(respond){
                console.log(respond) ;

            },
        })
    }
</script>
</body>
</html>
