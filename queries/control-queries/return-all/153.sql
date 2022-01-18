select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,ship_mode sm,date_dim d,customer c
where ws.ws_order_number = wr.wr_order_number and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_sold_date_sk = d.d_date_sk and wr.wr_refunded_customer_sk = c.c_customer_sk and sm.sm_hash >= 230 and sm.sm_hash <= 980 and d.d_hash >= 304 and d.d_hash <= 704 and c.c_hash >= 347 and c.c_hash <= 680
;
