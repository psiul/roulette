select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer c,web_returns wr,date_dim d
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_hash >= 498 and ws.ws_hash <= 898 and c.c_hash >= 332 and c.c_hash <= 665 and d.d_hash >= 210 and d.d_hash <= 960
;
