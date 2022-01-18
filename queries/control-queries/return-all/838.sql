select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,date_dim d,item i,customer c
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and hd.hd_hash >= 196 and hd.hd_hash <= 596 and i.i_hash >= 227 and i.i_hash <= 977 and c.c_hash >= 333 and c.c_hash <= 666
;
