package com.javaweb.repository.custom;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public interface BuildingRepositoryCustom {
    //List<BuildingEntity> findAll(Map<String,Object> params, List<String> typeCode , Pageable pageable) ;
    List<BuildingEntity> findAll(Map<String,Object> params, List<String> typeCode , Pageable pageable) ;
    List<UserEntity> findByBuildingID(Long BuildingID) ;
    int countTotalItem(Map<String, Object> params, List<String> typeCode);
}
