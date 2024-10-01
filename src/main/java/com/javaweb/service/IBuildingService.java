package com.javaweb.service;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public interface IBuildingService {
    List<BuildingSearchResponse> findAll(Map<String,Object> params, List<String> typeCode,Pageable pageable) ;
    ResponseDTO listStaffs(long buildingID) ;
    BuildingDTO findbyID(Long id) ;
    BuildingDTO addOrUpdate(BuildingDTO buildingDTO) ;
    void Delete(List<Long> ids) ;

    void UpdateAssignmentBuilding(AssignmentBuildingDTO dto) ;
    int countTotalItems(Map<String, Object> params, List<String> typeCode);
}
