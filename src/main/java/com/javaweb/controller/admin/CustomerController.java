package com.javaweb.controller.admin;

import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.service.ICustomerService;
import com.javaweb.service.IUserService;
import com.javaweb.utils.BuildingType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
public class CustomerController {
    @Autowired
    private IUserService userService ;
    @Autowired
    private ICustomerService customerService ;
    @RequestMapping(value = "/admin/customer-list", method = RequestMethod.GET)
    public ModelAndView getCustomer(@ModelAttribute CustomerDTO customerDTO , @RequestParam Map<String ,Object> params, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/customer/list") ;
        mav.addObject("modalSearch",customerDTO) ;
        mav.addObject("listStaffs",userService.getSaffs()) ;
        mav.addObject("listCustomer",customerService.findAll(params)) ;
        return mav ;
    }
    @RequestMapping(value = "/admin/customer-edit", method = RequestMethod.GET)
    public ModelAndView buildingEdit(@ModelAttribute BuildingDTO bto , HttpServletRequest request){
        // đẩy ra view theo đường dẫn file
        ModelAndView mav = new ModelAndView("admin/customer/edit") ;
        return mav ;
    }
}
