select count(ws.ws_item_sk)
from web_sales ws,customer c,item i,date_dim d,household_demographics hd
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_ship_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 233 and ws.ws_hash <= 983 and c.c_hash >= 474 and c.c_hash <= 807 and d.d_hash >= 99 and d.d_hash <= 499
;
