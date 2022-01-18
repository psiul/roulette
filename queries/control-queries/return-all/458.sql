select count(ws.ws_item_sk)
from web_sales ws,date_dim d,web_returns wr,warehouse w,customer c
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_warehouse_sk = w.w_warehouse_sk and wr.wr_refunded_customer_sk = c.c_customer_sk and ws.ws_hash >= 148 and ws.ws_hash <= 898 and d.d_hash >= 113 and d.d_hash <= 513 and c.c_hash >= 439 and c.c_hash <= 772
;
