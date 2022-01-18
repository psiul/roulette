select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,item i,customer c,customer_address a
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_hash >= 543 and ws.ws_hash <= 876 and sm.sm_hash >= 25 and sm.sm_hash <= 775 and a.ca_hash >= 151 and a.ca_hash <= 551
;
