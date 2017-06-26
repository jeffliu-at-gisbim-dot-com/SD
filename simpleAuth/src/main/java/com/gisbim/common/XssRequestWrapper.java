package com.gisbim.common;

import java.io.InputStream;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.lang.StringEscapeUtils;
import org.owasp.validator.html.AntiSamy;
import org.owasp.validator.html.CleanResults;
import org.owasp.validator.html.Policy;
import org.owasp.validator.html.PolicyException;
import org.owasp.validator.html.ScanException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class XssRequestWrapper extends HttpServletRequestWrapper {

	private static Logger logger = LoggerFactory.getLogger(XssRequestWrapper.class);
	private static Policy policy = null;

	static {
		InputStream inputStream = XssRequestWrapper.class.getResourceAsStream("/antisamy-configuration.xml");

		try {
			logger.debug("" + inputStream);

			policy = Policy.getInstance(inputStream);
		} catch (PolicyException e) {			
			e.printStackTrace();
			logger.error(e.getMessage());
		}
	}

	public XssRequestWrapper(HttpServletRequest request) {
		super(request);
	}

	@Override
	@SuppressWarnings("rawtypes")
	public Map<String, String[]> getParameterMap() {
		Map<String, String[]> request_map = super.getParameterMap();
		Iterator iterator = request_map.entrySet().iterator();
		logger.info("request_map" + request_map.size());
		while (iterator.hasNext()) {
			Map.Entry me = (Map.Entry) iterator.next();
			// System.out.println(me.getKey()+":");
			String[] values = (String[]) me.getValue();
			for (int i = 0; i < values.length; i++) {
				logger.debug(values[i]);
				values[i] = xssClean(values[i]);
			}
		}
		return request_map;
	}

	@Override
	public String[] getParameterValues(String paramString) {
		String[] arrayOfString1 = super.getParameterValues(paramString);
		if (arrayOfString1 == null)
			return null;
		int i = arrayOfString1.length;
		String[] arrayOfString2 = new String[i];
		for (int j = 0; j < i; j++)
			arrayOfString2[j] = xssClean(arrayOfString1[j]);
		return arrayOfString2;
	}

	@Override
	public String getParameter(String paramString) {
		String str = super.getParameter(paramString);
		if (str == null)
			return null;
		return xssClean(str);
	}

	@Override
	public String getHeader(String paramString) {
		String str = super.getHeader(paramString);
		if (str == null)
			return null;
		return xssClean(str);
	}

	private String xssClean(String value) {
		AntiSamy antiSamy = new AntiSamy();
		try {
			// CleanResults cr = antiSamy.scan(dirtyInput, policyFilePath);

			// String policyPath = XssRequestWrapper.class.getClassLoader() +
			// File.separator + "resources" + File.separator
			// + "antisamy-configuration.xml";

			// InputStream inputStream =
			// getClass().getResourceAsStream("/antisamy-configuration.xml");

			// policy.getInstance(inputStream);

			// policy = Policy.getInstance(policyPath);

			// System.out.println("policy_filepath:" + policyPath);

			final CleanResults cr = antiSamy.scan(value, policy);

			String str = StringEscapeUtils.unescapeHtml(cr.getCleanHTML());
			str = str.replace(antiSamy.scan("&nsp;", policy).getCleanHTML(), "");
			// 安全的HTML输出
			return str;
		} catch (ScanException e) {
			e.printStackTrace();
		} catch (PolicyException e) {
			e.printStackTrace();
		}
		return value;
	}
}