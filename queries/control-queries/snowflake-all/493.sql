select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,item i,date_dim d,customer c
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and hd.hd_hash >= 403 and hd.hd_hash <= 803 and d.d_hash >= 333 and d.d_hash <= 666 and c.c_hash >= 230 and c.c_hash <= 980
;
