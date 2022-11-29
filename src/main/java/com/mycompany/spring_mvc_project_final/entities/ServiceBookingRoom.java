/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "service_booking")
public class ServiceBookingRoom implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = true)
    private double price;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column
    private Date useDate;

    @Column
    private int quantity;

    //Relationship
    
    @ManyToOne
    @JoinColumn(name = "service_id")
    private ServiceEntity serviceEntity;
    
    @ManyToOne
    @JoinColumn(name = "bookingDetail_id")
    private BookingDetailEntity bookingDetailEntity;
    
    
    
    //-----------------------------------------------------------------------

    public ServiceEntity getServiceEntity() {
        return serviceEntity;
    }

    public void setServiceEntity(ServiceEntity serviceEntity) {
        this.serviceEntity = serviceEntity;
    }

    public BookingDetailEntity getBookingDetailEntity() {
        return bookingDetailEntity;
    }

    public void setBookingDetailEntity(BookingDetailEntity bookingDetailEntity) {
        this.bookingDetailEntity = bookingDetailEntity;
    }
    
    
    
    //-------------------------------------------------------------------------
    
    
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

    public Date getUseDate() {
        return useDate;
    }

    public void setUseDate(Date useDate) {
        this.useDate = useDate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "ServiceBookingRoom{" + "id=" + id + ", quantity=" + quantity + '}';
    }

    

}
