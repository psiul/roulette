select count(ws.ws_item_sk)
from web_sales ws,customer c,item i,household_demographics hd,date_dim d
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_hash >= 187 and ws.ws_hash <= 937 and c.c_hash >= 624 and c.c_hash <= 957 and d.d_hash >= 72 and d.d_hash <= 472
;
