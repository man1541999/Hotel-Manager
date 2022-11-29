/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "booking_detail")
public class BookingDetailEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = true)
    private double price;

    //Relationship
    @ManyToOne
    @JoinColumn(name = "booking_id")
    private BookingEntity bookingEntity;

    @OneToMany(mappedBy = "bookingDetailEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<GuestEntity> guestEntitys = new ArrayList();
    
    @OneToMany(mappedBy = "bookingDetailEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ServiceBookingRoom> serviceBookingRooms = new ArrayList();
    
    @ManyToOne
    @JoinColumn(name = "room_id")
    private RoomEntity roomEntity;
    

//    ---------------------------------------------------------------------------
    public BookingEntity getBookingEntity() {
        return bookingEntity;
    }

    public void setBookingEntity(BookingEntity bookingEntity) {
        this.bookingEntity = bookingEntity;
    }

    public List<GuestEntity> getGuestEntitys() {
        return guestEntitys;
    }

    public void setGuestEntitys(List<GuestEntity> guestEntitys) {
        this.guestEntitys = guestEntitys;
    }
    
     public List<ServiceBookingRoom> getServiceBookingRooms() {
        return serviceBookingRooms;
    }

    public void setServiceBookingRooms(List<ServiceBookingRoom> serviceBookingRooms) {
        this.serviceBookingRooms = serviceBookingRooms;
    }
    
     public RoomEntity getRoomEntity() {
        return roomEntity;
    }

    public void setRoomEntity(RoomEntity roomEntity) {
        this.roomEntity = roomEntity;
    }
    
    
//---------------------------------------------------------------------------------

   

   
    
    
    //Get and Set
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "BookingDetailEntity{" + "id=" + id + ", serviceBookingRooms=" + serviceBookingRooms + '}';
    }

  
}
