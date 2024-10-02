package com.javaweb.converter;

import com.javaweb.config.ModelMapperConfig;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingConverter {
    @Autowired
    private ModelMapper modelMapper ;
    public BuildingSearchResponse toResponse(BuildingEntity be){
        BuildingSearchResponse BSR =modelMapper.map(be,BuildingSearchResponse.class) ;
        BSR.setAddress(be.getStreet() + "," + be.getWard() + "," + districtCode.type().get(be.getDistrict().toString()));
        List<RentAreaEntity> rentareas = be.getItems();
        String AreaList = rentareas.stream().map(it -> it.toString()).collect(Collectors.joining(","));
        BSR.setRentArea(AreaList);
        return BSR;
    }
    public BuildingEntity toBuildingEntity(BuildingDTO dto){
        BuildingEntity bnew = new BuildingEntity() ;
        bnew.setId(dto.getId());
        bnew.setName(dto.getName());
        bnew.setStreet(dto.getStreet()) ;
        bnew.setWard(dto.getWard());
        bnew.setDistrict(dto.getDistrict());
        bnew.setNumberofbasement(dto.getNumberOfBasement());
        bnew.setStructure(dto.getStructure());
        bnew.setFloorarea(dto.getFloorArea());
        bnew.setLevel(dto.getLevel());
        bnew.setType(dto.getTypeCode().toString());
        bnew.setManagername(dto.getManagerName());
        bnew.setManagerphonenumber(dto.getManagerPhone());
        bnew.setRentprice(dto.getRentPrice());
        bnew.setAvatar(dto.getImageName());
        bnew.setDecorationtime(dto.getImage());
        bnew.setRentpricedescription(dto.getRentPriceDescription());
        return bnew ;
    }
    public BuildingDTO toBuildingDTO(BuildingEntity bet){
        BuildingDTO bnew = new BuildingDTO() ;
        bnew.setName(bet.getName());
        bnew.setStreet(bet.getStreet()) ;
        bnew.setManagerName(bet.getManagername());
        bnew.setManagerPhone(bet.getManagerphonenumber());
        bnew.setRentPrice(bet.getRentprice());
        bnew.setWard(bet.getWard());
        bnew.setDistrict(bet.getDistrict());
        bnew.setNumberOfBasement(bet.getNumberofbasement());
        bnew.setStructure(bet.getStructure());
        bnew.setFloorArea(bet.getFloorarea());
        bnew.setLevel(bet.getLevel());
        bnew.setRentPrice(bet.getRentprice());
        bnew.setRentPriceDescription(bet.getRentpricedescription());
        bnew.setImageName(bet.getAvatar());
        bnew.setImage(bet.getDecorationtime());
        // dùng hàm này nhanh vì nó là quan hệ 1 nhiều
        List<RentAreaEntity> rentareas = bet.getItems();
        bnew.setRentArea(rentareas.stream().map(it -> it.toString()).collect(Collectors.joining(",")));
        bnew.setTypeCode(Arrays.stream(bet.getType().split(",")).collect(Collectors.toList())) ;

        bnew.setRentPriceDescription(bet.getRentpricedescription());
        return bnew ;
    }
}
