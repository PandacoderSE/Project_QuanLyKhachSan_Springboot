package com.javaweb.service.impl;

import com.javaweb.converter.BuildingConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentareaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import com.javaweb.repository.custom.RentAreaRepositoryCustom;
import com.javaweb.service.IBuildingService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
@Service
@Transactional
public class BuildingService implements IBuildingService {
    @Autowired
    private BuildingRepositoryCustom buildingRepositoryCustom ;
    @Autowired
    private BuildingRepository buildingRepository ;
    @Autowired
    private BuildingConverter buildingConverter ;
    @Autowired
    private UserRepository userRepository ;
    @Autowired
    private RentAreaRepositoryCustom rentAreaRepositoryCustom;
    @Autowired
    private RentareaRepository rentAreaRepository;
    @Autowired
    private ModelMapper modelMapper ;
    @Override
    public List<BuildingSearchResponse> findAll(Map<String, Object> params, List<String> typeCode,Pageable pageable) {
        List<BuildingEntity> listSR = buildingRepositoryCustom.findAll(params,typeCode,pageable) ;
        List<BuildingSearchResponse> result = new ArrayList<BuildingSearchResponse>();
        for (BuildingEntity item : listSR) {
            BuildingSearchResponse bt =buildingConverter.toResponse(item);
            result.add(bt);
        }
        return result;
    }

    @Override
    public ResponseDTO listStaffs(long buildingID) {
//        ko cần định nghĩa vẫn gọi đc
        BuildingEntity building = buildingRepository.findById(buildingID).get() ;
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1,"STAFF") ;
        List<UserEntity> staffAssignment = building.getUserEntity() ;
        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>() ;
        // lưu vô cái Response kèm tin nhắn
        ResponseDTO result = new ResponseDTO() ;
        for (UserEntity item:staffs) {
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO() ;
            staffResponseDTO.setFullName(item.getFullName());
            staffResponseDTO.setStaffId(item.getId());
            if(staffAssignment.contains(item)){
                staffResponseDTO.setChecked("checked");
            }else{
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOS.add(staffResponseDTO) ;
        }
        result.setData(staffResponseDTOS);
        result.setMessage("success");
        return result ;

    }

    @Override
    public BuildingDTO findbyID(Long id) {
        return buildingConverter.toBuildingDTO(buildingRepository.findById(id).get());
    }

    @Override
    public BuildingDTO addOrUpdate(BuildingDTO dto) {
        if(dto.getId() != null){
            BuildingEntity bnew =buildingRepository.findById(dto.getId()).get() ;
            bnew.setName(dto.getName());
            bnew.setStreet(dto.getStreet()) ;
            bnew.setWard(dto.getWard());
            bnew.setDistrict(dto.getDistrict());
            bnew.setNumberofbasement(dto.getNumberOfBasement());
            bnew.setStructure(dto.getStructure());
            bnew.setFloorarea(dto.getFloorArea());
            bnew.setLevel(dto.getLevel());
            bnew.setType(String.join(",",dto.getTypeCode()));
            bnew.setManagername(dto.getManagerName());
            bnew.setManagerphonenumber(dto.getManagerPhone());
            bnew.setRentprice(dto.getRentPrice());
            bnew.setRentpricedescription(dto.getRentPriceDescription());
            bnew.setAvatar(dto.getImageName());
            buildingRepository.save(bnew) ;
            List<String> list = Arrays.asList(dto.getRentArea().split(","));
            List<RentAreaEntity> ListrentArea = rentAreaRepositoryCustom.findAll(dto.getId()) ;
            for (RentAreaEntity item : ListrentArea) {
                rentAreaRepository.delete(item);
            }

            for (String it: list) {
                RentAreaEntity rnew = new RentAreaEntity() ;
                rnew.setValue(Long.parseLong(it.trim()));
                rnew.setBuildingEntity(bnew);
                rentAreaRepository.save(rnew) ;
            }

        }else{
            BuildingEntity bnew = new BuildingEntity() ;
            bnew.setName(dto.getName());
            bnew.setStreet(dto.getStreet()) ;
            bnew.setWard(dto.getWard());
            bnew.setDistrict(dto.getDistrict());
            bnew.setNumberofbasement(dto.getNumberOfBasement());
            bnew.setStructure(dto.getStructure());
            bnew.setFloorarea(dto.getFloorArea());
            bnew.setLevel(dto.getLevel());
            bnew.setType(String.join(",",dto.getTypeCode()));
            bnew.setManagername(dto.getManagerName());
            bnew.setManagerphonenumber(dto.getManagerPhone());
            bnew.setRentprice(dto.getRentPrice());
            bnew.setRentpricedescription(dto.getRentPriceDescription());
            bnew.setAvatar(dto.getImageName());
            buildingRepository.save(bnew) ;
            List<String> list = Arrays.asList(dto.getRentArea().split(","));
            for (String it: list) {
                RentAreaEntity rnew = new RentAreaEntity() ;
                rnew.setValue(Long.parseLong(it.trim()));
                rnew.setBuildingEntity(bnew);
                rentAreaRepository.save(rnew) ;
            }

        }
        return dto ;
    }

    @Override
    public void Delete(List<Long> ids) {
        for (Long id: ids) {
            BuildingEntity bdelete = buildingRepository.findById(id).get() ;
            List<RentAreaEntity> ListrentArea = rentAreaRepositoryCustom.findAll(id) ;
            for (RentAreaEntity item : ListrentArea) {
                rentAreaRepository.delete(item);
            }
            bdelete.getUserEntity().clear();
            buildingRepository.delete(bdelete);
        }
    }

    @Override
    public void UpdateAssignmentBuilding(AssignmentBuildingDTO dto) {
        // nghĩa là se tìm ra building đó thông qua id -> gỡ hết user trong nó
        // Sau đó lưu lại nó
        // Thêm lại các user vô list đó và lưu lại
        BuildingEntity buildingSearch = buildingRepository.findById(dto.getBuildingId()).get() ;
        buildingSearch.getUserEntity().clear();
        for (Long it: dto.getStaffs()) {
            UserEntity user = userRepository.findById(it).get() ;
            buildingSearch.getUserEntity().add(user) ;
        }
        buildingRepository.save(buildingSearch);
    }

    @Override
    public int countTotalItems(Map<String, Object> params, List<String> typeCode) {
        return buildingRepositoryCustom.countTotalItem(params, typeCode);
    }
}
