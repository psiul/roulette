select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer c,customer_address a,household_demographics hd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and sm.sm_hash >= 609 and sm.sm_hash <= 942 and a.ca_hash >= 219 and a.ca_hash <= 969 and hd.hd_hash >= 361 and hd.hd_hash <= 761
;
