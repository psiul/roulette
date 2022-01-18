select count(ws.ws_item_sk)
from web_sales ws,customer c,item i,customer_address a,ship_mode sm
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 25 and ws.ws_hash <= 775 and i.i_hash >= 556 and i.i_hash <= 956 and a.ca_hash >= 483 and a.ca_hash <= 816
;
