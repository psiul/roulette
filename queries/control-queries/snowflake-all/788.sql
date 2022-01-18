select count(ws.ws_item_sk)
from web_sales ws,customer c,date_dim d,ship_mode sm,customer_address a
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_hash >= 129 and ws.ws_hash <= 529 and d.d_hash >= 143 and d.d_hash <= 893 and a.ca_hash >= 359 and a.ca_hash <= 692
;
