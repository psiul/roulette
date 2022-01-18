select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,web_returns wr,customer c,item i
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_order_number = wr.wr_order_number and wr.wr_refunded_customer_sk = c.c_customer_sk and wr.wr_item_sk = i.i_item_sk and sm.sm_hash >= 342 and sm.sm_hash <= 675 and c.c_hash >= 243 and c.c_hash <= 993 and i.i_hash >= 103 and i.i_hash <= 503
;
