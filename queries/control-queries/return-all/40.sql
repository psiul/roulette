select count(ws.ws_item_sk)
from web_sales ws,customer c,warehouse w,date_dim d,customer_address a
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ws.ws_hash >= 97 and ws.ws_hash <= 847 and d.d_hash >= 350 and d.d_hash <= 683 and a.ca_hash >= 196 and a.ca_hash <= 596
;
