/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.RoomEntity;
import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author LENOVO
 */
@Repository
public interface RoomRepository extends CrudRepository<RoomEntity, Long>{
    
    
    
    @Query(value = "select * from hotel.room \n"
            + "inner join room_category  on room.roomcategory_id  =room_category.id\n"
            + "where  room_category.name = ?1 and  room.id not in(select r.id from hotel.room r\n"
            + "inner join  booking_detail bd on bd.room_id = r.id\n"
            + "inner join hotel.booking b on b.id = bd.booking_id\n"
            + "where (b.checkIn between ?2 and ?3) "
            + "or (b.checkOut between ?2 and ?3))", nativeQuery = true)
    List<RoomEntity> findRoomByCheckInAndCheckOut(String name ,Date checkIn, Date checkOut);
}
