/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.ImageEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceEntity;
import com.mycompany.spring_mvc_project_final.repository.ServiceRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

/**
 *
 * @author LENOVO
 */
@Service
public class ServiceService {

    @Autowired
    private ServiceRepository serviceRepository;

    public void save(ServiceEntity service) {
        serviceRepository.save(service);
    }

    @Transactional
    public ServiceEntity findServiceById(long id) {
        Optional<ServiceEntity> serOpt = serviceRepository.findById(id);
        if (serOpt.isPresent()) {
            Hibernate.initialize(serOpt.get().getImageEntitys());
            Hibernate.initialize(serOpt.get().getServiceBookingRooms());
            return serOpt.get();
        }
        return new ServiceEntity();
    }
    
    @Transactional
    public List<ServiceEntity> findByName(String name){
        List<ServiceEntity> services = serviceRepository.findByName(name);
        if(!CollectionUtils.isEmpty(services)){
            return services;
        }else
            return new ArrayList<>();
    }

    @Transactional
    public List<ServiceEntity> getServices() {
        List<ServiceEntity> services = (List<ServiceEntity>) serviceRepository.findAll();
        for (ServiceEntity s : services) {
            Hibernate.initialize(s.getImageEntitys());
            Hibernate.initialize(s.getServiceBookingRooms());
        }
        if (!CollectionUtils.isEmpty(services)) {
            return services;
        }
        return new ArrayList<>();
    }


    public boolean deleteService(long id) {
        Optional<ServiceEntity> serOpt = serviceRepository.findById(id);
        if (serOpt.isPresent()) {
            
                serviceRepository.deleteById(id);
                return serviceRepository.existsById(id);
            
            
        }
        return true;
    }
    
    public boolean isExists(long id){
        return serviceRepository.existsById(id);
    }
}
