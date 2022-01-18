select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,customer_demographics cd,date_dim d,customer c
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 501 and ws.ws_hash <= 901 and hd.hd_hash >= 188 and hd.hd_hash <= 938 and c.c_hash >= 447 and c.c_hash <= 780
;
