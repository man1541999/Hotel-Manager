/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

//import com.mycompany.spring_mvc_project_final.entities.PromotionEntity;
//import com.mycompany.spring_mvc_project_final.repository.PromotionRepository;
import com.mycompany.spring_mvc_project_final.entities.PromotionEntity;
import com.mycompany.spring_mvc_project_final.repository.PromotionRepository;
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
public class PromotionService {

    @Autowired
    private PromotionRepository promotionRepository;

    public void save(PromotionEntity promotion) {
        promotionRepository.save(promotion);
    }

    @Transactional
    public PromotionEntity findPromotionById(long id) {
        Optional<PromotionEntity> serOpt = promotionRepository.findById(id);
        if (serOpt.isPresent()) {
            Hibernate.initialize(serOpt.get().getImageEntitys());
            return serOpt.get();
        }
        return new PromotionEntity();
    }

    @Transactional
    public List<PromotionEntity> getPromotions() {
        List<PromotionEntity> promotions = (List<PromotionEntity>) promotionRepository.findAll();

        if (!CollectionUtils.isEmpty(promotions)) {
            for (PromotionEntity p : promotions) {
                Hibernate.initialize(p.getImageEntitys());
                Hibernate.initialize(p.getBookingEntitys());
            }
            return promotions;
        }
        return new ArrayList<>();
    }

    @Transactional
    public boolean deletePromotion(long id) {
        Optional<PromotionEntity> serOpt = promotionRepository.findById(id);
        if (serOpt.isPresent()) {
//            Hibernate.initialize(serOpt.get().getBookingEntitys());
//            if (serOpt.get().getBookingEntitys().size() > 0) {
                promotionRepository.deleteById(id);
                return promotionRepository.existsById(id);
//            }
//            return true;
        }
        return true;
    }
    
    public boolean isExists(long id){
        return promotionRepository.existsById(id);
    }
}
