select count(ws.ws_item_sk)
from web_sales ws,warehouse w,date_dim d,customer c,customer_address a
where ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_hash >= 222 and ws.ws_hash <= 555 and d.d_hash >= 18 and d.d_hash <= 418 and c.c_hash >= 142 and c.c_hash <= 892
;
