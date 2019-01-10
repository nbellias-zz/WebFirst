/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package personaldata;

import java.util.List;

/**
 *
 * @author Νικόλαος Μπέλλιας
 */
public class Address {

    private String street;
    private Integer streetNo;
    private Integer zipCode;
    private String city;
    private String state;
    
    public Address() {
    }

    public Address(String street, Integer streetNo, Integer zipCode, String city, String state) {
        this.street = street;
        this.streetNo = streetNo;
        this.zipCode = zipCode;
        this.city = city;
        this.state = state;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public Integer getStreetNo() {
        return streetNo;
    }

    public void setStreetNo(Integer streetNo) {
        this.streetNo = streetNo;
    }

    public Integer getZipCode() {
        return zipCode;
    }

    public void setZipCode(Integer zipCode) {
        this.zipCode = zipCode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Address{" + "street=" + street + ", streetNo=" + streetNo + ", zipCode=" + zipCode + ", city=" + city + ", state=" + state + '}';
    }

}
