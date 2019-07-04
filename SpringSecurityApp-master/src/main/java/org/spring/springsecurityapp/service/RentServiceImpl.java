package org.spring.springsecurityapp.service;

import org.spring.springsecurityapp.repository.RentRepository;
import org.spring.springsecurityapp.model.Rent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RentServiceImpl implements RentService {

    @Autowired
    private RentRepository rentRepository;


    @Override
    public void addRent(Rent rent) {
        rentRepository.saveAndFlush(rent);
    }

    @Override
    public void updateRent(Rent rent) {
      rentRepository.save(rent);
    }

    @Override
    public void removeRent(long id) {
        rentRepository.delete(id);
    }

    @Override
    public Rent getRentById(long id) {
        return rentRepository.findRentById(id);
    }

    @Override
    public List<Rent> listRents() {
        return this.rentRepository.findAll();
    }
}
