package com.gisbim.common;

import java.util.ArrayList;
import java.util.List;

/*
 * @author jeff, juain farn, liu 劉君帆 (jeffliu@gisbim.com)
 *  不合理的例外
 *  
 */
public class LogicException extends Exception {
	private static final long serialVersionUID = 1L;
	
	private List<String> messages;
    public LogicException(String messages) {
        super(messages);
    }
    public LogicException(List<String> messages) {
        super((messages != null && messages.size() > 0 ? messages.get(0) : null));
        if (messages == null) {
            this.messages = new ArrayList<String>();
        }
        else {
            this.messages = messages;
        }
    }
    public List<String> getMessages() {
        return messages;
    }  
}
