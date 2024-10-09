package com.javaweb.controller.admin;



import com.javaweb.converter.BuildingConverter;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.IBuildingService;
import com.javaweb.service.IUserService;
import com.javaweb.utils.BuildingType;
import com.javaweb.utils.DisplayTagUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List ;
import java.util.Map;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    private IUserService userService ;
    @Autowired
    private IBuildingService buildingService ;
    @RequestMapping(value = "/admin/building-list", method = RequestMethod.GET)
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest bsr, @RequestParam Map<String,Object> params, @RequestParam (name="typeCode", required=false) List<String> typeCode, HttpServletRequest request){
        // đẩy ra view theo đường dẫn file
        ModelAndView mav = new ModelAndView("admin/building/list") ;
        // đẩy data lại ô tìm kiếm , dùng mva để quang ra view
        if(SecurityUtils.getAuthorities().contains("ROLE_STAFF")){
            Long staffId = SecurityUtils.getPrincipal().getId();
            params.put("staffId", staffId) ;
        }else{
            params.put("staffId","") ;
        }
        BuildingSearchResponse bsrep = new BuildingSearchResponse() ;
        DisplayTagUtils.of(request, bsrep);
        List<BuildingSearchResponse> reList = buildingService.findAll(params,typeCode, PageRequest.of(bsrep.getPage() - 1, bsrep.getMaxPageItems())) ;
        bsrep.setListResult(reList);
        bsrep.setTotalItems(buildingService.countTotalItems(params,typeCode));
        mav.addObject("model", bsrep) ;
        mav.addObject("modalSearch",bsr) ;
        // đẩy ra danh sách nhân viên
        mav.addObject("listStaffs",userService.getSaffs()) ;
        // đẩy danh sách district lên
        mav.addObject("listDistricts", districtCode.type()) ;
        // đẩy danh sách building type
        mav.addObject("listTypes", BuildingType.type()) ;
        return mav ;
    }
    @RequestMapping(value = "/admin/building-edit", method = RequestMethod.GET)
    public ModelAndView buildingEdit(@ModelAttribute BuildingDTO bto ,  HttpServletRequest request){
        // đẩy ra view theo đường dẫn file
        ModelAndView mav = new ModelAndView("admin/building/edit") ;

        mav.addObject("modelEdit",bto) ;
        mav.addObject("listDistricts", districtCode.type()) ;
        mav.addObject("listTypes", BuildingType.type()) ;
        return mav ;
    }
    // Sửa Tòa nHà thì phải kèm id
    @RequestMapping(value = "/admin/building-edit-{id}", method = RequestMethod.GET)
    public ModelAndView buildingEditID(@PathVariable("id") Long Id, HttpServletRequest request){
        // đẩy ra view theo đường dẫn file
        ModelAndView mav = new ModelAndView("admin/building/edit") ;
        // xuống db tìm building theo iD
        BuildingDTO bto = buildingService.findbyID(Id) ;
        bto.setId(Id);

        mav.addObject("typeCode", bto.getTypeCode()) ;
        mav.addObject("modelEdit",bto) ;
        mav.addObject("listDistricts", districtCode.type()) ;
        mav.addObject("listTypes", BuildingType.type()) ;
        return mav ;
    }
}
