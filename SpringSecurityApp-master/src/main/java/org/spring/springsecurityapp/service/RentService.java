package org.spring.springsecurityapp.service;

import org.spring.springsecurityapp.model.Rent;

import java.util.List;

public interface RentService {

    void addRent(Rent rent);

    void updateRent(Rent rent);

    void removeRent(long id);

    Rent getRentById(long id);

    List<Rent> listRents();
}
