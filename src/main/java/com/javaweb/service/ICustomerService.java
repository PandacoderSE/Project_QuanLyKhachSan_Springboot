package com.javaweb.service;

import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.UserDTO;

import java.util.List;
import java.util.Map;
import java.util.Objects;

public interface ICustomerService {
    List<CustomerDTO> findAll(Map<String, Object> params) ;
}
