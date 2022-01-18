select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer c,item i,customer_address a
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_hash >= 563 and ws.ws_hash <= 963 and sm.sm_hash >= 217 and sm.sm_hash <= 967 and i.i_hash >= 371 and i.i_hash <= 704
;
