package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.service.IBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

@RestController(value = "buildingAPIOfAdmin")
@RequestMapping("/api/building")
public class BuildingAPI {
    @Autowired
    private IBuildingService iBuildingService ;
//    @PostMapping
//    public ResponseEntity<BuildingDTO> AddOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO){
//        // xuống db để update
//        return ResponseEntity.ok(iBuildingService.addOrUpdate(buildingDTO));
//    }
    // Tôi đang ở nhánh handmade
    @PostMapping
    public ResponseEntity<BuildingDTO> addOrUpdateBuilding(
        @ModelAttribute BuildingDTO buildingDTO,
        @RequestParam("file") MultipartFile file) throws IOException {

    // Kiểm tra và xử lý file ảnh
    if (file != null && !file.isEmpty()) {

        String uploadDir = "uploads";
        File uploadDirFile = new File(uploadDir);
        if (!uploadDirFile.exists()) {
            uploadDirFile.mkdirs();
        }

        String fileName = file.getOriginalFilename();
        String filePath = uploadDir + fileName;

        try {
            file.transferTo(new File(filePath)); // Lưu tệp vào thư mục uploads
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }

        // Lưu đường dẫn file vào DTO (hoặc lưu theo logic của bạn)
        buildingDTO.setImageName(fileName);
    }

    // Tiến hành lưu hoặc cập nhật building xuống database
    BuildingDTO savedBuilding = iBuildingService.addOrUpdate(buildingDTO);

    return ResponseEntity.ok(savedBuilding);
}
    @DeleteMapping("/{ids}")
    public ResponseEntity<Void> DeleteBuilding(@PathVariable List<Long> ids){
        iBuildingService.Delete(ids);
        return ResponseEntity.noContent().build();
    }
    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffofBuilding(@PathVariable Long id){
       ResponseDTO result = iBuildingService.listStaffs(id) ;
       return result ;
    }

    //api giao tòa nhà , xóa dữ liệu cũ thêm mới
    @PostMapping("/assignment")
    public ResponseEntity<Void>  updateAssignmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO){
        iBuildingService.UpdateAssignmentBuilding(assignmentBuildingDTO);
        System.out.println("Ok");
        return ResponseEntity.noContent().build();
    }
//    Note : Kiến thưc mới : ResponseEntity : trả lời API
}
