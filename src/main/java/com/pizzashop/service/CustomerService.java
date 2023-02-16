package com.pizzashop.service;

import com.pizzashop.dao.CustomerDao;
import com.pizzashop.domain.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerService implements CrudService<Customer> {

    private CustomerDao dao;

    @Autowired
    public CustomerService(CustomerDao dao){
        this.dao = dao;
    }


    @Override
    public void save() {

    }

    @Override
    public Customer findById(Integer id) {
       return dao.findById(id).orElse(null);
    }

    @Override
    public void findAll() {

    }

    @Override
    public void deleteById() {

    }
}
