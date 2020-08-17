package entity;

/**
 *
 * @author dfsai
 */
public class OrderDetail {

    private int orderId;
    private int foodId;
    private int price;
    private String deliveryAddress;
    private int quantity;

    public OrderDetail() {
    }

    public OrderDetail(int orderId, int foodId, int price, String deliveryAddress, int quantity) {
        this.orderId = orderId;
        this.foodId = foodId;
        this.price = price;
        this.deliveryAddress = deliveryAddress;
        this.quantity = quantity;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getFoodId() {
        return foodId;
    }

    public void setFoodId(int foodId) {
        this.foodId = foodId;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
