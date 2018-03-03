package cn.ghang.store.bean;

import java.io.Serializable;

public class ResponseResult<T> implements Serializable {
	private static final long serialVersionUID = -7012951480808465407L;

	public static final int STATE_OK = 1;
	public static final int STATE_ERROR = -1;

	private int state;
	private String message;
	private T data;

	public ResponseResult() {
		super();
	}

	public ResponseResult(int state, String message) {
		super();
		this.state = state;
		this.message = message;
	}

	public ResponseResult(int state, T data) {
		super();
		this.state = state;
		this.data = data;
	}

	public ResponseResult(int state, String message, T data) {
		super();
		this.state = state;
		this.message = message;
		this.data = data;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((data == null) ? 0 : data.hashCode());
		result = prime * result + ((message == null) ? 0 : message.hashCode());
		result = prime * result + state;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ResponseResult<?> other = (ResponseResult<?>) obj;
		if (data == null) {
			if (other.data != null)
				return false;
		} else if (!data.equals(other.data))
			return false;
		if (message == null) {
			if (other.message != null)
				return false;
		} else if (!message.equals(other.message))
			return false;
		if (state != other.state)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ResponseResult [state=" + state + ", message=" + message + ", data=" + data + "]";
	}

}
