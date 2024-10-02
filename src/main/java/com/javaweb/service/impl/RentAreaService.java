package com.javaweb.service.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.service.IRentAreaService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
@Service
public class RentAreaService implements IRentAreaService {
    @Override
    public  List<RentAreaEntity> listRentArea(String k, BuildingEntity bnew){
        List<String> list = Arrays.asList(k.split(","));
        List<RentAreaEntity> ListrentArea = new ArrayList<>() ;
        for (String it: list) {
            RentAreaEntity rnew = new RentAreaEntity() ;
            rnew.setValue(Long.parseLong(it.trim()));
            rnew.setBuildingEntity(bnew);
            ListrentArea.add(rnew) ;
        }
        return ListrentArea ;
    }
}
