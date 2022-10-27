package soap.ex2;

public class Room {

    public enum RoomType {
        SINGLE, DOUBLE, TRIPLE, FAMILY
    }
    private String roomNumber;
    private RoomType type;
    private int price;

    private int capacity;

    public Room() {
    }

    public Room(String roomNumber, RoomType type, int price, int capacity) {
        this.roomNumber = roomNumber;
        this.type = type;
        this.price = price;
        this.capacity = capacity;
    }


    public RoomType getType() {
        return type;
    }

    public int getPrice() {
        return price;
    }

    public int getCapacity() {
        return capacity;
    }

    @Override
    public String toString() {
        return "Room " + roomNumber +
                ", type=" + type +
                ", price=" + price +
                ", capacity=" + capacity;
    }
}
