package com.javaweb.service.impl;

import com.javaweb.converter.CustomerConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import com.javaweb.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Service
public class CustomerServiceimpl implements ICustomerService {
    @Autowired
    private CustomerRepositoryCustom customerRepositoryCustom ;
    @Autowired
    private CustomerRepository customerRepository ;
    @Autowired
    private CustomerConverter customerConverter ;
    @Autowired
    private UserRepository userRepository;
    @Override
    public List<CustomerDTO> findAll(Map<String, Object> params, Pageable pageable) {
        List< CustomerEntity> listE = customerRepositoryCustom.findAll(params, pageable) ;
        List<CustomerDTO> listResult = new ArrayList<>() ;
        for (CustomerEntity it :listE) {
            CustomerDTO dto = customerConverter.toCustomerDTO(it) ;
            listResult.add(dto)  ;
        }

        return listResult;
    }

    @Override
    public int countTotalItems(Map<String, Object> params) {
        return customerRepositoryCustom.countTotalItem(params);
    }

    @Override
    public void deleteCustomers(List<Long> ids) {
        for (Long id :ids) {
            customerRepository.deleteById(id);
        }
    }

    @Override
    public ResponseDTO listStaffs(long customerId) {
        CustomerEntity customer = customerRepository.findById(customerId).get() ;
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1,"STAFF") ;
        List<UserEntity> staffAssignment = customer.getUserEntitys();
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
    public void updateAssignmentCustomer(AssignmentCustomerDTO assignmentCustomerDTO) {
        CustomerEntity Cus =customerRepository.findById(assignmentCustomerDTO.getCustomerId()).get() ;
        Cus.getUserEntitys().clear();
        for (Long it: assignmentCustomerDTO.getStaffs()) {
            UserEntity user =userRepository.findById(it).get() ;
            Cus.getUserEntitys().add(user) ;
        }
        customerRepository.save(Cus) ;
    }
}
