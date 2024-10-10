package com.javaweb.api.admin;

import com.javaweb.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController(value = "customerAPIOfAdmin")
@RequestMapping("/api/customer")
public class CustomerAPI {
    @Autowired
    private ICustomerService customerService ;
    // api xóa
    @DeleteMapping("/{ids}")
    public ResponseEntity<Void> deleteCustomer(@PathVariable List<Long> ids){
        if(!ids.isEmpty()){
            customerService.deleteCustomers(ids);
        }
        return ResponseEntity.noContent().build();
    }
}
