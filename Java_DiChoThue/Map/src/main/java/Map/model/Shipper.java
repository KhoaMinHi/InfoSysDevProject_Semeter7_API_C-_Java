package Map.model;


import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Shipper" )
public class Shipper {
	@Id
    @GeneratedValue
    @Column(name = "MaShipper", nullable = false)
	private Integer mashipper;
	
	@Column(name = "HoTen", length = 50)
	private String hoten;
	
	@Column(name = "NgaySinh")
	private LocalDate ngaysinh;
	
	@Column(name = "SoDienThoai")
	private String sodienthoai;
	
	@Column(name = "CMND")
	private String cmnd;
	
	@Column(name = "TinhTrangSucKhoe")
	private Integer tinhtrangsuckhoe;
	
	@Column(name = "ViTriHienTai")
	private String vitrihientai;
	
	@Column(name = "Latitude")
	private Float latitude;

	@Column(name = "Longtitude")
	private Float longtitude;
	
	public Integer getMaShipper() {
		return mashipper;
	}
	
	public String getHoTen() {
		return hoten;
	}
	public void setHoTen(String hoten) {
		this.hoten = hoten;
	}
	public LocalDate getNgaySinh() {
		return ngaysinh;
	}
	public void setNgaySinh(LocalDate ngaysinh) {
		this.ngaysinh = ngaysinh;
	}
	public String getSoDienThoai() {
		return sodienthoai;
	}
	public void setSoDienThoai(String sodienthoai) {
		this.sodienthoai = sodienthoai;
	}
	public String getCMND() {
		return cmnd;
	}
	public void setCMND(String cmnd) {
		this.cmnd = cmnd;
	}
	public Integer getTinhTrangSucKhoe() {
		return tinhtrangsuckhoe;
	}
	public void setTinhTrangSucKhoe(Integer tinhtrangsuckhoe) {
		this.tinhtrangsuckhoe = tinhtrangsuckhoe;
	}
	public String getViTriHienTai() {
		return vitrihientai;
	}
	public void setViTriHienTai(String vitrihientai) {
		this.vitrihientai = vitrihientai;
	}
	public void setLatitude(Float latitude) {
		this.latitude = latitude;
	}
	public Float getLatitude() {
		return latitude;
	}
	public void setLongtitude(Float longtitude) {
		this.longtitude = longtitude;
	}
	public Float getLongtitude() {
		return longtitude;
	}
	
	public Shipper(Integer mashipper, String hoten, LocalDate ngaysinh, String sodienthoai, String cmnd, 
					Integer tinhtrangsuckhoe, String vitrihientai, Float longtitude, Float latitude) {
		super();
		this.mashipper = mashipper;
		this.hoten = hoten;
		this.ngaysinh = ngaysinh;
		this.sodienthoai = sodienthoai;
		this.cmnd=cmnd;
		this.tinhtrangsuckhoe=tinhtrangsuckhoe;
		this.vitrihientai=vitrihientai;
		this.longtitude = longtitude;
		this.latitude = latitude;
	}
	
	public Shipper() {
		super();
	}
}

