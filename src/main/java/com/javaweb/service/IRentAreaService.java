package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;

import java.util.List;

public interface IRentAreaService {
    public List<RentAreaEntity> listRentArea(String k, BuildingEntity bnew) ;
}
