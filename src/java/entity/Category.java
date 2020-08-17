package entity;

/**
 *
 * @author dfsai
 */
public class Category {

    private int categoryId;
    private String categoryName;
    private String image;
    private String addedDate;

    public Category() {
    }

    public Category(int categoryId, String categoryName, String image, String addedDate) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.addedDate = addedDate;
        this.image = image;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
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
