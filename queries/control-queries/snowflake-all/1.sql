select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,date_dim d,item i,customer c
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and hd.hd_hash >= 460 and hd.hd_hash <= 793 and d.d_hash >= 444 and d.d_hash <= 844 and c.c_hash >= 115 and c.c_hash <= 865
;
