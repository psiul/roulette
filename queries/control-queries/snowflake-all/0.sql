select count(ws.ws_item_sk)
from web_sales ws,date_dim d,item i,warehouse w,customer c
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 154 and ws.ws_hash <= 904 and d.d_hash >= 128 and d.d_hash <= 528 and c.c_hash >= 75 and c.c_hash <= 408
;
