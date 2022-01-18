select count(ws.ws_item_sk)
from web_sales ws,customer c,household_demographics hd,item i,web_returns wr
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_order_number = wr.wr_order_number and c.c_hash >= 117 and c.c_hash <= 867 and hd.hd_hash >= 194 and hd.hd_hash <= 594 and i.i_hash >= 329 and i.i_hash <= 662
;
