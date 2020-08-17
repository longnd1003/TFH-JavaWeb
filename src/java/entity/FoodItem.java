package entity;

/**
 *
 * @author dfsai
 */
public class FoodItem {

    private int foodId;
    private String foodName;
    private int price;
    private Category category;
    private String addedDate;
    private String image;

    public FoodItem() {
    }

    public FoodItem(int foodId, String foodName, int price, Category category, String addedDate, String image) {
        this.foodId = foodId;
        this.foodName = foodName;
        this.price = price;
        this.category = category;
        this.addedDate = addedDate;
        this.image = image;
    }

    public int getFoodId() {
        return foodId;
    }

    public void setFoodId(int foodId) {
        this.foodId = foodId;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getAddedDate() {
        return addedDate;
    }

    public void setAddedDate(String addedDate) {
        this.addedDate = addedDate;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

}
