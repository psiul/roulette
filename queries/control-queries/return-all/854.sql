select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer c,web_returns wr,ship_mode sm
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 24 and ws.ws_hash <= 774 and d.d_hash >= 66 and d.d_hash <= 466 and c.c_hash >= 503 and c.c_hash <= 836
;
