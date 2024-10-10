package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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
    // hàm lòa nhân viên đc giao
    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffofCustomer(@PathVariable Long id){
        ResponseDTO result = customerService .listStaffs(id) ;
        return result ;
    }
    @PostMapping("/assignment")
    public ResponseEntity<Void> updateAssimentCustomer(@RequestBody AssignmentCustomerDTO assignmentCustomerDTO){
        System.out.println("oke");
        customerService.updateAssignmentCustomer(assignmentCustomerDTO);
        return ResponseEntity.noContent().build()  ;
    }
}
