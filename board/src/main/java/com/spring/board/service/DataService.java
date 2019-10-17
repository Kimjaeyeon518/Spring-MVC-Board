package com.spring.board.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spring.board.common.PagingUtil;
import com.spring.board.common.ResultUtil;
import com.spring.board.dao.DataDao;
import com.spring.board.dto.CommonDto;
import com.spring.board.dto.DataDto;
import com.spring.board.form.CommonForm;
import com.spring.board.form.DataFileForm;
import com.spring.board.form.DataForm;

@Service
public class DataService {

	@Autowired
	private DataDao dataDao;
	
	public ResultUtil getDataList(DataForm dataForm) throws Exception {
		System.out.println(dataForm.getFunction_name());
		ResultUtil resultUtil = new ResultUtil();

		CommonDto commonDto = new CommonDto();

		int totalCount = dataDao.getDataCnt(dataForm);
		if (totalCount != 0) {
			CommonForm commonForm = new CommonForm();
			commonForm.setFunction_name(dataForm.getFunction_name());
			commonForm.setCurrent_page_no(dataForm.getCurrent_page_no());
			System.out.println(dataForm.getCurrent_page_no());
			commonForm.setCount_per_page(10);
			commonForm.setCount_per_list(10);
			commonForm.setTatal_list_count(totalCount);
			System.out.println("컴온:" + commonForm);
			commonDto = PagingUtil.setPageUtil(commonForm);
		}

		dataForm.setLimit(commonDto.getLimit());
		dataForm.setOffset(commonDto.getOffset());

		List<DataDto> list = dataDao.getDataList(dataForm);


		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		resultMap.put("totalCount", totalCount);
		resultMap.put("pagination", commonDto.getPagination());

		resultUtil.setData(resultMap);
		resultUtil.setState("SUCCESS");

		return resultUtil;
	}

	public DataDto getDataDetail(DataForm dataForm) throws Exception {
		DataDto dataDto = new DataDto();

		String searchType = dataForm.getSearch_type();

		if ("S".equals(searchType)) {

			dataDao.updateDataHits(dataForm);
		}

		dataDto = dataDao.getDataDetail(dataForm);
		
		DataFileForm dataFileForm = new DataFileForm();
		dataFileForm.setData_seq(dataForm.getData_seq());

		dataDto.setFiles(dataDao.getDataFileList(dataFileForm));

		return dataDto;
	}

	public DataDto getdataPw(DataForm dataForm) throws Exception {
		
		DataDto dataDto = new DataDto();

		dataDto = dataDao.getDataPw(dataForm);
		
		return dataDto;
	}

	public DataDto insertData(DataForm dataForm) throws Exception {
		DataDto dataDto = new DataDto();

		int insertCnt = 0;

		insertCnt = dataDao.insertData(dataForm);

		List<DataFileForm> dataFileList = getDataFileInfo(dataForm);

		for (DataFileForm dataFileForm : dataFileList) {
			dataDao.insertDataFile(dataFileForm);
		}
		
		System.out.println(dataDto.getData_subject());

		if (insertCnt > 0) {
			dataDto.setResult("SUCCESS");
		} else {
			dataDto.setResult("FAIL");
		}

		return dataDto;
	}

	private List<DataFileForm> getDataFileInfo(DataForm dataForm) throws Exception {
		List<MultipartFile> files = dataForm.getFiles();

		List<DataFileForm> dataFileList = new ArrayList<DataFileForm>();

		DataFileForm dataFileForm = new DataFileForm();

		int dataSeq = dataForm.getData_seq();
		String fileName = null;
		String fileExt = null;
		String fileNameKey = null;
		String fileSize = null;
		// 파일이 저장될 Path 설정
		String filePath = "C:\\board\\file";

		if (files != null && files.size() > 0) {

			File file = new File(filePath);

			// 디렉토리가 없으면 생성
			if (file.exists() == false) {
				file.mkdirs();
			}

			for (MultipartFile multipartFile : files) {

				fileName = multipartFile.getOriginalFilename();
				fileExt = fileName.substring(fileName.lastIndexOf("."));
				// 파일명 변경(uuid로 암호화) + 확장자
				fileNameKey = getRandomString() + fileExt;
				fileSize = String.valueOf(multipartFile.getSize());

				// 설정한 Path에 파일 저장
				file = new File(filePath + "/" + fileNameKey);

				multipartFile.transferTo(file);

				dataFileForm = new DataFileForm();
				dataFileForm.setData_seq(dataSeq);
				dataFileForm.setFile_name(fileName);
				dataFileForm.setFile_name_key(fileNameKey);
				dataFileForm.setFile_path(filePath);
				dataFileForm.setFile_size(fileSize);
				dataFileList.add(dataFileForm);
			}
		}

		return dataFileList;
	}


	public DataDto deleteData(DataForm dataForm) throws Exception {
		
		DataDto dataDto = new DataDto();

		int deleteCnt = dataDao.deleteData(dataForm);

		if (deleteCnt > 0) {
			dataDto.setResult("SUCCESS");
		} else {
			dataDto.setResult("FAIL");
		}

		return dataDto;
	}

	public DataDto updateData(DataForm dataForm) throws Exception {
		
		DataDto dataDto = new DataDto();

		int deleteCnt = dataDao.updateData(dataForm);

		List<DataFileForm> dataFileList = getDataFileInfo(dataForm);

		for (DataFileForm dataFileForm : dataFileList) {
			dataDao.updateDataFile(dataFileForm);
		}
		
		if (deleteCnt > 0) {
			dataDto.setResult("SUCCESS");
		} else {
			dataDto.setResult("FAIL");
		}

		return dataDto;
	}
	
	private String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

}
