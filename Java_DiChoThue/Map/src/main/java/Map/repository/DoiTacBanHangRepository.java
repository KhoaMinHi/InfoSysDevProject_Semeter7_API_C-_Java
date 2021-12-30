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
public interface DoiTacBanHangRepository extends JpaRepository<DoiTacBanHang, Long>
{
	@Query(
			value = "select dt.MaDoiTacBanHang, dt.TenDoiTacBH, dt.SDTDoiTacBH, dc.DiaChi, dc.Latitude, dc.Longtitude " + 
					"from DoiTacBanHang dt join DiaChiDoitac dc " + 
					"	on dt.MaDoiTacBanHang=dc.MaDoiTacBanHang",
			nativeQuery= true)
	List<DoiTacBanHang> findDoiTacBanHangLaLongtitudeNative();
}
