/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package personaldata;

/**
 *
 * @author Νικόλαος Μπέλλιας
 */
public class PersonAddress {
    private Person person;
    private Address address;

    public PersonAddress() {
    }

    public PersonAddress(Person person, Address address) {
        this.person = person;
        this.address = address;
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "PersonAddress{" + "person=" + person + ", address=" + address + '}';
    }
    
    
}
