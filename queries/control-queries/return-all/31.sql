select count(ws.ws_item_sk)
from web_sales ws,date_dim d,web_returns wr,customer c,ship_mode sm
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_hash >= 216 and ws.ws_hash <= 616 and c.c_hash >= 482 and c.c_hash <= 815 and sm.sm_hash >= 135 and sm.sm_hash <= 885
;
