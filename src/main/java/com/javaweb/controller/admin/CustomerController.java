package com.javaweb.controller.admin;

import com.javaweb.converter.CustomerConverter;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.enums.TransactionType;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.repository.custom.TransactionRepositoryCustom;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.ICustomerService;
import com.javaweb.service.IUserService;
import com.javaweb.utils.BuildingType;
import com.javaweb.utils.DisplayTagUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
public class CustomerController {
    @Autowired
    private IUserService userService ;
    @Autowired
    private ICustomerService customerService ;
    @Autowired
    private CustomerConverter customerConverter ;
    @Autowired
    private CustomerRepository customerRepository ;
    @Autowired
    private TransactionRepositoryCustom transactionRepositoryCustom ;
    @RequestMapping(value = "/admin/customer-list", method = RequestMethod.GET)
    public ModelAndView getCustomer(@ModelAttribute CustomerDTO customerDTO , @RequestParam Map<String ,Object> params, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/customer/list") ;
        if(SecurityUtils.getAuthorities().contains("ROLE_STAFF")){
            Long staffId = SecurityUtils.getPrincipal().getId();
            params.put("managementStaff", staffId) ;
        }else{
            params.put("managementStaff",params.get("managementStaff")) ;
        }
        mav.addObject("modalSearch",customerDTO) ;
        mav.addObject("listStaffs",userService.getSaffs()) ;
        CustomerDTO cdto = new CustomerDTO() ;
        DisplayTagUtils.of(request, cdto);
        List<CustomerDTO> listC = customerService.findAll(params, PageRequest.of(cdto.getPage() - 1, cdto.getMaxPageItems())) ;
        cdto.setListResult(listC);
        cdto.setTotalItems(customerService.countTotalItems(params));
        mav.addObject("model", cdto) ;
        return mav ;
    }
    @RequestMapping(value = "/admin/customer-edit", method = RequestMethod.GET)
    public ModelAndView customerIdEdit(@ModelAttribute CustomerDTO dto , HttpServletRequest request){
        // đẩy ra view theo đường dẫn file
        ModelAndView mav = new ModelAndView("admin/customer/edit") ;
        mav.addObject("modalAdd" , dto) ;
        return mav ;
    }
    @RequestMapping(value = "/admin/customer-edit-{id}", method = RequestMethod.GET)
    public ModelAndView customerEditId(@PathVariable("id") Long Id, HttpServletRequest request){
        // đẩy ra view theo đường dẫn file
        CustomerDTO dto = customerConverter.toCustomerDTO(customerRepository.findById(Id).get()) ;
        ModelAndView mav = new ModelAndView("admin/customer/edit") ;
        mav.addObject("modalAdd" , dto) ;
        mav.addObject("TransactionType", TransactionType.transactionType()) ;
        Long staid ;
        if(SecurityUtils.getAuthorities().contains("ROLE_STAFF")){
            staid = SecurityUtils.getPrincipal().getId();

        }else{
            staid=null ;
        }
        List<TransactionEntity> listTranByCusID = transactionRepositoryCustom.findbyCustomerId(Id,staid) ;
        mav.addObject("listTranById",listTranByCusID ) ;
        return mav ;
    }
}
