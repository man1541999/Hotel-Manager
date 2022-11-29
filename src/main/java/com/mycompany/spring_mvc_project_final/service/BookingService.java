/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceBookingRoom;
import com.mycompany.spring_mvc_project_final.repository.BookingRepository;
import com.mycompany.spring_mvc_project_final.utils.DateUtil;
import java.time.Duration;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
public class BookingService {
    
    @Autowired
    private BookingRepository bookingRepository;
    
    @Autowired
    private ServiceBookingRoomService serviceBookingRoomService;
    
    @Transactional
    public List<BookingEntity> getBookings() {
        List<BookingEntity> bookings = (List<BookingEntity>) bookingRepository.findAll();
        for (BookingEntity b : bookings) {
            Hibernate.initialize(b.getBookingDetailEntitys());

        }
        if (!CollectionUtils.isEmpty(bookings)) {
            return bookings;
        }
        return new ArrayList<>();
    }
    
    @Transactional
    public BookingEntity findBookingById(long id) {
        Optional<BookingEntity> bookOpt = bookingRepository.findById(id);
        if (bookOpt.isPresent()) {
            BookingEntity b = bookOpt.get();
            Hibernate.initialize(b.getBookingDetailEntitys());
            Hibernate.initialize(b.getPaymentEntitys());
           
            return b;
        }
        return new BookingEntity();
    }
    @Transactional
    public BookingEntity getBookingbyId(long id) {
        BookingEntity booking = this.findBookingById(id);
        List<BookingDetailEntity> bDetailsList = booking.getBookingDetailEntitys();
        for(BookingDetailEntity bdE : bDetailsList){
            Hibernate.initialize(bdE.getServiceBookingRooms());
            Hibernate.initialize(bdE.getGuestEntitys());
        }
        return booking;
    }
    
    @Transactional
    public Map<Long, Double> calBookingPrice(List<BookingEntity> bookings){
        Map<Long, Double> map = new HashMap<>();
        for(BookingEntity b: bookings){
            //tổng tiền = giá tiền loại phòng x (100 - % giảm giá)/100 x số ngày đặt + (giá dịch vụ x số lượng dịch vụ đặt)
            double totalPrice = 0;
            long bookDays = DateUtil.countDay(b.getCheckIn(), b.getCheckOut());
            for(BookingDetailEntity bd: getBookingbyId(b.getId()).getBookingDetailEntitys()){  
                Hibernate.initialize(bd.getServiceBookingRooms());
                double bookingDetailPrice = bd.getRoomEntity().getRoomCategoryEntity().getPrice() * bookDays * (100 - b.getDiscount())/100;
                for(ServiceBookingRoom sbr: bd.getServiceBookingRooms()){
                    double sbrPrice = sbr.getServiceEntity().getPrice() * sbr.getQuantity();
                    bookingDetailPrice += sbrPrice;
                }         
                totalPrice += bookingDetailPrice;
            }            
            map.put(b.getId(), totalPrice);            
        }
        return map;
    }
    
    public void save(BookingEntity booking){
        bookingRepository.save(booking);
    }
    
    public boolean deleteBooking(long id){
    Optional<BookingEntity> roomOtp = bookingRepository.findById(id);
        if (roomOtp.isPresent()) {            
                bookingRepository.deleteById(id);
                return bookingRepository.existsById(id);            
        }
        return false;
    }
}
