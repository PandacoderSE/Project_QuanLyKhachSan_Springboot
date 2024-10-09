
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <form class="form-horizontal" role="form" id="form_edit">
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Tên khách hàng</label>
                            <div class="col-xs-9">
                                <input type="text" id="hname" name="name" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Số điện thoại</label>
                            <div class="col-xs-9">
                                <input type="text" id="name" name="name" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Email</label>
                            <div class="col-xs-9">
                                <input type="text" id="ward" name="ward" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Tên công ty</label>
                            <div class="col-xs-9">
                                <input type="text" id="street" name="street" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Nhu cầu</label>
                            <div class="col-xs-9">
                                <input type="text" id="structure" name="structure" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-3 title_text">Tình trạng</label>
                            <div class="col-xs-9">
                                <input type="number" id="numberofbasemen" name="numberofbasemen"
                                       class="form-control">
                            </div>
                        </div>
                        <div class="form-group" style="text-align: center;">
                            <button type="button" class="btn btn-primary" data-toggle="button"
                                    style="font-size: 23px;" id="btnAddBuilding">Thêm Khách hàng</button>
                            <button type="button" class="btn btn-primary" data-toggle="button"
                                    style="margin-left: 15px; font-size: 23px;">Hủy Thao Tác</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="page-header">
            <h1 style="font-weight: bold; margin:0px 0px 15px 10px">
                Chăm sóc khách hàng
            </h1>
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
                    <tr>
                        <td>22/08/2003</td>
                        <td>Nguyễn Văn Mạnh</td>
                        <td>gọi điện tư vấn</td>
                        <td>
                            <button class="btn btn-xs btn-danger">
                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                            </button>

                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="page-header">
            <h1 style="font-weight: bold; margin:0px 0px 15px 10px">
                Chăm sóc khách hàng
            </h1>
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
                    <tr>
                        <td>22/08/2003</td>
                        <td>Nguyễn Văn Mạnh</td>
                        <td>gọi điện tư vấn</td>
                        <td>
                            <button class="btn btn-xs btn-danger">
                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                            </button>

                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>



        <!-- PAGE CONTENT ENDS -->
    </div><!-- /.page-content -->
</div>
</body>
</html>
