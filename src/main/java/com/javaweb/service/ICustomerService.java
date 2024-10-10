package com.javaweb.service;

import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;
import java.util.Objects;

public interface ICustomerService {
    List<CustomerDTO> findAll(Map<String, Object> params, Pageable pageable) ;
    int countTotalItems(Map<String, Object> params) ;
    void deleteCustomers(List<Long> ids) ;
    ResponseDTO listStaffs(long customerId) ;
    void updateAssignmentCustomer(AssignmentCustomerDTO assignmentCustomerDTO) ;
}
