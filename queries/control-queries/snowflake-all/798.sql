select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,ship_mode sm,customer c,customer_address a
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_hash >= 255 and ws.ws_hash <= 588 and hd.hd_hash >= 194 and hd.hd_hash <= 944 and a.ca_hash >= 262 and a.ca_hash <= 662
;
