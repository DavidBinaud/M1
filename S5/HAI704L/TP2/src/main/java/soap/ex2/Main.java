package soap.ex2;

public class Main {
    public static void main(String[] args) {
        BookingSoftware software = new BookingSoftware();
        Hotel hilton = new Hotel("Hilton", new Address("75", "Hilton Street", "Dublin", "Ireland", new GPS(0, 0)), 2);
        hilton.addRoom(new Room("01", Room.RoomType.SINGLE, 50, 1));
        hilton.addRoom(new Room("02", Room.RoomType.DOUBLE, 100, 2));
        hilton.addRoom(new Room("03", Room.RoomType.TRIPLE, 150, 3));
        hilton.addRoom(new Room("04", Room.RoomType.FAMILY, 200, 4));
        software.addHotel(hilton);

        Hotel marriot = new Hotel("Marriot", new Address("18", "Marriot Street", "Dublin", "Ireland", new GPS(1, 5)), 3);
        marriot.addRoom(new Room("01", Room.RoomType.SINGLE, 75, 1));
        marriot.addRoom(new Room("02", Room.RoomType.DOUBLE, 150, 2));
        marriot.addRoom(new Room("03", Room.RoomType.TRIPLE, 225, 3));
        marriot.addRoom(new Room("04", Room.RoomType.FAMILY, 300, 4));
        software.addHotel(marriot);

        System.out.println("Hotels in Dublin:");
        for (Hotel hotel : software.getHotelsByCity("Dublin")) {
            System.out.println(hotel );
        }

    }
}
