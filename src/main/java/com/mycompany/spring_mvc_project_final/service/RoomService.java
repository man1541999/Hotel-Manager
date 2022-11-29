/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.RoomEntity;
import com.mycompany.spring_mvc_project_final.repository.RoomRepository;
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
public class RoomService {
    @Autowired
    private RoomRepository roomRepository;
    
    public void save(RoomEntity room) {
        roomRepository.save(room);
    }
    public List<RoomEntity> getRooms() {
        List<RoomEntity> rooms = (List<RoomEntity>) roomRepository.findAll();
        if (!CollectionUtils.isEmpty(rooms)) {
            return rooms;
        }
        return new ArrayList<>();
    }
    
    @Transactional
    public RoomEntity findRoomById(long id) {
        Optional<RoomEntity> roomOtp = roomRepository.findById(id);
        if (roomOtp.isPresent()) {
            Hibernate.initialize(roomOtp.get().getBookingDetailEntitys());
            return roomOtp.get();
        }
        return new RoomEntity();
    }
    
    @Transactional
    public boolean deleteRoom(long id){
//        Optional<RoomEntity> roomOtp = roomRepository.findById(id);
        RoomEntity room = this.findRoomById(id);
        
            List<BookingDetailEntity> bookingDetails = room.getBookingDetailEntitys(); 
            if (CollectionUtils.isEmpty(bookingDetails)) {
                roomRepository.deleteById(id);                
                return roomRepository.existsById(id);
            }
        
        return true;
    }
    
    @Transactional
    public boolean checkAnyBooking(long id){
        Optional<RoomEntity> roomOtp = roomRepository.findById(id);
        if (roomOtp.isPresent()) {
            Hibernate.initialize(roomOtp.get().getBookingDetailEntitys());
            if(roomOtp.get().getBookingDetailEntitys().isEmpty()){
                return true;
            }
            return false;
        }
        return false;
    }
}
