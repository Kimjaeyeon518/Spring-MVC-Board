package com.spring.board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.common.ResultUtil;
import com.spring.board.dto.DataDto;
import com.spring.board.dto.DataFileDto;
import com.spring.board.form.DataFileForm;
import com.spring.board.form.DataForm;
import com.spring.board.service.DataService;

@Controller
@RequestMapping(value = "/data")
public class DataController {

	@Autowired
	private DataService dataService;

	/** �ڷ�� - ��� ������ �̵� */
	@RequestMapping(value = "/dataList")
	public String dataList(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "data/dataList";
	}

	/** �ڷ�� - ��� ��ȸ */
	@RequestMapping(value = "/getDataList")
	@ResponseBody
	public ResultUtil getDataList(HttpServletRequest request, HttpServletResponse response, DataForm dataForm) throws Exception {

		ResultUtil resultUtils = dataService.getDataList(dataForm);

		return resultUtils;
	}

	/** �ڷ�� - �� ������ �̵� */
	@RequestMapping(value = "/dataDetail")
	public String dataDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "data/dataDetail";
	}

	/** �ڷ�� - �� ��ȸ */
	@RequestMapping(value = "/getDataDetail")
	@ResponseBody
	public DataDto getDataDetail(HttpServletRequest request, HttpServletResponse response, DataForm dataForm) throws Exception {

		DataDto dataDto = dataService.getDataDetail(dataForm);

		return dataDto;
	}
	
	/** �ڷ�� - �� ��ȸ */
	@RequestMapping(value = "/getdataPw")
	@ResponseBody
	public DataDto getdataPw(HttpServletRequest request, HttpServletResponse response, DataForm dataForm) throws Exception {

		DataDto dataDto = dataService.getdataPw(dataForm);

		return dataDto;
	}

	/** �ڷ�� - �ۼ� ������ �̵� */
	@RequestMapping(value = "/dataWrite")
	public String dataWrite(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "data/dataWrite";
	}

	/** �ڷ�� - ��� */
	@RequestMapping(value = "/insertData")
	@ResponseBody
	public DataDto insertData(HttpServletRequest request, HttpServletResponse response, DataForm dataForm) throws Exception {

		DataDto dataDto = dataService.insertData(dataForm);
		
		return dataDto;
	}

	/** �ڷ�� - ���� */
	@RequestMapping(value = "/deleteData")
	@ResponseBody
	public DataDto deleteData(HttpServletRequest request, HttpServletResponse response, DataForm dataForm) throws Exception {

		DataDto dataDto = dataService.deleteData(dataForm);

		return dataDto;
	}

	/** �ڷ�� - ���� ������ �̵� */
	@RequestMapping(value = "/dataUpdate")
	public String dataUpdate(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "data/dataUpdate";
	}
	
	@RequestMapping(value = "/dataUpdateAction")
	public String dataUpdateAction(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "data/dataUpdateAction";
	}

	/** �ڷ�� - ���� */
	@RequestMapping(value = "/updateData")
	@ResponseBody
	public DataDto updateData(HttpServletRequest request, HttpServletResponse response, DataForm dataForm) throws Exception {

		DataDto dataDto = dataService.updateData(dataForm);

		return dataDto;
	}

	/** �Խ��� - ÷������ �ٿ�ε� */
	@RequestMapping("/fileDownload")	                  
	public ModelAndView fileDownload(@RequestParam("fileNameKey") String fileNameKey
									,@RequestParam("fileName") String fileName
								    ,@RequestParam("filePath") String filePath) throws Exception {
	 	 
	    /** ÷������ ���� ��ȸ */
	    Map<String, Object> fileInfo = new HashMap<String, Object>();
	    fileInfo.put("fileNameKey", fileNameKey);
	    fileInfo.put("fileName", fileName);
	    fileInfo.put("filePath", filePath);
	 
	    return new ModelAndView("fileDownloadUtil", "fileInfo", fileInfo);
	}
	

}
