package Map.model;

import java.time.LocalDate;

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
	
	@Column(name = "emailDoiTacBH", length = 50)
	private String emaildoitacbh;
	
	@Column(name = "ngayBatDauBan")
	private LocalDate ngaybatdauban;
	
	@Column(name = "DiaChi", length = 50)
	private String diachi;
	
	@Column(name = "KhuVuc", length = 10)
	private String khuvuc;

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

	public String getEmaildoitacbh() {
		return emaildoitacbh;
	}

	public void setEmaildoitacbh(String emaildoitacbh) {
		this.emaildoitacbh = emaildoitacbh;
	}

	public LocalDate getNgaybatdauban() {
		return ngaybatdauban;
	}

	public void setNgaybatdauban(LocalDate ngaybatdauban) {
		this.ngaybatdauban = ngaybatdauban;
	}

	public String getDiachi() {
		return diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	public String getKhuvuc() {
		return khuvuc;
	}

	public void setKhuvuc(String khuvuc) {
		this.khuvuc = khuvuc;
	}

	public DoiTacBanHang() {
		// TODO Auto-generated constructor stub
	}

	public DoiTacBanHang(Integer madoitacbanhang, String tendoitacbh, String sdtdoibanbh, String emaildoitacbh,
			LocalDate ngaybatdauban, String diachi, String khuvuc) {
		super();
		this.madoitacbanhang = madoitacbanhang;
		this.tendoitacbh = tendoitacbh;
		this.sdtdoibanbh = sdtdoibanbh;
		this.emaildoitacbh = emaildoitacbh;
		this.ngaybatdauban = ngaybatdauban;
		this.diachi = diachi;
		this.khuvuc = khuvuc;
	}

	
}
