package Map.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import Map.model.DoiTacBanHang;

@EnableJpaRepositories
@Transactional
@Repository
public interface DoiTacBanHangRepository extends JpaRepository<DoiTacBanHangRepository, Long>
{
	@Query(
			//value = "select * from Shipper s where s.ViTriHienTai like N'%Khê%' or s.ViTriHienTai like N'%Kỳ%'",
			value = "select * from Shipper s where s.ViTriHienTai like N'%Khê%'",
			nativeQuery= true)
	List<DoiTacBanHang> findDoiTacBanHangLaLongtitudeNative();
}
