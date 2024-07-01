<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@include
file="/common/taglib.jsp" %>
<c:url var="buildingAPI" value="/api/building" />
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
              ace.settings.check("breadcrumbs", "fixed");
            } catch (e) {}
          </script>

          <ul class="breadcrumb">
            <li>
              <i class="ace-icon fa fa-home home-icon"></i>
              <a href="#">Home</a>
            </li>
            <li class="active">Dashboard</li>
          </ul>
          <!-- /.breadcrumb -->
        </div>

        <div class="page-content">
          <div class="page-header">
            <h1>Sửa hoặc thêm tòa nhà</h1>
          </div>
          <!-- /.page-header -->

          <div class="row">
            <div class="col-xs-12"></div>
          </div>

          <!-- Bảng danh sách -->
          <div class="row" style="font-family: 'Times New Roman', Times, serif">
            <form:form modelAttribute="buildingEdit" id="listForm" method="GET">
              <div class="col-xs-12">
                <div class="form-group">
                  <label class="col-xs-3">Tên tòa nhà</label>
                  <div class="col-xs-9">
                    <form:input class="form-control" path="name" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Quận</label>
                  <div class="col-xs-2">
                    <label class="name">Quận</label>
                    <form:select class="form-control" path="district">
                      <form:option value="">--Chọn Quận--</form:option>
                      <form:options items="${dictricts}" />
                    </form:select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Phường</label>
                  <div class="col-xs-9">
                    <form:input
                      class="form-control"
                      type="text"
                      id="ward"
                      path="ward"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Đường</label>
                  <div class="col-xs-9">
                    <form:input
                      class="form-control"
                      type="text"
                      id="street"
                      path="street"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Kết cấu</label>
                  <div class="col-xs-9">
                    <input
                      class="form-control"
                      type="text"
                      id="structure"
                      name="structure"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Số tầng hầm</label>
                  <div class="col-xs-9">
                    <form:input
                      class="form-control"
                      type="number"
                      id="numberofbasement"
                      path="numberOfBasement"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Diện tích sàn</label>
                  <div class="col-xs-9">
                    <form:input
                      class="form-control"
                      type="number"
                      id="floorarea"
                      path="floorArea"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Hướng</label>
                  <div class="col-xs-9">
                    <form:input
                      class="form-control"
                      type="text"
                      id="direction"
                      path="floorArea"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Hạng</label>
                  <div class="col-xs-9">
                    <form:input
                      class="form-control"
                      type="text"
                      id="level"
                      path="level"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Diện tích thuê</label>
                  <div class="col-xs-9">
                    <form:input
                      class="form-control"
                      type="text"
                      id="rentarea"
                      path="rentArea"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Giá thuê</label>
                  <div class="col-xs-9">
                    <form:input
                      class="form-control"
                      type="number"
                      id="rentprice"
                      path="rentPrice"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Mô tả giá</label>
                  <div class="col-xs-9">
                    <input
                      class="form-control"
                      type="text"
                      id="rentpricedescription"
                      name="rentpricedescription"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Phí dịch vụ</label>
                  <div class="col-xs-9">
                    <input
                      class="form-control"
                      type="text"
                      id="service_fee"
                      name="service_fee"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Phí ô tô</label>
                  <div class="col-xs-9">
                    <input
                      class="form-control"
                      type="text"
                      id="car_fee"
                      name="car_fee"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Phí mô tô</label>
                  <div class="col-xs-9">
                    <input
                      class="form-control"
                      type="text"
                      id="motorbike_fee"
                      name="motorbike_fee"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Phí ngoài giờ</label>
                  <div class="col-xs-9">
                    <input
                      class="form-control"
                      type="text"
                      id="overtime_fee"
                      name="overtime_fee"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Tiền điện</label>
                  <div class="col-xs-9">
                    <input
                      class="form-control"
                      type="text"
                      id="electricity_fee"
                      name="electricity_fee"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Đặt cọc</label>
                  <div class="col-xs-9">
                    <input
                      class="form-control"
                      type="text"
                      id="deposit"
                      name="deposit"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Thanh toán</label>
                  <div class="col-xs-9">
                    <input
                      class="form-control"
                      type="text"
                      id="payment"
                      name="payment"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Thời hạn thuê</label>
                  <div class="col-xs-9">
                    <input
                      class="form-control"
                      type="text"
                      id="rental_period"
                      name="rental_period"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Thời gian trang trí</label>
                  <div class="col-xs-9">
                    <input
                      class="form-control"
                      type="text"
                      id="decoration_time"
                      name="decoration_time"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Tên quản lý</label>
                  <div class="col-xs-9">
                    <input
                      class="form-control"
                      type="text"
                      id="manager_name"
                      name="manager_name"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">SĐT quản lý</label>
                  <div class="col-xs-9">
                    <input
                      class="form-control"
                      type="text"
                      id="manager_phone"
                      name="manager_phone"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Phí môi giới</label>
                  <div class="col-xs-9">
                    <input
                      class="form-control"
                      type="text"
                      id="broker_fee"
                      name="broker_fee"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Loại tòa nhà</label>
                  <div class="col-xs-9">
                    <form:checkboxes
                      items="${buildingType}"
                      path="typeCode"
                    ></form:checkboxes>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Ghi chú</label>
                  <div class="col-xs-9">
                    <textarea
                      class="form-control"
                      id="notes"
                      name="notes"
                    ></textarea>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3">Hình đại diện</label>
                  <div class="col-xs-9">
                    <input
                      type="file"
                      class="form-control"
                      id="avatar"
                      name="avatar"
                    />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-xs-3"></label>
                  <div class="col-xs-9">
                    <c:if test="${not empty buildingEdit.id}">
                      <button
                        type="button"
                        class="btn btn-primary"
                        id="btnAddOrUpdateBuilding"
                      >
                        Cập nhật toàn nhà
                      </button>
                      <button type="reset" class="btn btn-default">Hủy</button>
                    </c:if>
                    <c:if test="${empty buildingEdit.id}">
                      <button
                        type="button"
                        class="btn btn-primary"
                        id="btnAddOrUpdateBuilding"
                      >
                        Thêm toàn nhà
                      </button>
                      <button
                        type="reset"
                        class="btn btn-default"
                        id="btnCancel"
                      >
                        Hủy
                      </button>
                    </c:if>
                  </div>
                </div>
                <form:hidden path="id" id="buildingId" />
              </div>
            </form:form>
          </div>
        </div>
        <!-- /.page-content -->
      </div>
      <!-- /.main-content -->
      <a
        href="#"
        id="btn-scroll-up"
        class="btn-scroll-up btn btn-sm btn-inverse"
      >
        <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
      </a>
    </div>
    <!-- /.main-container -->

    <script>
      // const fetchApi = async (url, data) => {
      //   const response = await fetch(url, {
      //     method: "POST",
      //     headers: {
      //       "Content-Type": "application/json",
      //     },
      //     body: JSON.stringify(data),
      //   });

      //   if (!response.ok) {
      //     throw new Error(`HTTP error! status: ${response.status}`);
      //   }

      //   return response.json();
      // };

      // const url = "http://localhost:8081/admin/building";
      // const data = {
      //   // Điền dữ liệu cần gửi vào đây
      // };

      // fetchApi(url, data)
      //   .then((result) => {
      //     console.log("Success", result);
      //   })
      //   .catch((error) => {
      //     console.error("Failed", error);
      //   });

      const API_DOMAIN = "http://localhost:8081";

      const post = async (path, options) => {
        const response = await fetch(API_DOMAIN + path, {
          method: "POST",
          headers: {
            Accept: "application/json",
            "Content-Type": "application/json",
          },
          body: JSON.stringify(options),
        });
        const result = await response.json();
        return result;
      };

      // createAnswer = async (options) => {
      //   const result = await post(`answers`, options);
      //   return result;
      // };

      // let options = {
      //   userId: parseInt(getCookie("id")),
      //   topicId: params.id,
      //   answers: selectedAnswers,
      // };
      const btnAddOrUpdateBuilding = document.querySelector(
        "#btnAddOrUpdateBuilding"
      );
      let data = {};
      let typeCode = [];
      btnAddOrUpdateBuilding.addEventListener("click", async () => {
        //const formData = document.querySelector("#listForm");
        const formData = new FormData(document.querySelector("#listForm"));

        formData.forEach((value, key) => {
          if (key !== "typeCode") {
            data[key] = value;
          } else {
            typeCode.push(value);
          }
        });

        data["typeCode"] = typeCode;
        if (typeCode != "") {
          console.log(data);
          const response = await post("${buildingAPI}", data);
          console.log(response);
        } else {
          const buildingListUrl =
            '<c:url value="/admin/building-edit?typeCode=require" />';

          window.location.href = buildingListUrl;
        }
      });

      // $.ajax({
      //   type: "POST",
      //   url: "http://localhost:8081/admin/building",
      //   data: JSON.stringify(data),
      //   contentType: "application/json",
      //   dataType: "JSON",
      //   success: function (respond) {
      //     console.log("Success");
      //   },
      //   error: function (respond) {
      //     console.log("failed");
      //     console.log(respond);
      //   },
      // });

      const btnCancel = document.querySelector("#btnCancel");
      btnCancel.addEventListener("click", () => {
        window.location.href = "/admin/building-list";
      });
    </script>
  </body>
</html>
