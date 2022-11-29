/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceBookingRoom;
import com.mycompany.spring_mvc_project_final.entities.ServiceEntity;
import com.mycompany.spring_mvc_project_final.repository.ServiceBookingRoomRepository;
import com.mycompany.spring_mvc_project_final.utils.DateUtil;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

/**
 *
 * @author LENOVO
 */
@Service
public class ServiceBookingRoomService {
    @Autowired
    private ServiceBookingRoomRepository serviceBookingRoomRepository;
    
    @Autowired
    private BookingDetailService bookingDetailService;
    
    @Autowired
    private ServiceService serviceService;
    
    @Transactional
    public List<ServiceBookingRoom> findServiceBookingRoomByBookingDetailId(long id){
        List<ServiceBookingRoom> sbrs = (List<ServiceBookingRoom>) serviceBookingRoomRepository.findByBookingDetailEntityId(id);
        if (!CollectionUtils.isEmpty(sbrs)) {
            return sbrs;
        }
        return new ArrayList<>();
    }
    
//    public void save(ServiceBookingRoom serviceBookingRoom){
//        
//    }
    
    public void addServiceToBookingRoom(String useDate, String serviceInput, String quantity, long id){
        ServiceBookingRoom sbr = serviceBookingRoomRepository.findSBRByUseDate(DateUtil.converStringToDate(useDate), Long.parseLong(serviceInput));
        if(sbr == null){
            sbr = new ServiceBookingRoom();
            sbr.setUseDate(DateUtil.converStringToDate(useDate));
            sbr.setQuantity(Integer.parseInt(quantity));
            BookingDetailEntity bde = bookingDetailService.findBookingDetailById(id);
            ServiceEntity service = serviceService.findServiceById(Integer.parseInt(serviceInput));
            sbr.setBookingDetailEntity(bde);
            sbr.setServiceEntity(service);
            bde.getServiceBookingRooms().add(sbr);
            service.getServiceBookingRooms().add(sbr);
            serviceBookingRoomRepository.save(sbr);
            
        }else{
            sbr.setQuantity(Integer.parseInt(quantity));
            serviceBookingRoomRepository.save(sbr);
        }
    }
    
    public boolean deleteServiceBookingRoom(long id) {
        Optional<ServiceBookingRoom> serOpt = serviceBookingRoomRepository.findById(id);
        if (serOpt.isPresent()) {            
                serviceBookingRoomRepository.deleteById(id);
                return serviceBookingRoomRepository.existsById(id);            
        }
        return true;
    }
    
    public ServiceBookingRoom findById(long id){
        Optional<ServiceBookingRoom> sbrOtp = serviceBookingRoomRepository.findById(id);
        if (sbrOtp.isPresent()) {
            return sbrOtp.get();
        }
        return new ServiceBookingRoom();
    }
}
