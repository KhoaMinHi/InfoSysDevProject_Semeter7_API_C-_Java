package Map.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import Map.model.Shipper;

@EnableJpaRepositories
@Transactional
@Repository
public interface ShipperRepository extends JpaRepository<Shipper, Long>{
	
	
	@Query(
			//value = "select * from Shipper s where s.ViTriHienTai like N'%Khê%' or s.ViTriHienTai like N'%Kỳ%'",
			value = "select MaShipper, CMND, HoTen, Latitude, Longtitude, NgaySin, SoDienThoai, TinhTrangSucKhoe,ViTriHienTai"
					+ " from Shipper s where s.ViTriHienTai like N'%Khê%'",
			nativeQuery= true)
	List<Shipper> findShipperLaLongtitudeNative();
	/*
	@Query(
			value = "select * from Shipper s where s.ViTriHienTai like ?1 or s.ViTriHienTai like ?2",
			nativeQuery= true)
	List<Shipper> findShipperLaLongtitudeNative(String khe, String ky);
	*/
}

