/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.entities;

import com.mycompany.spring_mvc_project_final.enums.BookingStatus;
import com.mycompany.spring_mvc_project_final.enums.UserStatus;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "booking")
public class BookingEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column
    private Date checkIn;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column
    private Date checkOut;

    @Column(length = 3)
    private int discount;

    @Column
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date bookingDate;

    @Column(length = 100)
    private String email;

    @Column(length = 2000)
    private String note;

    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private BookingStatus status;
    
    
    
    //Relationship
    
    @ManyToOne
    @JoinColumn(name = "account_id")
    private AccountEntity accountEntity;
    
    @OneToMany(mappedBy = "bookingEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<PaymentEntity> paymentEntitys = new ArrayList();
    
    @OneToMany(mappedBy = "bookingEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<BookingDetailEntity> bookingDetailEntitys = new ArrayList();
    
    @ManyToOne
    @JoinColumn(name = "promotion_id")
    private PromotionEntity promotionEntity;
    
    
//    ----------------------------------------------------------------------------------

    public List<BookingDetailEntity> getBookingDetailEntitys() {
        return bookingDetailEntitys;
    }

    public void setBookingDetailEntitys(List<BookingDetailEntity> bookingDetailEntitys) {
        this.bookingDetailEntitys = bookingDetailEntitys;
    }
    

    public List<PaymentEntity> getPaymentEntitys() {
        return paymentEntitys;
    }

    public void setPaymentEntitys(List<PaymentEntity> paymentEntitys) {
        this.paymentEntitys = paymentEntitys;
    }
    

    public AccountEntity getAccountEntity() {
        return accountEntity;
    }

    public void setAccountEntity(AccountEntity accountEntity) {
        this.accountEntity = accountEntity;
    }
    
//    -----------------------------------------------------------------------------
    
    
    
    
    //Get and Set

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Date getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(Date checkIn) {
        this.checkIn = checkIn;
    }

    public Date getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(Date checkOut) {
        this.checkOut = checkOut;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public PromotionEntity getPromotionEntity() {
        return promotionEntity;
    }

    public void setPromotionEntity(PromotionEntity promotionEntity) {
        this.promotionEntity = promotionEntity;
    }

    public BookingStatus getStatus() {
        return status;
    }

    public void setStatus(BookingStatus status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "BookingEntity{" + "id=" + id + ", bookingDate=" + bookingDate + ", accountEntity=" + accountEntity + ", paymentEntitys=" + paymentEntitys + ", bookingDetailEntitys=" + bookingDetailEntitys + ", promotionEntity=" + promotionEntity + '}';
    }

    

    

    

}
