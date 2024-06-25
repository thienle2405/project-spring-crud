<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@include
file="/common/taglib.jsp" %>
<c:url var="buildingListURL" value="/admin/building-list" />
<c:url var="buildingAPI" value="/api/building" />
<html>
  <head>
    <title>Danh sách tòa nhà</title>
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
            <h1>
              Danh sách tòa nhà
              <small>
                <i class="ace-icon fa fa-angle-double-right"></i>
                overview &amp; stats
              </small>
            </h1>
          </div>
          <!-- /.page-header -->

          <div class="row">
            <div class="col-xs-12">
              <div class="widget-box ui-sortable-handle">
                <div class="widget-header">
                  <h5 class="widget-title">Tìm kiếm</h5>

                  <div class="widget-toolbar">
                    <a href="#" data-action="collapse">
                      <i class="ace-icon fa fa-chevron-up"></i>
                    </a>
                  </div>
                </div>

                <div class="widget-body">
                  <div class="widget-main">
                    <form:form
                      action="${buildingListURL}"
                      modelAttribute="modelSearch"
                      id="listForm"
                      method="GET"
                    >
                      <div class="row">
                        <div class="col-xs-12">
                          <div class="form-group">
                            <div class="col-xs-12">
                              <div class="col-xs-6">
                                <label class="name">Tên tòa nhà</label>
                                <form:input class="form-control" path="name" />
                              </div>
                              <div class="col-xs-6">
                                <label class="name">Diện tích sàn</label>
                                <input
                                  type="number"
                                  class="form-control"
                                  name="floorArea"
                                  value="${modelSearch.floorArea}"
                                />
                              </div>
                            </div>
                          </div>
                          <div class="form-group">
                            <div class="col-xs-12">
                              <div class="col-xs-2">
                                <label class="name">Quận</label>
                                <form:select
                                  class="form-control"
                                  path="district"
                                >
                                  <form:option value=""
                                    >--Chọn Quận--</form:option
                                  >
                                  <form:options items="${dictricts}" />
                                </form:select>
                              </div>
                              <div class="col-xs-5">
                                <label class="name">Phường</label>
                                <input
                                  type="text"
                                  class="form-control"
                                  name="ward"
                                  value="${modelSearch.ward}"
                                />
                              </div>
                              <div class="col-xs-5">
                                <label class="name">Đường</label>
                                <input
                                  type="text"
                                  class="form-control"
                                  name="street"
                                  value="${modelSearch.street}"
                                />
                              </div>
                            </div>
                          </div>
                          <div class="form-group">
                            <div class="col-xs-12">
                              <div class="col-xs-4">
                                <label class="name">Số tầng hầm</label>
                                <input
                                  type="text"
                                  class="form-control"
                                  name="numberOfBasement"
                                  value="${modelSearch.numberOfBasement}"
                                />
                              </div>
                              <div class="col-xs-4">
                                <label class="name">Hướng</label>
                                <input
                                  type="text"
                                  class="form-control"
                                  name="direction"
                                  value="${modelSearch.direction}"
                                />
                              </div>
                              <div class="col-xs-4">
                                <label class="name">Hạng</label>
                                <input
                                  type="number"
                                  class="form-control"
                                  name="level"
                                  value="${modelSearch.level}"
                                />
                              </div>
                            </div>
                          </div>

                          <div class="form-group">
                            <div class="col-xs-12">
                              <div class="col-xs-3">
                                <label class="name">Diện tích từ</label>
                                <input
                                  type="text"
                                  class="form-control"
                                  name="areaFrom"
                                  value="${modelSearch.areaFrom}"
                                />
                              </div>
                              <div class="col-xs-3">
                                <label class="name">Diện tích đến</label>
                                <input
                                  type="text"
                                  class="form-control"
                                  name="areaTo"
                                  value="${modelSearch.areaTo}"
                                />
                              </div>
                              <div class="col-xs-3">
                                <label class="name">Giá thuê từ</label>
                                <input
                                  type="number"
                                  class="form-control"
                                  name="rentPriceFrom"
                                  value="${modelSearch.rentPriceFrom}"
                                />
                              </div>
                              <div class="col-xs-3">
                                <label class="name">Giá thuê đến</label>
                                <input
                                  type="number"
                                  class="form-control"
                                  name="rentPriceTo"
                                  value="${modelSearch.rentPriceTo}"
                                />
                              </div>
                            </div>
                          </div>

                          <div class="form-group">
                            <div class="col-xs-12">
                              <div class="col-xs-5">
                                <label class="name">Tên quản lý</label>
                                <input
                                  type="text"
                                  class="form-control"
                                  name="managerName"
                                  value="${modelSearch.managerName}"
                                />
                              </div>
                              <div class="col-xs-5">
                                <label class="name">SĐT quản lý</label>
                                <input
                                  type="text"
                                  class="form-control"
                                  name="managerPhone"
                                  value="${modelSearch.managerPhone}"
                                />
                              </div>
                              <div class="col-xs-2">
                                <label class="name">Nhân viên</label>
                                <form:select
                                  class="form-control"
                                  path="staffId"
                                >
                                  <form:option value=""
                                    >---Chọn Nhân Viên---</form:option
                                  >
                                  <form:options items="${listStaffs}" />
                                </form:select>
                              </div>
                            </div>
                          </div>

                          <div class="form-group">
                            <div class="col-xs-12">
                              <div class="col-xs-6">
                                <form:checkboxes
                                  items="${buildingType}"
                                  path="typeCode"
                                ></form:checkboxes>
                              </div>
                            </div>
                          </div>

                          <div class="col-xs-12">
                            <div class="col-xs-6">
                              <button
                                type="button"
                                class="btn btn-danger"
                                id="btnSearchBuilding"
                              >
                                <svg
                                  xmlns="http://www.w3.org/2000/svg"
                                  width="16"
                                  height="16"
                                  fill="currentColor"
                                  class="bi bi-search"
                                  viewBox="0 0 16 16"
                                >
                                  <path
                                    d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85zm-5.301-.595a5.5 5.5 0 1 1 7.778-7.778 5.5 5.5 0 0 1-7.778 7.778z"
                                  />
                                </svg>
                                Tìm kiếm
                              </button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </form:form>
                  </div>
                </div>
              </div>
              <div class="pull-right">
                <a href="/admin/building-edit">
                  <button class="btn btn-info" title="Thêm tòa nhà">
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      width="16"
                      height="16"
                      fill="currentColor"
                      class="bi bi-building-add"
                      viewBox="0 0 16 16"
                    >
                      <path
                        d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v14.5a.5.5 0 0 1-1 0V1H3v14.5a.5.5 0 0 1-1 0V1zM1 5v1h4V5H1zm0 2.5V7h4v-.5H1zm7.5-.5a.5.5 0 0 0 0 1h1v1h1v-1h1a.5.5 0 0 0 0-1h-1V5h-1v1h-1zm0 3a.5.5 0 0 0 0 1h1v1h1v-1h1a.5.5 0 0 0 0-1h-1v-1h-1v1h-1zm0 3a.5.5 0 0 0 0 1h1v1h1v-1h1a.5.5 0 0 0 0-1h-1v-1h-1v1h-1zM3 9v.5h4V9H3zm0 2.5V11h4v.5H3zm0 2.5V14h4v-.5H3zm8-5v1h4v-1h-4zm0 3v1h4v-1h-4z"
                      />
                    </svg>
                  </button>
                </a>
                <button
                  class="btn btn-danger"
                  title="Xóa tòa nhà"
                  id="btnDeleteBuildings"
                >
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="16"
                    height="16"
                    fill="currentColor"
                    class="bi bi-building-dash"
                    viewBox="0 0 16 16"
                  >
                    <path
                      d="M12.5 16a.5.5 0 0 0 .5-.5V15h.5a1 1 0 0 0 1-1V4a1 1 0 0 0-1-1V1a1 1 0 0 0-1-1H4a1 1 0 0 0-1 1v2a1 1 0 0 0-1 1v10a1 1 0 0 0 1 1h.5v.5a.5.5 0 0 0 1 0V15h8v.5a.5.5 0 0 0 .5.5zm-2.5-4v-1h4v1h-4zm-1 0v-1H3v1h6zm-6-2V5h2v5H3zm3 0V5h2v5H6zm3 0V5h2v5H9zm3 0V5h2v5h-2z"
                    />
                  </svg>
                </button>
              </div>
            </div>
          </div>

          <!-- Bảng danh sách -->
          <div class="row">
            <div class="col-xs-12">
              <table
                id="tableList"
                style="margin: 3em 0 1.5em"
                class="table table-striped table-bordered table-hover"
              >
                <thead>
                  <tr>
                    <th class="center">
                      <label class="pos-rel">
                        <input
                          type="checkbox"
                          class="ace"
                          name="checkList"
                          value=""
                        />
                        <span class="lbl"></span>
                      </label>
                    </th>
                    <th>Tên tòa nhà</th>
                    <th>Địa chỉ</th>
                    <th>Số tầng hầm</th>
                    <th>Tên quản lý</th>
                    <th>Số điện thoại quản lý</th>
                    <th>D.Tích sàn</th>
                    <th>D.Tích trống</th>
                    <th>D.Tích thuê</th>
                    <th>Phí môi giới</th>
                    <th>Thao tác</th>
                  </tr>
                </thead>

                <tbody>
                  <c:forEach var="item" items="${buildingList}">
                    <tr>
                      <td class="center">
                        <label class="pos-rel">
                          <input
                            type="checkbox"
                            class="ace"
                            name="checkList"
                            value="${item.id}"
                          />
                          <span class="lbl"></span>
                        </label>
                      </td>
                      <td>${item.name}</td>
                      <td>${item.address}</td>
                      <td>${item.numberOfBasement}</td>
                      <td>${item.managerName}</td>
                      <td>${item.managerPhone}</td>
                      <td>${item.floorArea}</td>
                      <td>${item.id}</td>
                      <td>${item.id}</td>
                      <td class="hidden-480">
                        <span class="label label-sm label-warning"
                          >Expiring</span
                        >
                      </td>

                      <td>
                        <div class="hidden-sm hidden-xs btn-group">
                          <button
                            class="btn btn-xs btn-success btn-assignment-building"
                            title="Giao toàn nhà"
                            data-building-id="${item.id}"
                          >
                            <i class="ace-icon fa fa-check bigger-120"></i>
                          </button>

                          <a
                            class="btn btn-xs btn-info"
                            title="Sửa tòa nhà"
                            href="/admin/building-edit-${item.id}"
                          >
                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                          </a>

                          <button
                            class="btn btn-xs btn-danger"
                            title="Xóa tòa nhà"
                            id="btnDelete"
                            buildingId="${item.id}"
                          >
                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                          </button>
                        </div>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
            <!-- /.span -->
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
    <div
      class="modal fade"
      id="assignmentBuildingModal"
      role="dialog"
      style="font-family: 'Times New Roman', Times, serif"
    >
      <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">
              &times;
            </button>
            <h4 class="modal-title">Danh sách nhân viên</h4>
          </div>
          <div class="modal-body">
            <table
              class="table table-striped table-bordered table-hover"
              id="staffList"
            >
              <thead>
                <tr>
                  <th class="center">Chọn</th>
                  <th>Tên Nhân Viên</th>
                </tr>
              </thead>
              <tbody></tbody>
            </table>
            <input type="hidden" id="buildingId" name="buildingid" value="21" />
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-default"
              id="btnassingmentBuildingAccept"
            >
              Giao tòa nhà
            </button>
            <button type="button" class="btn btn-default" data-dismiss="modal">
              Đóng
            </button>
          </div>
        </div>
      </div>
    </div>
    <script src="assets/js/jquery.2.1.1.min.js"></script>

    <script>
      const API_DOMAIN = "http://localhost:8081";
      const get = async (path) => {
        const response = await fetch(API_DOMAIN + path);
        const result = await response.json();
        return result;
      };

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

      const assignmentBuildingModal = document.querySelector(
        "#assignmentBuildingModal"
      );
      // Truy xuất tất cả các nút button có lớp btn-assignment-building
      const btnAssignmentBuildings = document.querySelectorAll(
        ".btn-assignment-building"
      );
      const btnassingmentBuildingAccept = document.querySelector(
        "#btnassingmentBuildingAccept"
      );
      const staffList = document.querySelector("#staffList");

      // Gán sự kiện cho từng nút button assignmentBuilding
      btnAssignmentBuildings.forEach((btn) => {
        btn.addEventListener("click", async function () {
          $("#assignmentBuildingModal").modal();

          const buildingId = btn.getAttribute("data-building-id");

          const response = await get(
            "${buildingAPI}/" + buildingId + "/staffs"
          );
          console.log("${buildingAPI}/" + buildingId + "/staffs");
          console.log(response);

          let row = "";
          response.data.forEach((item) => {
            row += "<tr>";
            row +=
              '<td class="center" ><input type="checkbox" value="' +
              item.staffId +
              '" id="checkbox_' +
              item.staffId +
              '" ' +
              (item.checked ? "checked" : "") +
              " /></td>";
            row += "<td>" + item.fullName + "</td>";
            row += "</tr>";
          });

          staffList.querySelector("tbody").innerHTML = row;

          //Nút xác nhận giao tòa nhà cho nhân viên
          btnassingmentBuildingAccept.addEventListener("click", async (e) => {
            let data = {};
            data["buildingId"] = buildingId;
            const selectedStaffs = Array.from(
              staffList.querySelectorAll("tbody input[type=checkbox]:checked")
            ).map((checkbox) => checkbox.value);
            data["staffs"] = selectedStaffs;
            if (data["staffs"] != '') {
              const result = await post("${buildingAPI}/assigment",data);
            }
          });
        });
      });

      const btnSearchBuilding = document.querySelector("#btnSearchBuilding");
      btnSearchBuilding.addEventListener("click", (e) => {
        e.preventDefault();
        const listForm = document.querySelector("#listForm");
        console.log(listForm);
        listForm.submit();
      });

      //DELETE
      const del = async (path, id) => {
        const response = await fetch(API_DOMAIN + path, {
          method: "DELETE",
        });
        const result = await response.json();
        return result;
      };

      const btnDelete = document.querySelector("#btnDelete");
      btnDelete.addEventListener("click", async () => {
        const buildingId = [btnDelete.getAttribute("buildingId")];
        const buildingIdStr = buildingId.join(",");
        console.log(buildingIdStr);
        console.log("${buildingAPI}/" + buildingIdStr);
        const response = await del("${buildingAPI}/" + buildingId, buildingId);
      });

      const btnDeleteBuildings = document.querySelector("#btnDeleteBuildings");
      btnDeleteBuildings.addEventListener("click", async (e) => {
        const tableList = document.querySelector("#tableList");
        e.preventDefault();
        const buildingIds = Array.from(
          tableList.querySelectorAll("tbody input[type=checkbox]:checked")
        ).map((checkbox) => checkbox.value);
        const response = await del(
          "${buildingAPI}/" + buildingIds,
          buildingIds
        );
      });
    </script>
  </body>
</html>
