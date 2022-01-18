select count(ws.ws_item_sk)
from web_sales ws,date_dim d,item i,customer c,household_demographics hd
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 121 and i.i_hash <= 454 and c.c_hash >= 546 and c.c_hash <= 946 and hd.hd_hash >= 138 and hd.hd_hash <= 888
;
