<%@include file="/common/taglib.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="customerListUrl" value="/admin/customer-list"/>
<html>
<head>
    <title>Danh sách khách hàng</title>
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
          Danh Sách khách Hàng
          <small>
            <i class="ace-icon fa fa-angle-double-right"></i>
            overview &amp; stats
          </small>
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
            <form:form  id="listForm" action='${customerListUrl}' method="get" modelAttribute="modalSearch">
                <div class="row">
                    <div class="form-group">
                      <div class="col-xs-12">
                        <div class="col-xs-4">
                          <label class="name">Tên Khách Hàng</label>
                          <form:input path="fullname" class="form-control"/>
                        </div>
                        <div class="col-xs-4">
                          <label class="name">Di Động</label>
                          <form:input path="phone" class="form-control"/>
                        </div>
                        <div class="col-xs-4">
                          <label class="name">Email</label>
                          <form:input path="email" class="form-control"/>
                        </div>
                      </div>
                    </div>
                    <div class="form-group">
                      <div class="col-xs-12">
                        <div class="col-xs-4" style="margin-bottom: 15px;">
                          <label class="name">Chọn nhân viên phụ trách</label>
                          <form:select path="managementStaff" class="form-control">
                                <form:option value="">---Chọn nhân viên---</form:option>
                                  <c:forEach items="${listStaffs}" var="it">
                                    <form:option value="${it.key}" >${it.value}</form:option>
                                  </c:forEach>
                          </form:select>
                        </div>
                        <div class="col-xs-12">
                          <button class="btn btn-danger" id="btnSearchCustomer">
                            <i class="ace-icon fa fa-search bigger-120 "></i>
                            Tìm Kiếm
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
          <a href="/admin/customer-edit"><button class="btn btn-info" ><i class="fa-solid fa-person-circle-plus bigger-120"></i></button></a>
          <button class="btn btn-danger" id="btnDeleteCustomers" title="xóa khách hàng s"><i class="fa-solid fa-person-circle-minus bigger-120"></i></button>
        </div>
      </div>
      <!--end Tìm kiếm -->
      <!-- Bảng danh sách -->
      <div class="row" style="margin-top: 70px;">
        <div class="col-xs-12" bis_skin_checked="1">
          <display:table name="model.listResult" cellspacing="0" cellpadding="0"
                         requestURI="${customerListUrl}" partialList="true" sort="external"
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
            <display:column headerClass="text-left" property="fullname" title="Tên Khách Hàng"/>
            <display:column headerClass="text-left" property="phone" title="Số điện thoại"/>
            <display:column headerClass="text-left" property="email" title="Email"/>
            <display:column headerClass="text-left" property="demand" title="Nhu Cầu"/>
            <display:column headerClass="text-left" property="createdBy" title="Người tạo"/>
            <display:column headerClass="text-left" property="createdDate" title="Ngày tạo"/>
            <display:column headerClass="text-left" property="status" title="Tình trạng"/>
            <display:column headerClass="col-actions" title="Thao tác">
              <div class="hidden-xs hidden-xs btn-group" bis_skin_checked="1">
                <!-- Nút giao tòa nhà -->
                <button class="btn btn-xs btn-success" title="Giao khách hàng" onclick="assingmentCustomer(${tableList.id})">
                  <i class="fa-solid fa-person-circle-check bigger-120"></i>
                </button>
                <a href="/admin/customer-edit-${tableList.id}" class="btn btn-xs btn-info">
                  <i class="ace-icon fa fa-pencil bigger-120"></i>
                </a>
                <button class="btn btn-xs btn-danger" title="Xóa khách hàng" onclick="deleteCustomer(${tableList.id})">
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
<div class="modal fade" id="assingmentCustomerModal" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Danh Sách Nhân Viên</h5>
        <button type="button" class="close" data-dismiss="modal" style="margin-top: -27px;">&times;</button>
      </div>
      <div class="modal-body">
        <table class="table table-striped table-bordered table-hover" style="text-align: center;"
               id="staffList">
          <thead>
          <tr>
            <th style="text-align: center;">Chọn</th>
            <th style="text-align: center;">Tên Nhân Viên</th>
          </tr>
          </thead>
          <tbody class="table-group-divider">

          </tbody>
        </table>
        <input type="hidden" id="customerId">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="btnAssingmentCustomer">Giao Khách Hàng</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
      </div>
    </div>
  </div>
