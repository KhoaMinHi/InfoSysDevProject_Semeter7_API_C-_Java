package Map.model;

public class DoiTacBanHangMinDistance {
	Float distance;
	int numberrow;
	DoiTacBanHang doitac;
	public Float getDistance() {
		return distance;
	}
	public void setDistance(Float distance) {
		this.distance = distance;
	}
	public DoiTacBanHang getDoitac() {
		return doitac;
	}
	public void setDoitac(DoiTacBanHang doitac) {
		this.doitac = doitac;
	}
	public int getNumberrow() {
		return numberrow;
	}
	public void setNumberrow(int numberrow) {
		this.numberrow = numberrow;
	}
	
	public DoiTacBanHangMinDistance(Float distance, int numberrow, DoiTacBanHang doitac) {
		super();
		this.distance = distance;
		this.numberrow = numberrow;
		this.doitac = doitac;
	}
	public DoiTacBanHangMinDistance() {
		// TODO Auto-generated constructor stub
	}
	
}
