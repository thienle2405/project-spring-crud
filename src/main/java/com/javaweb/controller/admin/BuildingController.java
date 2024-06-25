package com.javaweb.controller.admin;



import com.javaweb.enums.buildingType;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.BuildingService;
import com.javaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    private IUserService userService;

    @Autowired
    private BuildingService buildingService;


    @GetMapping("/admin/building-list")
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("/admin/building/list");
        mav.addObject("modelSearch", buildingSearchRequest);

        //Xuống db lấy dữ liệu lên
        List<BuildingSearchResponse> responseList = new ArrayList<>();
        BuildingSearchResponse item1 = new BuildingSearchResponse();
        item1.setId(3L);
        item1.setName("ACM Building");
        item1.setAddress("130 Quang Trung, Pham Ngũ Lão, Quận 1");
        item1.setNumberOfBasement(2L);
        item1.setManagerName("Anh Tùng");
        item1.setRentArea("100, 200, 300");
        item1.setManagerPhone("0900000001");

        BuildingSearchResponse item2 = new BuildingSearchResponse();
        item2.setId(5L);
        item2.setName("Building MA");
        item2.setAddress("Nguyễn Huệ, Tân Mai, Quận 3");
        item2.setNumberOfBasement(3L);
        item2.setManagerName("Anh Hải");
        item1.setRentArea("100, 200");
        item2.setManagerPhone("0900000002");

        responseList.add(item1);
        responseList.add(item2);
        mav.addObject("buildingList", responseList);
        mav.addObject("listStaffs", userService.getStaffs());
        mav.addObject("dictricts", districtCode.type());
        mav.addObject("buildingType", buildingType.type());
        return mav;
    }

    @GetMapping("/admin/building-edit")
    public ModelAndView buildingEdit(@ModelAttribute("buildingEdit") BuildingDTO buildingDTO, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("/admin/building/edit");
        mav.addObject("dictricts", districtCode.type());
        mav.addObject("buildingType", buildingType.type());
        return mav;
    }

    @GetMapping("/admin/building-edit-{id}")
    public ModelAndView buildingEdit(@PathVariable("id") Long id, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("/admin/building/edit");
        //Xuống DB tìm building theo Id
        BuildingDTO buildingDTO = new BuildingDTO();
        buildingDTO.setId(id);
        buildingDTO.setName("Duy Thien Building");
        mav.addObject("buildingEdit", buildingDTO);
        mav.addObject("dictricts", districtCode.type());
        mav.addObject("buildingType", buildingType.type());

        return mav;
    }
}
