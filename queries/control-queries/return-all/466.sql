select count(ws.ws_item_sk)
from web_sales ws,item i,household_demographics hd,date_dim d,customer c
where ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 22 and ws.ws_hash <= 772 and i.i_hash >= 457 and i.i_hash <= 857 and hd.hd_hash >= 170 and hd.hd_hash <= 503
;
