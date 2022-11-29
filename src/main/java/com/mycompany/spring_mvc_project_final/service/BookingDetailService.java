/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.GuestEntity;
import com.mycompany.spring_mvc_project_final.repository.BookingDetailRepository;
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
public class BookingDetailService {

    @Autowired
    private BookingDetailRepository bookingDetailRepository;

    @Transactional
    public List<BookingDetailEntity> getBookingDetails() {
        List<BookingDetailEntity> bookingDetails = (List<BookingDetailEntity>) bookingDetailRepository.findAll();
        if (!CollectionUtils.isEmpty(bookingDetails)) {
            for (BookingDetailEntity bd : bookingDetails) {
                Hibernate.initialize(bd.getServiceBookingRooms());
                Hibernate.initialize(bd.getGuestEntitys());
            }
            return bookingDetails;
        }
        return new ArrayList<>();
    }
    
    @Transactional
    public BookingDetailEntity findBookingDetailById(long id){
        Optional<BookingDetailEntity> bookDetailOpt = bookingDetailRepository.findById(id);
        if (bookDetailOpt.isPresent()) {
            BookingDetailEntity bd = bookDetailOpt.get();
            Hibernate.initialize(bd.getGuestEntitys());
            Hibernate.initialize(bd.getServiceBookingRooms());
            return bd;
        }
        return new BookingDetailEntity();
    }
}
