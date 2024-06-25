package com.javaweb.service;

import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;

import java.awt.print.Pageable;
import java.util.List;

public interface BuildingService {

    public List<BuildingSearchResponse> findAll (BuildingSearchRequest buildingSearchRequest, Pageable pageable);
    ResponseDTO lissStaffs(Long buildingId);
}
