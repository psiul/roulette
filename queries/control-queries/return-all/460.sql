select count(ws.ws_item_sk)
from web_sales ws,date_dim d,web_returns wr,warehouse w,customer c
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_warehouse_sk = w.w_warehouse_sk and wr.wr_refunded_customer_sk = c.c_customer_sk and ws.ws_hash >= 69 and ws.ws_hash <= 469 and d.d_hash >= 639 and d.d_hash <= 972 and c.c_hash >= 232 and c.c_hash <= 982
;
