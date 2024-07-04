package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
public class BuildingConverter {

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private RentAreaConverter rentAreaConverter;

    public BuildingSearchResponse toBuildingSearchResponse(BuildingEntity buildingEntity) {
        BuildingSearchResponse res = modelMapper.map(buildingEntity, BuildingSearchResponse.class);

        List<RentAreaEntity> rentAreaEntities = buildingEntity.getRentAreaEntities();
        String rentArea = rentAreaEntities.stream()
                .map(it -> it.getValue().toString())
                .collect(Collectors.joining(", "));
        res.setRentArea(rentArea);

        Map<String, String> districts = districtCode.type();
        String districtName = "";
        if (buildingEntity.getDistrict() != null && !buildingEntity.getDistrict().isEmpty()) {
            districtName = districts.get(buildingEntity.getDistrict());
        }

        if (districtName != null && !districtName.isEmpty()) {
            res.setAddress(buildingEntity.getStreet() + ", "
                    + buildingEntity.getWard() + ", "
                    + districtName);
        }

        return res;
    }

    public BuildingDTO converToDTO(BuildingEntity buildingEntity) {
        BuildingDTO buildingDTO = modelMapper.map(buildingEntity, BuildingDTO.class);
        List<RentAreaEntity> rentAreaEntityList = buildingEntity.getRentAreaEntities();
        if (rentAreaEntityList != null && !rentAreaEntityList.isEmpty()) {
            buildingDTO.setRentArea(rentAreaEntityList.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(",")));
        }
        return buildingDTO;
    }

    public BuildingEntity toBuildingEntity(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);
        buildingEntity.setTypeCode(String.join(",", buildingDTO.getTypeCode()));
        buildingEntity.setRentAreaEntities(rentAreaConverter.toRentAreaEntityList(buildingDTO, buildingEntity));
        return buildingEntity;
    }
}
