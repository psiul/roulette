select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,date_dim d,household_demographics hd,customer c
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and cd.cd_hash >= 271 and cd.cd_hash <= 671 and d.d_hash >= 185 and d.d_hash <= 935 and hd.hd_hash >= 35 and hd.hd_hash <= 368
;
