select count(ws.ws_item_sk)
from web_sales ws,customer c,customer_demographics cd,household_demographics hd,date_dim d
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_hash >= 142 and ws.ws_hash <= 542 and c.c_hash >= 43 and c.c_hash <= 793 and d.d_hash >= 490 and d.d_hash <= 823
;
