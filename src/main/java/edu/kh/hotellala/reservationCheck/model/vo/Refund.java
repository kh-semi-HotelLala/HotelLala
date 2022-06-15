package edu.kh.hotellala.reservationCheck.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Refund {
	
	private int refundNo;
	private int paymentNo;
	private String refundFlags;
	private Date refundDate;
	private String refundReason; 
}