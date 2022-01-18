select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,customer c,date_dim d,item i
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 345 and ws.ws_hash <= 678 and d.d_hash >= 133 and d.d_hash <= 883 and i.i_hash >= 192 and i.i_hash <= 592
;
