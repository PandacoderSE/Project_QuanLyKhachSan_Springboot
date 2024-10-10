package com.javaweb.service.impl;

import com.javaweb.converter.CustomerConverter;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.repository.CustomerRepository;
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
}
