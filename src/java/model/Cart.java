package model;

import entity.Item;
import java.util.ArrayList;

/**
 *
 * @author dfsai
 */
public class Cart {

    ArrayList<Item> cart;
    int sum;

    public Cart() {
        cart = new ArrayList<>();
        sum = 0;
    }

    private Item getItemById(int id) {
        for (Item i : cart) {
            if (i.getFood().getFoodId() == id) {
                return i;
            }
        }
        return null;
    }

    public void addItem(Item i) {
        if (getItemById(i.getFood().getFoodId()) != null) {
            Item m = getItemById(i.getFood().getFoodId());
            m.setQuantity(m.getQuantity() + i.getQuantity());
        } else {
            cart.add(i);
        }
        sum++;
    }

    public void deleteItem(Item i) {
        if (getItemById(i.getFood().getFoodId()) != null) {
            cart.remove(getItemById(i.getFood().getFoodId()));
        }
        sum--;
    }

    public ArrayList<Item> getCart() {
        return cart;
    }

    public int getSum() {
        return sum;
    }

    public void setSum(int sum) {
        this.sum = sum;
    }

    public int totalMoney() {
        int total = 0;
        total = cart.stream().map((i) -> i.getFood().getPrice() * i.getQuantity()).reduce(total, Integer::sum);
        return total;
    }

}
