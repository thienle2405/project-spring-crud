//package com.javaweb.repository;
//
//import com.javaweb.entity.AssignBuildingEntity;
//import com.javaweb.entity.BuildingEntity;
//import org.springframework.data.jpa.repository.JpaRepository;
//
//import java.util.List;
//
//public interface AssignmentBuildingRepository extends JpaRepository<AssignBuildingEntity, Long> {
//    void deleteByBuilding_IdIn(List<Long> ids);
//
//    // Phương thức mới để xóa theo BuildingEntity
//    void deleteByBuilding(BuildingEntity buildingEntity);
//}
