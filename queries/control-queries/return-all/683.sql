select count(ws.ws_item_sk)
from web_sales ws,date_dim d,household_demographics hd,customer c,customer_demographics cd
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 417 and ws.ws_hash <= 750 and hd.hd_hash >= 108 and hd.hd_hash <= 858 and c.c_hash >= 386 and c.c_hash <= 786
;
