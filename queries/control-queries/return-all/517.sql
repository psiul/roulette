select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,item i,household_demographics hd,customer c
where ws.ws_order_number = wr.wr_order_number and wr.wr_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and i.i_hash >= 327 and i.i_hash <= 727 and hd.hd_hash >= 35 and hd.hd_hash <= 785 and c.c_hash >= 12 and c.c_hash <= 345
;
