select count(ws.ws_item_sk)
from web_sales ws,date_dim d,item i,household_demographics hd,customer c
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and i.i_hash >= 120 and i.i_hash <= 870 and hd.hd_hash >= 229 and hd.hd_hash <= 629 and c.c_hash >= 381 and c.c_hash <= 714
;
