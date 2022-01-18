select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,item i,date_dim d,customer c
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 137 and ws.ws_hash <= 470 and hd.hd_hash >= 349 and hd.hd_hash <= 749 and c.c_hash >= 199 and c.c_hash <= 949
;
