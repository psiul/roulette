select count(ws.ws_item_sk)
from web_sales ws,customer c,warehouse w,customer_address a,date_dim d
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_ship_date_sk = d.d_date_sk and c.c_hash >= 186 and c.c_hash <= 519 and a.ca_hash >= 576 and a.ca_hash <= 976 and d.d_hash >= 188 and d.d_hash <= 938
;
