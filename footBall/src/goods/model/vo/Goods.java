package goods.model.vo;

public class Goods {
	private int goodsBCode;
	private int goodsGId;
	private String goodsCategory;
	private String goodsName;
	private String goodsSize;
	private int goodsPrice;
	private int goodsCount;
	public Goods() {
		super();
	}
	public Goods(int goodsBCode, int goodsGId, String goodsCategory, String goodsName, String goodsSize, int goodsPrice,
			int goodsCount) {
		super();
		this.goodsBCode = goodsBCode;
		this.goodsGId = goodsGId;
		this.goodsCategory = goodsCategory;
		this.goodsName = goodsName;
		this.goodsSize = goodsSize;
		this.goodsPrice = goodsPrice;
		this.goodsCount = goodsCount;
	}
	public int getGoodsBCode() {
		return goodsBCode;
	}
	public void setGoodsBCode(int goodsBCode) {
		this.goodsBCode = goodsBCode;
	}
	public int getGoodsGId() {
		return goodsGId;
	}
	public void setGoodsGId(int goodsGId) {
		this.goodsGId = goodsGId;
	}
	public String getGoodsCategory() {
		return goodsCategory;
	}
	public void setGoodsCategory(String goodsCategory) {
		this.goodsCategory = goodsCategory;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsSize() {
		return goodsSize;
	}
	public void setGoodsSize(String goodsSize) {
		this.goodsSize = goodsSize;
	}
	public int getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public int getGoodsCount() {
		return goodsCount;
	}
	public void setGoodsCount(int goodsCount) {
		this.goodsCount = goodsCount;
	}
	
}
