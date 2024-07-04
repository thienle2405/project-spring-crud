package com.javaweb.service.impl;

import com.javaweb.converter.RentAreaConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.service.RentAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RentAreaServiceImpl implements RentAreaService {

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private RentAreaRepository rentAreaRepository;

    @Autowired
    private RentAreaConverter rentAreaConverter;

    @Override
    public void deleteByBuildings(List<Long> ids) {
//        for (Long it : ids) {
//            BuildingEntity buildingEntity = buildingRepository.findById(Long.valueOf(it)).get();
//            rentAreaRepository.deleteByBuildingId(buildingEntity);
//        }
        rentAreaRepository.deleteByBuilding_IdIn(ids);
    }

    @Override
    public void addRentArea(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = buildingRepository.findById(buildingDTO.getId()).get();
        rentAreaRepository.deleteByBuilding(buildingEntity);

        String[] rentAreas = buildingDTO.getRentArea().trim().split(",");
        for(String item : rentAreas) {
            RentAreaEntity rentAreaEntity = rentAreaConverter.toRentAreaEntityFromDTO(buildingDTO, Long.valueOf(item));
            rentAreaRepository.save(rentAreaEntity);
        }
    }
}
