select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer_demographics cd,household_demographics hd,customer c
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 138 and ws.ws_hash <= 888 and cd.cd_hash >= 553 and cd.cd_hash <= 953 and hd.hd_hash >= 366 and hd.hd_hash <= 699
;
