select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer c,ship_mode sm,customer_address a
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_hash >= 465 and ws.ws_hash <= 865 and c.c_hash >= 54 and c.c_hash <= 804 and a.ca_hash >= 171 and a.ca_hash <= 504
;