</div>

<!-- Tìm kiếm js  -->
<script>
  $('#btnSearchCustomer').click(function (e) {
    e.preventDefault();
    console.log("ok") ;
    $('#listForm').submit();
  })
</script>
<%--Xây dựng hàm xóa --%>
<script>
  function deleteCustomer(Id){
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
        deleteCustomers(Id) ;
      }else if(res.dismiss == 'cancel'){
        console.log('cancel');
      }
    });
    //deleteBuildings(Id) ;
  }
  $('#btnDeleteCustomers').click(function (e) {
    e.preventDefault();
    // tìm cái nào checkboxx là checked thì sẽ lấy value
    var customerids = $('#tableList').find('tbody input[type=checkbox]:checked').map(function () {
      return $(this).val();
    }).get();
    if (customerids.length === 0) {
      swal("Thông báo", "Vui lòng chọn ít nhất một khách hàng để xóa.", "warning");
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
          deleteCustomers(customerids);
        }else if(res.dismiss == 'cancel'){
          console.log('cancel');
        }
      });
    }

  })
  // xây hàm ajax chung cho xóa hết và xóa 1 cái
  function deleteCustomers(data){
    $.ajax({
      type: "DELETE",
      url :"/api/customer/" + data,
      data : JSON.stringify(data),
      contentType :"application/json",
      dataType :"JSON",
      success : function(respond, status, xhr){
        if (xhr.status === 200 || xhr.status === 204) {
          swal({
            title: "Xóa thành công!",
            text: "Khách hàng đã được xóa.",
            icon: "success"
          }).then(() => {
            window.location.href = "/admin/customer-list"; // Chuyển hướng
          });
        }
      },
      error :function(respond){
        console.log(respond) ;

      },
    })
  }
// Xây dựng hàm load nhân viên và giao nhân viên ở đây
  function  assingmentCustomer(customerid){
    $('#assingmentCustomerModal').modal() ;
    loadStaff(customerid) ;
    // gắn biến để khi gửi về có customerid
    $('#customerId').val(customerid);
  }
  function loadStaff(customerid){
    $.ajax({
      type: "Get",
      url :"/api/customer/" + customerid +"/staffs",
      data : JSON.stringify(customerid),
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
        window.location.href ="<c:url value="/admin/customer-list?message=errol" />" ;
      },
    })
  }
  // viết API giao khách hàng cho nhân viên quản lý
  $('#btnAssingmentCustomer').click(function (e){
        e.preventDefault();
        var data = {};
        data['customerId'] = $('#customerId').val();
        // tìm cái nào checkboxx là checked thì sẽ lấy value
        var staffs = $('#staffList').find('tbody input[type=checkbox]:checked').map(function () {
          return $(this).val();
        }).get();

        data['staffs'] = staffs;
        if(data['staffs'] !=''){
          assignmentStaffCustomer(data) ;
        }else{
          swal("Thông báo", "Vui lòng chọn ít nhất một nhân vin để giao.", "warning");
        }
  }) ;
  function assignmentStaffCustomer(data){
    $.ajax({
      type: "POST",
      url :"/api/customer" + '/assignment',
      data : JSON.stringify(data),
      contentType :"application/json",
      dataType :"JSON",
      success : function(respond,status, xhr){
        if (xhr.status === 200 || xhr.status === 204) {
          swal({
            title: "Giao Thành Công!",
            text: "Các khách hàng đã được giao.",
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
</body>
</html>
