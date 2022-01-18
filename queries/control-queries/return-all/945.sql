select count(ws.ws_item_sk)
from web_sales ws,date_dim d,warehouse w,customer c,customer_address a
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and d.d_hash >= 244 and d.d_hash <= 577 and c.c_hash >= 372 and c.c_hash <= 772 and a.ca_hash >= 125 and a.ca_hash <= 875
;
