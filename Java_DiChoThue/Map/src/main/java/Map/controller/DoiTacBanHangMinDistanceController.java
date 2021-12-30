package Map.controller;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.NoSuchElementException;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import Map.model.DoiTacBanHang;
import Map.model.DoiTacBanHangMinDistance;
import Map.repository.DoiTacBanHangRepository;

@CrossOrigin // Access to XMLHttpRequest has been blocked by CORS policy
@RestController
@RequestMapping("/api")
public class DoiTacBanHangMinDistanceController {
	@Autowired
	DoiTacBanHangRepository repo;

	String mywaypoint = "15.217829, 108.885161";
	String otherwaypoint;
	String bingMapKey = "AiacEpsBR4osxFZz9QUBlM_SyznWpTCoLsXquKyFKugM_khBEq7bGNalUngVCN1L";
	// http://dev.virtualearth.net/REST/V1/Routes?wp.0=37.779160067439079,-122.42004945874214&wp.1=32.715685218572617,-117.16172486543655&key={BingMapsKey}
	String uri = "http://dev.virtualearth.net/REST/V1/Routes?wp.0=" + mywaypoint + "&wp.1=" + otherwaypoint + "&key="
			+ bingMapKey;
	String jsonBingMap;
	Float distance;

	// api
	@GetMapping("/mindistancepartner/{currentPage}/{perPage}")
	public ResponseEntity<List<DoiTacBanHangMinDistance>> CalculateDistances(@PathVariable String currentPage, 
			@PathVariable String perPage) 
	{
		int numList = Integer.parseInt(currentPage) * Integer.parseInt(perPage);
		
		
		try {
			// create by DoiTacBanHang and Distance constructor to contain the result
			List<DoiTacBanHangMinDistance> doitaclst = new ArrayList<DoiTacBanHangMinDistance>();
			// caculate min Distance and add DoiTacBanHang min distance
			for(int i = 0; i < numList; i++) {
				doitaclst.add(caculateMinDirection().get(i));
			}
			

			if (doitaclst.isEmpty()) {
				return new ResponseEntity<>(HttpStatus.NO_CONTENT);
			}

			return new ResponseEntity<>(doitaclst, HttpStatus.OK);

		} catch (Exception e) {

			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// code caculation
	public DoiTacBanHangMinDistance findMin(List<DoiTacBanHangMinDistance> list) {
		DoiTacBanHangMinDistance maxDistance = list.stream()
				.min(Comparator.comparingDouble(DoiTacBanHangMinDistance::getDistance))
				.orElseThrow(NoSuchElementException::new);
		return maxDistance;
	}

	public List<DoiTacBanHangMinDistance> caculateMinDirection() {

		// tao danh sach doi tac ban hang va distance de chuyen doi
		List<DoiTacBanHangMinDistance> doitacDistanceList = new ArrayList<DoiTacBanHangMinDistance>();

		// tao danh sach doi tac ban hang va distance de return
		//List<DoiTacBanHangMinDistance> doitacDistanceListResult = new ArrayList<DoiTacBanHangMinDistance>();

		// tao danh sach doi tac ban hang de tinh toan distance dua vao latitude va
		// longtitude
		List<DoiTacBanHang> doitaclst = new ArrayList<DoiTacBanHang>();

		// tim danh danh sach cua hang
		doitaclst = repo.findDoiTacBanHangLaLongtitudeNative();

		if (doitaclst.isEmpty()) {
			return null;
		}

		// tính toán khoảng cách
		for (DoiTacBanHang doitac : doitaclst) {

			if (doitac.getLatitude() != null || doitac.getLongtitude() != null) {
				otherwaypoint = String.valueOf(doitac.getLatitude()) + "," + String.valueOf(doitac.getLongtitude());
				uri = "http://dev.virtualearth.net/REST/V1/Routes?wp.0=" + mywaypoint + "&wp.1=" + otherwaypoint
						+ "&key=" + bingMapKey;

				// thực thi gọi api bing map
				RestTemplate restTemplate = new RestTemplate();
				jsonBingMap = restTemplate.getForObject(uri, String.class);

				// parse thành json
				Gson gson = new Gson();
				JsonObject jOb = gson.fromJson(jsonBingMap, JsonObject.class);
				JsonArray jArr = jOb.getAsJsonArray("resourceSets");
				JsonObject jObjArr = jArr.get(0).getAsJsonObject();
				JsonArray jArrResources = jObjArr.getAsJsonArray("resources");// resources
				JsonObject jObjArrResources = jArrResources.get(0).getAsJsonObject();
				distance = jObjArrResources.get("travelDistance").getAsFloat();

				// tạo doitac distance
				DoiTacBanHangMinDistance e = new DoiTacBanHangMinDistance();
				e.setDistance(distance);
				e.setDoitac(doitac);
				doitacDistanceList.add(e);
			}
		}

		// compare every distance
		//doitacDistanceListResult.add(findMin(doitacDistanceList));
		//ascending
		doitacDistanceList.sort(Comparator.comparing(DoiTacBanHangMinDistance::getDistance));;
		
		return doitacDistanceList;
		//return doitacDistanceListResult;
	}

}
