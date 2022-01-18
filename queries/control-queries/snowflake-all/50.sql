select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer c,household_demographics hd,item i
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_hash >= 169 and ws.ws_hash <= 919 and d.d_hash >= 161 and d.d_hash <= 494 and c.c_hash >= 24 and c.c_hash <= 424
;
