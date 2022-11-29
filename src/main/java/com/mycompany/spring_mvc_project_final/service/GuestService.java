/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.GuestEntity;
import com.mycompany.spring_mvc_project_final.repository.GuestRepository;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

/**
 *
 * @author LENOVO
 */
@Service
public class GuestService {
    @Autowired
    private GuestRepository guestRepository;
    
    public void save(GuestEntity guest) {
        guestRepository.save(guest);
    }
    public List<GuestEntity> getRooms() {
        List<GuestEntity> guests = (List<GuestEntity>) guestRepository.findAll();
        if (!CollectionUtils.isEmpty(guests)) {
            return guests;
        }
        return new ArrayList<>();
    }
    public GuestEntity findGuestById(long id) {
        Optional<GuestEntity> guestOtp = guestRepository.findById(id);
        if (guestOtp.isPresent()) {
            return guestOtp.get();
        }
        return new GuestEntity();
    }
    
    public boolean deleteGuest(long id){
        Optional<GuestEntity> gueOpt = guestRepository.findById(id);
        if (gueOpt.isPresent()) {            
                guestRepository.deleteById(id);
                return guestRepository.existsById(id);            
        }
        return true;
    }
//    
//    public boolean checkAnyBooking(long id){
//        Optional<RoomEntity> roomOtp = roomRepository.findById(id);
//        if (roomOtp.isPresent()) {
//            if(roomOtp.get().getBookingDetailEntitys().size()>0){
//                return true;
//            }
//            return false;
//        }
//        return false;
//    }
}
