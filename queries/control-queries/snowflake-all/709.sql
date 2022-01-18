select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,item i,customer c,date_dim d
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_sold_date_sk = d.d_date_sk and hd.hd_hash >= 51 and hd.hd_hash <= 801 and c.c_hash >= 444 and c.c_hash <= 844 and d.d_hash >= 309 and d.d_hash <= 642
;
