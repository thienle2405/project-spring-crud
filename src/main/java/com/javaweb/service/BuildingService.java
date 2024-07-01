package com.javaweb.service;

import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.stereotype.Service;

import java.awt.print.Pageable;
import java.util.List;

@Service
public interface BuildingService {

    public List<BuildingSearchResponse> findAll (BuildingSearchRequest buildingSearchRequest);
    ResponseDTO lissStaffs(Long buildingId);


}
