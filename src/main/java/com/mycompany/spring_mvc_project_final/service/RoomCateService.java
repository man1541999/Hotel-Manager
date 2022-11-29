/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.RoomCategoryEntity;
import com.mycompany.spring_mvc_project_final.entities.RoomEntity;
import com.mycompany.spring_mvc_project_final.repository.RoomCateRepository;
import com.mycompany.spring_mvc_project_final.repository.RoomRepository;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

/**
 *
 * @author ADMIN
 */
@Service
public class RoomCateService {

    @Autowired
    private RoomCateRepository roomCateRepository;

    @Autowired
    private RoomService roomService;
    
    @Autowired
    private RoomRepository roomRepository;

    //---------manager----------------//
    
    @Transactional
    public List<RoomCategoryEntity> getRoomCates() {
        List<RoomCategoryEntity> rooms = (List<RoomCategoryEntity>) roomCateRepository.findAll();

        if (!CollectionUtils.isEmpty(rooms)) {
            for (RoomCategoryEntity r : rooms) {
                Hibernate.initialize(r.getImageEntitys());
            }
            return rooms;
        }
        return new ArrayList<>();
    }

    @Transactional
    public RoomCategoryEntity findRoomCateById(long id) {
        Optional<RoomCategoryEntity> roomOpt = roomCateRepository.findById(id);
        if (roomOpt.isPresent()) {
            Hibernate.initialize(roomOpt.get().getImageEntitys());
            return roomOpt.get();
        }
        return new RoomCategoryEntity();
    }

    @Transactional
    public RoomCategoryEntity findCategoryByName(String name) {
        RoomCategoryEntity roomOpt = roomCateRepository.findByName(name);
        if (roomOpt != null) {
            Hibernate.initialize(roomOpt.getRoomEntitys());
            return roomOpt;
        }
        return new RoomCategoryEntity();
    }

    @Transactional
    public boolean deleteCategory(long id) {
        Optional<RoomCategoryEntity> cateOpt = roomCateRepository.findById(id);
        if (cateOpt.isPresent()) {
            if (checkRoomHasBooking(cateOpt.get().getId())) {
                return true;
            } else {
                roomCateRepository.deleteById(id);
                return roomCateRepository.existsById(id);
            }
        }
        return true;
    }

    public void save(RoomCategoryEntity roomCategory) {
        roomCateRepository.save(roomCategory);
    }

    public boolean checkRoomHasBooking(long id) {
        RoomCategoryEntity rc = findRoomCateById(id);
        List<RoomEntity> rooms = rc.getRoomEntitys();
        for (RoomEntity r : rooms) {
            if (roomService.checkAnyBooking(r.getId())) {
                return true;
            }
            return false;
        }
        return false;
    }
    
    //---------manager----------------//
    
    
    
//    ---------------User---------------//
    
    
    //Search room
    @Transactional
    public List<RoomEntity> searchRoom(String name,Date searchCheckIn, Date searchCheckOut) {
        List<RoomEntity> rooms = 
                roomRepository.findRoomByCheckInAndCheckOut( name, searchCheckIn, searchCheckIn);
        if (!CollectionUtils.isEmpty(rooms)) {
           
            return rooms;
        }
    
        return new ArrayList<>();
    }
    
    
    //    ---------------User---------------//
}
