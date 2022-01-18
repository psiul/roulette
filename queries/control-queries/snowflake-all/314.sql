select count(ws.ws_item_sk)
from web_sales ws,customer c,item i,date_dim d,household_demographics hd
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 547 and c.c_hash <= 880 and i.i_hash >= 107 and i.i_hash <= 507 and d.d_hash >= 17 and d.d_hash <= 767
;
