package com.javaweb.api.web;

import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController(value = "newAPIOfWeb")
@RequestMapping("/api")
public class NewAPI {
    @Autowired
    private ICustomerService customerService ;
    @PostMapping("/contact")
    public ResponseEntity<CustomerDTO> addOrUpdateCustomer(@RequestBody CustomerDTO customerDTO){
        System.out.println("ok");
        return ResponseEntity.ok(customerService.insertOrUpdateCustomer(customerDTO)) ;
    }
	
}
