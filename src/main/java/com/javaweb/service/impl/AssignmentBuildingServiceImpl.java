package com.javaweb.service.impl;

import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.service.AssignmentBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AssignmentBuildingServiceImpl implements AssignmentBuildingService {

    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;

    @Override
    public void deleteByBuildings(List<Long> ids) {
        assignmentBuildingRepository.deleteByBuilding_IdIn(ids);
    }
}
