/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author LENOVO
 */
public class DateUtil {

    public static String convertDateToString(Date value) {
        if (value != null) {
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            return dateFormat.format(value);
        } else {
            return null;
        }
    }

    public static Date converStringToDate(String value) {
        if (value != null) {
            try {
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                return dateFormat.parse(value);
            } catch (ParseException ex) {
                System.out.println(ex.getMessage());
            }
        }
        return null;
    }

    public static long countDay(Date d1, Date d2) {
        
    long diff = d2.getTime() - d1.getTime();
    return TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);

    }
}
