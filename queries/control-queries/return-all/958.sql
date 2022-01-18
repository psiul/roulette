select count(ws.ws_item_sk)
from web_sales ws,customer c,customer_address a,ship_mode sm,household_demographics hd
where ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 609 and ws.ws_hash <= 942 and c.c_hash >= 82 and c.c_hash <= 832 and a.ca_hash >= 506 and a.ca_hash <= 906
;
