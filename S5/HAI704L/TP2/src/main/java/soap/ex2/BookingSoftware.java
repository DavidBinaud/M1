package soap.ex2;

import java.util.ArrayList;

public class BookingSoftware {
    private ArrayList<Hotel> hotels;
    private ArrayList<Booking> bookings;

    public BookingSoftware() {
        hotels = new ArrayList<>();
        bookings = new ArrayList<>();
    }

    public void addHotel(Hotel hotel) {
        hotels.add(hotel);
    }

    public void addBooking(Booking booking) {
        bookings.add(booking);
    }

    public ArrayList<Hotel> getHotels() {
        return hotels;
    }

    public ArrayList<Booking> getBookings() {
        return bookings;
    }

    public ArrayList<Hotel> getHotelsByCity(String city) {
        ArrayList<Hotel> hotelsByCity = new ArrayList<>();
        for (Hotel hotel : hotels) {
            if (hotel.getAddress().getCity().equals(city)) {
                hotelsByCity.add(hotel);
            }
        }
        return hotelsByCity;
    }

    public ArrayList<Hotel> getHotelsByGPS(GPS gps) {
        ArrayList<Hotel> hotelsByGPS = new ArrayList<>();
        for (Hotel hotel : hotels) {
            if (hotel.getAddress().checkGPS(gps)) {
                hotelsByGPS.add(hotel);
            }
        }
        return hotelsByGPS;
    }

}
