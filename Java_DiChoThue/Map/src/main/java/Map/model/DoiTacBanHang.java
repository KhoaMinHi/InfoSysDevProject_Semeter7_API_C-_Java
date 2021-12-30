package Map.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class DoiTacBanHang {
	@Id
    @GeneratedValue
    @Column(name = "MaDoiTacBanHang", nullable = false)
	private Integer madoitacbanhang;
	
	@Column(name = "TenDoiTacBH", length = 50)
	private String tendoitacbh;
	
	@Column(name = "SDTDoiTacBH", length = 10)
	private String sdtdoibanbh;
	
	@Column(name = "DiaChi", length = 50)
	private String diachi;
	
	@Column(name = "Latitude", length = 50)
	private Float latitude;
	
	@Column(name = "Longtitude")
	private Float longtitude;
	
	public Integer getMadoitacbanhang() {
		return madoitacbanhang;
	}

	public void setMadoitacbanhang(Integer madoitacbanhang) {
		this.madoitacbanhang = madoitacbanhang;
	}

	public String getTendoitacbh() {
		return tendoitacbh;
	}

	public void setTendoitacbh(String tendoitacbh) {
		this.tendoitacbh = tendoitacbh;
	}

	public String getSdtdoibanbh() {
		return sdtdoibanbh;
	}

	public void setSdtdoibanbh(String sdtdoibanbh) {
		this.sdtdoibanbh = sdtdoibanbh;
	}

	public String getDiachi() {
		return diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}
	
	public Float getLatitude() {
		return latitude;
	}

	public void setLatitude(Float latitude) {
		this.latitude = latitude;
	}

	public Float getLongtitude() {
		return longtitude;
	}

	public void setLongtitude(Float longtitude) {
		this.longtitude = longtitude;
	}


	public DoiTacBanHang(Integer madoitacbanhang, String tendoitacbh, String sdtdoibanbh,
			String diachi, Float latitude, Float longtitude) {
		super();
		this.madoitacbanhang = madoitacbanhang;
		this.tendoitacbh = tendoitacbh;
		this.sdtdoibanbh = sdtdoibanbh;
		this.diachi = diachi;
		this.latitude = latitude;
		this.longtitude = longtitude;
	}	
	
	public DoiTacBanHang() {
		super();
	}
}
