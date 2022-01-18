select count(ws.ws_item_sk)
from web_sales ws,date_dim d,ship_mode sm,web_returns wr,customer c
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_order_number = wr.wr_order_number and wr.wr_refunded_customer_sk = c.c_customer_sk and ws.ws_hash >= 85 and ws.ws_hash <= 418 and sm.sm_hash >= 597 and sm.sm_hash <= 997 and c.c_hash >= 196 and c.c_hash <= 946
;
