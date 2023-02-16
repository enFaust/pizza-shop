package com.pizzashop.service;

public interface CrudService<T> {
    public void save();

    public T findById(Integer id);

    public void findAll();

    public void deleteById();
}
