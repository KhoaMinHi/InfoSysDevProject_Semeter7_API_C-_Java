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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import Map.model.Shipper;
import Map.model.ShipperAndAPIDistances;
import Map.repository.ShipperRepository;

@CrossOrigin // Access to XMLHttpRequest has been blocked by CORS policy
@RestController
@RequestMapping("/api")
public class ShipperController {
	@Autowired
	ShipperRepository repo;

	String mywaypoint = "15.217829, 108.885161";
	String otherwaypoint;
	String bingMapKey = "AiacEpsBR4osxFZz9QUBlM_SyznWpTCoLsXquKyFKugM_khBEq7bGNalUngVCN1L";
	// http://dev.virtualearth.net/REST/V1/Routes?wp.0=37.779160067439079,-122.42004945874214&wp.1=32.715685218572617,-117.16172486543655&key={BingMapsKey}
	String uri = "http://dev.virtualearth.net/REST/V1/Routes?wp.0=" + mywaypoint + "&wp.1=" + otherwaypoint + "&key="
			+ bingMapKey;
	String jsonBingMap;
	Float distance;
	
	//api
	@GetMapping("/mindistance")
	public ResponseEntity<List<ShipperAndAPIDistances>> CalculateDistances() {
		try {
			// create by Shipper and Distance constructor to contain the result
			List<ShipperAndAPIDistances> shipperlst = new ArrayList<ShipperAndAPIDistances>();
			// caculate min Distance and add Shipper min distance
			
			shipperlst.add(caculateMinDirection().get(0));

			if (shipperlst.isEmpty()) {
				return new ResponseEntity<>(HttpStatus.NO_CONTENT);
			}

			return new ResponseEntity<>(shipperlst, HttpStatus.OK);

		} catch (Exception e) {

			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	
	
	//code caculation
	public ShipperAndAPIDistances findMin(List<ShipperAndAPIDistances> list) {
		ShipperAndAPIDistances maxDistance = list.stream()
				.min(Comparator.comparingDouble(ShipperAndAPIDistances::getKm))
				.orElseThrow(NoSuchElementException::new);
		return maxDistance;
	}

	public List<ShipperAndAPIDistances> caculateMinDirection() {
		//2 others point
		//String[] vitri = { "N'%Khê%'", "N'%Kỳ%'" };
		//create Shipper and Distance to contain value
		List<ShipperAndAPIDistances> shipperDistanceList = new ArrayList<ShipperAndAPIDistances>();
		//return result
		List<ShipperAndAPIDistances> shipperDistanceListResult = new ArrayList<ShipperAndAPIDistances>();
		//declare a variable where we save the value from query to database
		List<Shipper> shipperlst = new ArrayList<Shipper>();
		//repo.findAll();
		shipperlst = repo.findAll();
		//repo.findAll().forEach(shipperlst::add);
		//repo.findShipperLaLongtitudeNative(vitri[0], vitri[1]).forEach(shipperlst::add);

		if (shipperlst.isEmpty()) {
			return null;
		}
		
		//tính toán khoảng cách
		for(Shipper shipper : shipperlst) {
			
			if(shipper.getLatitude() != null || shipper.getLongtitude() != null) {
				otherwaypoint = String.valueOf(shipper.getLatitude()) + "," + String.valueOf(shipper.getLongtitude());
				uri = "http://dev.virtualearth.net/REST/V1/Routes?wp.0=" + mywaypoint + "&wp.1=" + otherwaypoint + "&key=" + bingMapKey;
				
				//thực thi gọi api bing map
				RestTemplate restTemplate = new RestTemplate();
				jsonBingMap = restTemplate.getForObject(uri, String.class);
				
				//parse thành json
				Gson gson = new Gson();
				JsonObject jOb = gson.fromJson(jsonBingMap, JsonObject.class);
				JsonArray jArr = jOb.getAsJsonArray("resourceSets");
				JsonObject jObjArr = jArr.get(0).getAsJsonObject(); 
				JsonArray jArrResources = jObjArr.getAsJsonArray("resources");//resources
				JsonObject jObjArrResources = jArrResources.get(0).getAsJsonObject();
				distance = jObjArrResources.get("travelDistance").getAsFloat();
				
				
				//tạo shipper distance
				ShipperAndAPIDistances e = new ShipperAndAPIDistances();
				e.setKm(distance);
				e.setShipper(shipper);
				shipperDistanceList.add(e);
			}
		}
		
		//compare every distance
		shipperDistanceListResult.add(findMin(shipperDistanceList));
		
		
		
		return shipperDistanceListResult;
	}

	
}
