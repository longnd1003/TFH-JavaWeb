package entity;

/**
 *
 * @author dfsai
 */
public class Item {

    private FoodItem food;
    private int quantity;

    public Item() {
    }

    public Item(FoodItem food, int quantity) {
        this.food = food;
        this.quantity = quantity;
    }

    public FoodItem getFood() {
        return food;
    }

    public void setFood(FoodItem food) {
        this.food = food;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
