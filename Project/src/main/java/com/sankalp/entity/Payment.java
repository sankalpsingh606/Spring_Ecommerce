package com.sankalp.entity;

public class Payment {
private String cardName;
private int cardNumber;
private int cvc;
private int validity;
public String getCardName() {
	return cardName;
}
public void setCardName(String cardName) {
	this.cardName = cardName;
}
public int getCardNumber() {
	return cardNumber;
}
public void setCardNumber(int cardNumber) {
	this.cardNumber = cardNumber;
}
public int getCvc() {
	return cvc;
}
public void setCvc(int cvc) {
	this.cvc = cvc;
}
public int getValidity() {
	return validity;
}
public void setValidity(int validity) {
	this.validity = validity;
}

}