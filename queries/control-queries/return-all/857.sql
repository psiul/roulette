select count(ws.ws_item_sk)
from web_sales ws,customer c,item i,household_demographics hd,web_returns wr
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 446 and ws.ws_hash <= 779 and c.c_hash >= 138 and c.c_hash <= 888 and hd.hd_hash >= 219 and hd.hd_hash <= 619
;
