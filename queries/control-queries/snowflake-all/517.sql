select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer c,date_dim d,customer_address a
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_hash >= 211 and ws.ws_hash <= 544 and c.c_hash >= 323 and c.c_hash <= 723 and d.d_hash >= 14 and d.d_hash <= 764
;
