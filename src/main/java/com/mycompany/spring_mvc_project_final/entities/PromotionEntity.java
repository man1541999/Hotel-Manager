/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author LENOVO
 */
@Entity
@Table(name = "promotion")
public class PromotionEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    
    @Column(length = 100)
    private String name;
    
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column
    private Date startDate;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column
    private Date endDate;
    
    @Column(length = 2000)
    private String description;
    
    @Column(length = 3)
    private int discount;
    
    @Column(length = 10, unique = true)
    private String code;
    
    @Column(name = "is_used")
    private boolean isUsed;
    
    
    
    @OneToMany(mappedBy = "promotionEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ImageEntity> imageEntitys = new ArrayList<>();
    
    @OneToMany(mappedBy = "promotionEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<BookingEntity> bookingEntitys = new ArrayList<>();

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public boolean isIsUsed() {
        return isUsed;
    }

    public void setIsUsed(boolean isUsed) {
        this.isUsed = isUsed;
    }

    public List<ImageEntity> getImageEntitys() {
        return imageEntitys;
    }

    public void setImageEntitys(List<ImageEntity> imageEntitys) {
        this.imageEntitys = imageEntitys;
    }

    public List<BookingEntity> getBookingEntitys() {
        return bookingEntitys;
    }

    public void setBookingEntitys(List<BookingEntity> bookingEntitys) {
        this.bookingEntitys = bookingEntitys;
    }

    
    
}
