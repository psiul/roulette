select count(ws.ws_item_sk)
from web_sales ws,household_demographics hd,customer_demographics cd,customer c,date_dim d
where ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_hash >= 559 and ws.ws_hash <= 959 and c.c_hash >= 310 and c.c_hash <= 643 and d.d_hash >= 115 and d.d_hash <= 865
;
