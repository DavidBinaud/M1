package soap.ex2;

import java.util.Date;

public class Booking {
    private Client client;
    private Room room;
    private Hotel hotel;
    private Date checkInDate;
    private Date checkOutDate;
    private double price;

    public Booking() {
    }

    public Booking(Client client, Room room, Hotel hotel, Date checkInDate, Date checkOutDate, double price) {
        this.client = client;
        this.room = room;
        this.hotel = hotel;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.price = price;
    }

    public int getNumberOfNights() {
        return (int) ((checkOutDate.getTime() - checkInDate.getTime()) / (1000 * 60 * 60 * 24));
    }
}
