package soap.ex2;

import java.util.ArrayList;
import java.util.Arrays;

public class Hotel {
    private String name;
    private Address address;
    private ArrayList<Room> rooms;

    private int stars;

    public Hotel() {
    }

    public Hotel(String name, Address address) {
        this.name = name;
        this.address = address;
        rooms = new ArrayList<>();
    }

    public Hotel(String name, Address address, int stars) {
        this(name, address);
        this.stars = stars;
        rooms = new ArrayList<>();
    }

    public Hotel(String name, Address address, ArrayList<Room> rooms) {
        this.name = name;
        this.address = address;
        this.rooms = rooms;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public ArrayList<Room> getRooms() {
        return rooms;
    }

    public void setRooms(ArrayList<Room>rooms) {
        this.rooms = rooms;
    }

    public void addRoom(Room room) {
        rooms.add(room);
    }

    public void removeRoom(Room room) {
        rooms.remove(room);
    }

    public ArrayList<Room> getRoomsByType(Room.RoomType type) {
        ArrayList<Room> roomsByType = new ArrayList<>();
        for (Room room : rooms) {
            if (room.getType().equals(type)) {
                roomsByType.add(room);
            }
        }
        return roomsByType;
    }

    public ArrayList<Room> getRoomsByPrice(double price) {
        ArrayList<Room> roomsByPrice = new ArrayList<>();
        for (Room room : rooms) {
            if (room.getPrice() <= price) {
                roomsByPrice.add(room);
            }
        }
        return roomsByPrice;
    }

    public ArrayList<Room> getRoomsByCapacity(int capacity) {
        ArrayList<Room> roomsByCapacity = new ArrayList<>();
        for (Room room : rooms) {
            if (room.getCapacity() >= capacity) {
                roomsByCapacity.add(room);
            }
        }
        return roomsByCapacity;
    }

    public ArrayList<Room> getRoomsByPriceAndCapacity(double price, int capacity) {
        ArrayList<Room> roomsByPriceAndCapacity = new ArrayList<>();
        for (Room room : rooms) {
            if (room.getPrice() <= price && room.getCapacity() >= capacity) {
                roomsByPriceAndCapacity.add(room);
            }
        }
        return roomsByPriceAndCapacity;
    }

    public ArrayList<Room> getRoomsByTypeAndPrice(Room.RoomType type, double price) {
        ArrayList<Room> roomsByTypeAndPrice = new ArrayList<>();
        for (Room room : rooms) {
            if (room.getType().equals(type) && room.getPrice() <= price) {
                roomsByTypeAndPrice.add(room);
            }
        }
        return roomsByTypeAndPrice;
    }

    public ArrayList<Room> getRoomsByTypeAndCapacity(Room.RoomType type, int capacity) {
        ArrayList<Room> roomsByTypeAndCapacity = new ArrayList<>();
        for (Room room : rooms) {
            if (room.getType().equals(type) && room.getCapacity() >= capacity) {
                roomsByTypeAndCapacity.add(room);
            }
        }
        return roomsByTypeAndCapacity;
    }

    public ArrayList<Room> getRoomsByTypeAndPriceAndCapacity(Room.RoomType type, double price, int capacity) {
        ArrayList<Room> roomsByTypeAndPriceAndCapacity = new ArrayList<>();
        for (Room room : rooms) {
            if (room.getType().equals(type) && room.getPrice() <= price && room.getCapacity() >= capacity) {
                roomsByTypeAndPriceAndCapacity.add(room);
            }
        }
        return roomsByTypeAndPriceAndCapacity;
    }

    @Override
    public String toString() {
        return "Hotel{ name='" + name + '\'' +
                ", address=" + address +
                ", rooms=" + Arrays.toString(rooms.toArray()) +
                ", stars=" + stars +
                '}';
    }
}
