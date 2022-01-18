select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,household_demographics hd,item i,customer c
where ws.ws_order_number = wr.wr_order_number and wr.wr_returning_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and wr.wr_refunded_customer_sk = c.c_customer_sk and ws.ws_hash >= 588 and ws.ws_hash <= 921 and i.i_hash >= 234 and i.i_hash <= 984 and c.c_hash >= 41 and c.c_hash <= 441
;
