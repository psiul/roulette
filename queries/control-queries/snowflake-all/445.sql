select count(ws.ws_item_sk)
from web_sales ws,item i,customer c,date_dim d,household_demographics hd
where ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 334 and i.i_hash <= 734 and c.c_hash >= 348 and c.c_hash <= 681 and d.d_hash >= 218 and d.d_hash <= 968
;
