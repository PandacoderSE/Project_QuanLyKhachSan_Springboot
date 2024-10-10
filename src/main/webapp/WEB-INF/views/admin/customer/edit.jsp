<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="customerEditURL" value="/admin/customer-edit"/>
<html>
<head>
    <title>Sửa thông tin khách hàng </title>
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
                <h1 style="font-weight: bold;">
                    Thông tin khách hàng
                </h1>
            </div><!-- /.page-header -->
            <div class="row" style="font-family: 'Times New Roman', Times, serif;">
                <div class="col-xs-12">
                    <form:form action='${customerEditURL}' method="post" modelAttribute="modalAdd" id="form_edit">
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Tên khách hàng</label>
                            <div class="col-xs-9">
                                <form:input path="fullname" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Số điện thoại</label>
                            <div class="col-xs-9">
                                <form:input path="phone" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Email</label>
                            <div class="col-xs-9">
                                <form:input path="email" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Tên công ty</label>
                            <div class="col-xs-9">
                                <form:input path="companyName" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Nhu cầu</label>
                            <div class="col-xs-9">
                                <form:input path="demand" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Tình trạng</label>
                            <div class="col-xs-9">
                                <form:input path="status" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group" style="text-align: center;">
                            <c:if test="${empty modalAdd.id}">
                                <button type="button" class="btn btn-primary" data-toggle="button"
                                        style="font-size: 23px;" id="btnAddorUpdateCustomer">Thêm Khách hàng</button>
                                <button type="button"  id="btnHuy" class="btn btn-primary" data-toggle="button"
                                        style="margin-left: 15px; font-size: 23px;">Hủy Thao Tác</button>
                                </div>
                            </c:if>
                            <c:if test="${not empty modalAdd.id}">
                                <button type="button" class="btn btn-primary" data-toggle="button"
                                        style="font-size: 23px;" id="btnAddorUpdateCustomer">Cập nhật Khách Hàng</button>
                                <button type="button" id="btnHuy" class="btn btn-primary" data-toggle="button"
                                        style="margin-left: 15px; font-size: 23px;">Hủy Thao Tác</button>
                                </div>
                                </c:if>
                            <form:hidden path="id" id="customerId"/>
                    </form:form>
                </div>
            </div>
        </div>
    <c:if test="${not empty TransactionType}">
        <c:forEach items="${TransactionType}" var="item">
            <div class="page-header">
                <h1 style="font-weight: bold; margin:0px 0px 15px 10px">${item.value}</h1>
                <hr style="font-weight: bold;">
                <button class="btn btn-lg btn-success" style=" margin-left: 10px ; margin-bottom: 10px">
                    <i class="fa-solid fa-cart-plus"></i>
                    Add
                </button>
                <div class="col-xs-12" bis_skin_checked="1">
                    <table id="simple-table" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th>Ngày Tạo</th>
                            <th>Người Tạo</th>
                            <th>Chi tiết giao dịch</th>
                            <th>Thao Tác</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${listTranById}" var="itemList">
                            <c:if test="${item.key == itemList.code}">
                                <td>${itemList.createdDate}</td>
                                <td>${itemList.createdBy}</td>
                                <td>${itemList.note}</td>
                                <td>
                                    <button class="btn btn-xs btn-danger">
                                        <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                    </button>

                                </td>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </c:forEach>
    </c:if>


        <!-- PAGE CONTENT ENDS -->
    </div><!-- /.page-content -->
</div>
<script>
    $('#btnAddorUpdateCustomer').click(function (){
        var data = {} ;
        var formData = $('#form_edit').serializeArray();
        console.log(formData) ;
        $.each(formData,function (k,v){
            data["" +v.name + ""] = v.value ;
        }) ;
        addorupdate(data) ;
    })
    function addorupdate(data){
        $.ajax({
            type :"POST",
            url : "/api/customer",
            data : JSON.stringify(data),
            contentType :"application/json",
            dataType:"JSON",
            success:function (respond,status, xhr) {
                if(xhr.status === 200 || xhr.status === 204){
                   swal({
                       title : "Thông báo",
                       icon :"success",
                       text :"Bạn Đã Thêm Hoặc Cập Nhật Thành Công",
                       confirmButtonText: "OK",
                       confirmButtonClass: "btn btn-success"
                   })
                }
            },
            error : function (respond) {
                console.log("fail") ;
            }

        })
    }
    $('#btnHuy').click(function (){
        window.location.href="/admin/customer-list" ;
    })
</script>
</body>
</html>
