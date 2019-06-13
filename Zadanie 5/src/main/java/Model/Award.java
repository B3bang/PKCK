package Model;

public enum Award{
    PlatynowaPłyta,
    ZłotaPłyta,
    Brak;

    public String toString() {
       if(this == PlatynowaPłyta)
           return "Platynowa Płyta";
       if(this == ZłotaPłyta)
           return "Złota Płyta";
       else
           return "Brak";

    }
}
