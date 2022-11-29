/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.entities;

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
import javax.validation.constraints.NotBlank;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "room")
public class RoomEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    
    @Column(length = 50, unique = true)
    @NotBlank(message = "field is required")
    private String roomNumber;
    
    @Column(length = 20, unique = true)
    private String phoneNumber;
    
    @Column(length = 50)
    private String status;
    
    
    
    //Relationship
    
    @ManyToOne
    @JoinColumn(name = "roomcategory_id")
    private RoomCategoryEntity roomCategoryEntity;
    
    
    @OneToMany(mappedBy = "roomEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<BookingDetailEntity> bookingDetailEntitys = new ArrayList<>();
    
    //-------------------------------------------------------------------------


    public RoomCategoryEntity getRoomCategoryEntity() {        
        return roomCategoryEntity;
    }

    public void setRoomCategoryEntity(RoomCategoryEntity roomCategoryEntity) {
        this.roomCategoryEntity = roomCategoryEntity;
    }

    public List<BookingDetailEntity> getBookingDetailEntitys() {
        return bookingDetailEntitys;
    }

    public void setBookingDetailEntitys(List<BookingDetailEntity> bookingDetailEntitys) {
        this.bookingDetailEntitys = bookingDetailEntitys;
    }
    
    //--------------------------------------------------------------------------
    
    //Get and Set

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    

    @Override
    public String toString() {
        return "RoomEntity{" + "roomNumber=" + roomNumber + ", roomCategoryEntity=" + roomCategoryEntity + '}';
    }

    
    
    
}
