select count(ws.ws_item_sk)
from web_sales ws,date_dim d,item i,customer c,household_demographics hd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 432 and i.i_hash <= 832 and c.c_hash >= 31 and c.c_hash <= 781 and hd.hd_hash >= 25 and hd.hd_hash <= 358
;
