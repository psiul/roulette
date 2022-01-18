select count(ws.ws_item_sk)
from web_sales ws,customer c,warehouse w,item i,customer_address a
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_hash >= 645 and ws.ws_hash <= 978 and c.c_hash >= 224 and c.c_hash <= 974 and a.ca_hash >= 97 and a.ca_hash <= 497
;
