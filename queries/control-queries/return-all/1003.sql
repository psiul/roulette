select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,customer c,item i,web_returns wr
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 82 and ws.ws_hash <= 832 and c.c_hash >= 476 and c.c_hash <= 809 and i.i_hash >= 238 and i.i_hash <= 638
;
