package com.javaweb.service;

import com.javaweb.model.dto.BuildingDTO;

public interface RentAreaService {

    public void deleteBuBuildins(Long[] ids);

    public void addRentArea(BuildingDTO buildingDTO);
}
