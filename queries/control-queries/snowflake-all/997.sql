select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer c,household_demographics hd,item i
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and c.c_hash >= 105 and c.c_hash <= 438 and hd.hd_hash >= 31 and hd.hd_hash <= 781 and i.i_hash >= 206 and i.i_hash <= 606
;
