package com.javaweb.service.impl;

import com.javaweb.entity.AssignBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.AssignmentBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AssignmentBuildingServiceImpl implements AssignmentBuildingService {

    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private UserRepository userRepository;

    @Override
    public void deleteByBuilding(List<Long> ids) {
        assignmentBuildingRepository.deleteByBuilding_IdIn(ids);
    }

    @Transactional
    @Override
    public void addAssignmentBuildingEntity(AssignmentBuildingDTO assignmentBuildingDTO) {
        BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
        assignmentBuildingRepository.deleteByBuilding(buildingEntity);

        List<Long> staffIds = assignmentBuildingDTO.getStaffs();

        for (Long it : staffIds) {
            AssignBuildingEntity assignBuildingEntity = new AssignBuildingEntity();
            assignBuildingEntity.setBuilding(buildingEntity);

            UserEntity userEntity = userRepository.findById(it).get();
            assignBuildingEntity.setUser(userEntity);

            assignmentBuildingRepository.save(assignBuildingEntity);
        }
    }
}
