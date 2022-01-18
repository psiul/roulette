select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer c,customer_address a,web_returns wr
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 27 and ws.ws_hash <= 360 and sm.sm_hash >= 386 and sm.sm_hash <= 786 and a.ca_hash >= 201 and a.ca_hash <= 951
;
