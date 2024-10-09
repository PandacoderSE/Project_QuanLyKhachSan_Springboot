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
          <button class="btn btn-info"><i class="fa-solid fa-person-circle-plus bigger-120"></i></button>
          <button class="btn btn-danger"><i class="fa-solid fa-person-circle-minus bigger-120"></i></button>
        </div>
      </div>
      <!--end Tìm kiếm -->
      <!-- Bảng danh sách -->
      <div class="row" style="margin-top: 70px;">
        <div class="col-xs-12" bis_skin_checked="1">
          <table id="simple-table" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
              <th class="center">
                <label class="pos-rel">
                  <input type="checkbox" class="ace">
                  <span class="lbl"></span>
                </label>
              </th>
              <th>Tên Khách Hàng</th>
              <th>Di động</th>
              <th>Email</th>
              <th>Nhu Cầu</th>
              <th>Người thêm</th>
              <th>Ngày thêm</th>
              <th>Tình trạng</th>
              <th>Thao Tác</th>
            </tr>
            </thead>

            <tbody>
          <c:forEach var="item" items="${listCustomer}">
            <tr>
              <td class="center">
                <label class="pos-rel">
                  <input type="checkbox" class="ace" value="${item.id}">
                  <span class="lbl"></span>
                </label>
              </td>
                  <td>${item.fullname}</td>
                  <td>${item.phone}</td>
                  <td>${item.email}</td>
                  <td>${item.demand}</td>
                  <td>${item.createdBy}</td>
                  <td>${item.createdDate}</td>
                  <td>${item.status}</td>
              <td>
                <div class="hidden-sm hidden-xs btn-group" bis_skin_checked="1">
                  <button class="btn btn-xs btn-success" title="Giao khách hàng" onclick="assingmentBuilding(1)">

                    <i class="fa-solid fa-person-circle-check bigger-120"></i>
                  </button>
                  <a href="/admin/customer-edit"><button class="btn btn-xs btn-info">
                    <i class="ace-icon fa fa-pencil bigger-120"></i>
                  </button></a>


                  <button class="btn btn-xs btn-danger">
                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                  </button>
                </div>

              </td>
            </tr>
          </c:forEach>
            </tbody>
          </table>
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
          <tr>
            <td><input type="checkbox" class="ace" id="checkbox_1" value="1">
              <span class="lbl"></span></td>
            <td>Nguyễn Văn A</td>
          </tr>
          <tr>
            <td><input type="checkbox" class="ace" id="checkbox_2" value="2">
              <span class="lbl"></span></td>
            <td>Trần Văn C</td>
          </tr>
          </tbody>
        </table>
        <input type="hidden" id="buildingId" value="1">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="btnAssingmentBuilding">Giao Tòa Nhà</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
      </div>
    </div>
  </div>
</div>
<script>
  function assingmentBuilding(buildingId) {
    $('#assingmentBuildingModal').modal();
  }
  $('#btnAssingmentBuilding').click(function (e) {
    e.preventDefault();
    var data = {};
    data['buildingid'] = $('#buildingId').val();
    // tìm cái nào checkboxx là checked thì sẽ lấy value
    var staffs = $('#staffList').find('tbody input[type=checkbox]:checked').map(function () {
      return $(this).val();
    }).get();

    data['staffs'] = staffs;
    console.log("ok");


  })
</script>
<!-- Tìm kiếm js  -->
<script>
  $('#btnSearchCustomer').click(function (e) {
    e.preventDefault();
    console.log("ok") ;
    $('#listForm').submit();
  })
</script>
</body>
</html>
