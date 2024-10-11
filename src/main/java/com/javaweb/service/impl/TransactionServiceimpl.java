package com.javaweb.service.impl;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.service.ITransactionService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TransactionServiceimpl implements ITransactionService {
    @Autowired
    private TransactionRepository transactionRepository ;
    @Autowired
    private ModelMapper modelMapper ;
    @Autowired
    private CustomerRepository customerRepository ;
    @Override
    public TransactionDTO insertTran(TransactionDTO transactionDTO) {
        TransactionEntity t = modelMapper.map(transactionDTO,TransactionEntity.class) ;
        CustomerEntity cus = customerRepository.findById(transactionDTO.getCustomerid()).get() ;
        t.setCustomerEntity(cus);
        transactionRepository.save(t) ;
        return transactionDTO ;
    }

    @Override
    public void delete(Long id) {
        TransactionEntity t = transactionRepository.findById(id).get() ;
        transactionRepository.delete(t);
    }
}
